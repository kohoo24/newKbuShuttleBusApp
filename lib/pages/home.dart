//메인 페이지
import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/account/login.dart';
import 'package:kbushuttlebus01/pages/bus_card.dart';
import 'package:kbushuttlebus01/pages/reserve_shuttle_bus_detail.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyReservation()),
                              );
                            },
                            child: const Text("나의 예약")),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            BusCard(
                              stationName: '구리아웃렛',
                              busStartTime: '오전 09시 00분',
                              remainingTime: '92분',
                            ),
                            BusCard(
                              stationName: '구리아웃렛',
                              busStartTime: '오전 09시 00분',
                              remainingTime: '92분',
                            ),
                            BusCard(
                              stationName: '구리아웃렛',
                              busStartTime: '오전 09시 00분',
                              remainingTime: '92분',
                            ),
                            //! ------------------
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
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
                                )),
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
