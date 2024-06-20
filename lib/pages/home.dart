//메인 페이지
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kbushuttlebus01/pages/account/login.dart';
import 'package:kbushuttlebus01/pages/bus_card.dart';
import 'package:kbushuttlebus01/pages/reserve_shuttle_bus_detail.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:kbushuttlebus01/server/api/client_firebase.dart' as client;

class KbuShuttleBusMain extends StatelessWidget {
  const KbuShuttleBusMain({
    super.key,
    required this.name,
    required this.studentId,
    required this.dept,
  });
  final String name;
  final String studentId;
  final String dept;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: const Offset(0, 190),
            child: Container(
              width: double.infinity,
              height: 783,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      children: [
                        const Text(
                          '버스 정보',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          width: 180,
                        ),
                        FutureBuilder(
                            future: client.Read().fetchData(studentId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.isNotEmpty) {
                                  final data =
                                      snapshot.data!.entries.first.value;

                                  debugPrint(data.toString());
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyReservation(
                                            innerKey: snapshot.data!.keys.first,
                                            outerKey: data['outerKey'],
                                            sheetPoint: data['sheetCode'],
                                            name: name,
                                            studentId: studentId,
                                            dept: dept,
                                            stationName: data['stationName'],
                                            busCode: 'busCode',
                                            date: data['date'],
                                            reservated: true,
                                          ),
                                        )),
                                    child: const Text("나의 예약"),
                                  );
                                } else {
                                  return const Text('예약 없음');
                                }
                              } else {
                                return const Text('로딩중..');
                              }
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: client.Read().fetchBusDataKey(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data!;
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (_, index) => BusCard(
                                  busCode: data[index]['busCode'],
                                  stationName: data[index]['lastStopPoint'],
                                  busStartTime: data[index]['depart_time'],
                                  remainingTime: 'null',
                                  name: name,
                                  studentId: studentId,
                                  dept: dept,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 130),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 10.0,
                            offset: const Offset(
                                8, 8), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.05),
                                  ),
                                ),
                                child: Center(
                                  child: QrImageView(
                                    data: studentId,
                                    version: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '이름',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '학번',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    studentId,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '학과',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    dept,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-20, -115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'KBU 셔틀버스',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        width: 42,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const KbuShuttleBus()),
                          );
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(140, -198),
                  child: Transform.scale(
                    scale: 0.15,
                    child: Image.asset('assets/images/bus.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
