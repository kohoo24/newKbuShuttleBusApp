import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/reserve_shuttle_bus_detail.dart';
import 'package:kbushuttlebus01/server/api/client_firebase.dart' as client;

class Reservation extends StatelessWidget {
  const Reservation(
      {super.key,
      required this.busCode,
      required this.name,
      required this.studentId,
      required this.dept,
      required this.stationName});
  final busCode;
  final name;
  final studentId;
  final dept;
  final stationName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
              ),
              child: FutureBuilder(
                  future: client.Read().fetchBusReserve(busCode: busCode),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      debugPrint('${snapshot.error}');
                    }
                    debugPrint(snapshot.hasData.toString());
                    if (snapshot.hasData) {
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
                              for (int j = 0; j < 11; j++)
                                TableRow(children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      '${j + 1}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  for (int i = 0; i < 2; i++)
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                                'sheetPoint is ${i + 1}-${j + 1}');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MyReservation(
                                                          busCode: busCode,
                                                          sheetPoint:
                                                              '${i + 1}-${j + 1}',
                                                          name: name,
                                                          studentId: studentId,
                                                          dept: dept,
                                                          stationName:
                                                              stationName,
                                                        )));
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: possibilityBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const TableCell(
                                      child: SizedBox(
                                    width: 10,
                                  )),
                                  for (int i = 2; i < 4; i++)
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                                'sheetPoint is ${i + 1}-${j + 1}');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MyReservation(
                                                          busCode: busCode,
                                                          sheetPoint:
                                                              '${i + 1}-${j + 1}',
                                                          name: name,
                                                          studentId: studentId,
                                                          dept: dept,
                                                          stationName:
                                                              stationName,
                                                        )));
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: possibilityBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                ]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('예약 완료'),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.blue)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('예약 중'),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('예약 가능'),
                            ],
                          )
                        ],
                      );
                    } else {
                      return const Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text('로딩중..'),
                        ],
                      ));
                    }
                  }),
            ),
          ),
        ],
      ),
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
