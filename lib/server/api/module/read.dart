import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Read {
  Future<List<Map<String, dynamic>>> getLicense() async {
    Completer<List<Map<String, dynamic>>> completer = Completer();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('users');
    try {
      DatabaseEvent dataSnapshot = await databaseReference.once();
      Map<dynamic, dynamic>? userData =
          dataSnapshot.snapshot.value as Map<dynamic, dynamic>?;
      List<Map<String, dynamic>> licenseList = userData!.entries.map((e) {
        return {
          'userDataKey': e.key as String,
          'studentId': e.value['student_id'] as int,
          'password': e.value['password'] as String,
          'name': e.value['name'] as String,
          'dept': e.value['department'] as String,
        };
      }).toList();
      completer.complete(licenseList);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<List<Map<String, dynamic>>> fetchBusReserve(
      {required String busCode}) async {
    Completer<List<Map<String, dynamic>>> completer = Completer();

    DatabaseReference ref =
        FirebaseDatabase.instance.ref('busReservation/$busCode');
    try {
      DatabaseEvent dataSnapshot = await ref.once();
      print(dataSnapshot.snapshot.value);
      Map<dynamic, dynamic>? busSheetData =
          dataSnapshot.snapshot.value as Map<dynamic, dynamic>?;
      if (busSheetData != null) {
        List<Map<String, dynamic>> busSheetDatas =
            busSheetData.entries.map((e) {
          return {
            'reservatKey': e.key,
            'date': e.value['date'] as String,
            'sheetCode': e.value['sheetCode'] as String,
          };
        }).toList();
        debugPrint('$busSheetDatas');
      } else {
        completer.complete([]);
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<List<Map<String, dynamic>>> fetchFirstSectionData(
      String currentBusKey) async {
    Completer<List<Map<String, dynamic>>> completer = Completer();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('shuttle_core/$currentBusKey');

    try {
      DatabaseEvent dataSnapshot = await databaseReference.once();
      Map<dynamic, dynamic>? userData =
          dataSnapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (userData != null) {
        List<Map<String, dynamic>> data = [
          {
            'sheet_count': userData['bus_sheet']['sheet_count'],
            'laststop_point': userData['laststop_point'],
          }
        ];
        completer.complete(data);
      } else {
        completer.complete([
          {'userData': 'null'}
        ]);
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<List<Map<String, dynamic>>> fetchBusDataKey() async {
    Completer<List<Map<String, dynamic>>> completer = Completer();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('shuttle_core');
    try {
      DatabaseEvent dataSnapshot = await databaseReference.once();
      Map<dynamic, dynamic>? userData =
          dataSnapshot.snapshot.value as Map<dynamic, dynamic>?;
      if (userData != null) {
        List<Map<String, dynamic>> licenseList = userData.entries.map((e) {
          return {
            'busDataKey': e.key as String,
            'busCode': e.value['bus_license'] as String,
            'depart_time': e.value['depart_time'] as String,
            'lastStopPoint': e.value['laststop_point'] as String,
          };
        }).toList();
        completer.complete(licenseList);
      } else {
        completer.complete([]);
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}
