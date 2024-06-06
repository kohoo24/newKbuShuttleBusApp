import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Create {
  Future<bool> onReservation(String busCode,
      {required String studentId,
      required String date,
      required String sheetCode,
      required String stationName}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('busReservation');
    final snapshot = await ref.get(); // 전체 예약 데이터를 가져옵니다.

    if (snapshot.exists) {
      bool alreadyRegistered = false;

      // 모든 예약 데이터를 검사하여 student_id가 이미 있는지 확인합니다.
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      for (var bus in data.entries) {
        for (var reservation in bus.value.entries) {
          var details = Map<String, dynamic>.from(reservation.value);
          if (details['student_id'] == studentId) {
            alreadyRegistered = true;
            break;
          }
        }
        if (alreadyRegistered) break;
      }

      if (!alreadyRegistered) {
        // 해당 student_id로 등록된 정보가 없으면 새로운 예약을 추가합니다.
        DatabaseReference newRef =
            FirebaseDatabase.instance.ref('busReservation/$busCode');
        await newRef.push().set({
          'student_id': studentId,
          'date': date,
          'sheetCode': sheetCode,
          'stationName': stationName,
        }).then((value) => debugPrint('예약 완료'));
        return true;
      } else {
        debugPrint('이미 다른 좌석이 예약되어있습니다. \n 해당 예약을 취소하시고, 다시 예약해주세요');
        return false;
      }
    } else {
      // 예약 데이터가 없는 경우, 새 예약을 진행합니다.
      DatabaseReference newRef =
          FirebaseDatabase.instance.ref('busReservation/$busCode');
      await newRef.push().set({
        'student_id': studentId,
        'date': date,
        'sheetCode': sheetCode,
        'stationName': stationName,
      }).then((value) => debugPrint('예약 완료'));
      return true;
    }
  }
}
