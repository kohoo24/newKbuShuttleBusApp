import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/reserve_shuttle_bus_detail.dart';
import 'package:kbushuttlebus01/server/api/client_firebase.dart' as client;

class Reservation extends StatefulWidget {
  const Reservation({
    super.key,
    required this.busCode,
    required this.name,
    required this.studentId,
    required this.dept,
    required this.stationName,
  });

  final String busCode;
  final String name;
  final String studentId;
  final String dept;
  final String stationName;

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: client.Read().fetchBusReserve(busCode: widget.busCode),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    debugPrint('${snapshot.error}');
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData) {
                    return _buildLoading();
                  }
                  List<Map<String, dynamic>> reservations = snapshot.data!;
                  return _buildSeatTable(reservations);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 20,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
          ),
          const Text(
            '좌석 예약 현황',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('로딩중..'),
        ],
      ),
    );
  }

  Widget _buildSeatTable(List<Map<String, dynamic>> reservations) {
    return Column(
      children: [
        Table(
          children: [
            const TableRow(children: [
              SizedBox(),
              Text('1', textAlign: TextAlign.center),
              Text('2', textAlign: TextAlign.center),
              SizedBox(),
              Text('3', textAlign: TextAlign.center),
              Text('4', textAlign: TextAlign.center)
            ]),
            for (int j = 0; j < 11; j++) _buildTableRow(j, reservations),
          ],
        ),
        _buildLegend(),
      ],
    );
  }

  TableRow _buildTableRow(
      int rowIndex, List<Map<String, dynamic>> reservations) {
    return TableRow(children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(
          '${rowIndex + 1}',
          textAlign: TextAlign.center,
        ),
      ),
      for (int i = 0; i < 2; i++) _buildTableCell(i, rowIndex, reservations),
      const TableCell(child: SizedBox(width: 10)),
      for (int i = 2; i < 4; i++) _buildTableCell(i, rowIndex, reservations),
    ]);
  }

  TableCell _buildTableCell(
      int i, int j, List<Map<String, dynamic>> reservations) {
    String sheetCode = '${i + 1}-${j + 1}';
    bool reservationState = false;
    bool isReserved = reservations.any((reservation) {
      if (reservation['sheetCode'] == sheetCode) {
        reservationState = (reservation['studentId'] == widget.studentId);
        return true;
      }
      return false;
    });
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            debugPrint('sheetPoint is $sheetCode');
            if (reservationState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('이미 예약된 좌석이 있습니다.'),
                ),
              );
            } else {
              if (!isReserved) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyReservation(
                      busCode: widget.busCode,
                      sheetPoint: sheetCode,
                      name: widget.name,
                      studentId: widget.studentId,
                      dept: widget.dept,
                      stationName: widget.stationName,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('hello'),
                  ),
                );
              }
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration:
                seatBoxDecoration(sheetCode, isReserved, reservationState),
          ),
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        const Text('예약 완료'),
        const SizedBox(width: 20),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
          ),
        ),
        const SizedBox(width: 10),
        const Text('예약 중'),
        const SizedBox(width: 20),
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
        ),
        const SizedBox(width: 10),
        const Text('예약 가능'),
      ],
    );
  }

  Widget _buildColumnNumbers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        _buildNumberText('1'),
        _buildNumberText('2'),
        _buildNumberText('3'),
        _buildNumberText('4'),
        _buildNumberText('5'),
        _buildNumberText('6'),
        _buildNumberText('7'),
        _buildNumberText('8'),
        _buildNumberText('9'),
        _buildNumberText('10'),
        _buildNumberText('11'),
      ],
    );
  }

  Widget _buildNumberText(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff000000),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

BoxDecoration possibilityBox() {
  return BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration ingBox() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.blue),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration completedBox() {
  return BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration seatBoxDecoration(
    String sheetCode, bool isReserved, bool reservationState) {
  if (isReserved) {
    if (reservationState) {
      return completedBox(); // 현재 사용자의 예약
    } else {
      return ingBox(); // 다른 사용자의 예약
    }
  } else {
    return possibilityBox(); // 예약 가능
  }
}
