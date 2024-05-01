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

  Future<List<String>> fetchBusDataKey() async {
    Completer<List<String>> completer = Completer();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('shuttle_core');

    try {
      DatabaseEvent dataSnapshot = await databaseReference.once();
      Map<dynamic, dynamic>? userData =
          dataSnapshot.snapshot.value as Map<dynamic, dynamic>?;
      if (userData != null) {
        List<String> licenseList =
            userData.keys.map((e) => e.value as String).toList();
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
