import 'package:firebase_database/firebase_database.dart';

class Update {
  void updateLocation(String dataKey, double busLat, double busLong) async {
    return FirebaseDatabase.instance
        .ref('shuttle_core/$dataKey/bus_location')
        .update({
      'bus_lat': busLat,
      'bus_long': busLong,
    });
  }

  ///updateSheetCount <br><br>
  ///@parms datakey 데이터 table 키<br>
  ///@parms sheetCount 좌석 수<br>
  void updateSheetCount(
      {required String dataKey, required int sheetCount}) async {
    return FirebaseDatabase.instance
        .ref('shuttle_core/$dataKey/bus_sheet')
        .update({
      'sheet_count': sheetCount.toString(),
    });
  }
}
