import 'package:firebase_database/firebase_database.dart';

class Delete {
  void deleteReserve() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('busReservation');

    ref.remove();
  }
}
