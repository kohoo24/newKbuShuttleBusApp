import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Delete {
  void deleteReserve(BuildContext context, {outerKey, innerKey}) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('busReservation/$outerKey');

    await ref.child(innerKey).remove().whenComplete(() {
      Navigator.pop(context);
      return debugPrint('statement');
    });
  }
}
