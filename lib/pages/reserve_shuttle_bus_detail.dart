import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/home.dart';
import 'package:kbushuttlebus01/server/api/client_firebase.dart' as client;

class MyReservation extends StatelessWidget {
  MyReservation({
    super.key,
    required this.sheetPoint,
    required this.name,
    required this.studentId,
    required this.dept,
    required this.stationName,
    required this.busCode,
    this.date,
    this.reservated = false,
  });
  final busCode;
  final name;
  final studentId;
  final dept;
  final stationName;
  final String sheetPoint;
  final String? date;
  bool? reservated;
  @override
  Widget build(BuildContext context) {
    final DateTime date;

    date = this.date != null
        ? DateTime.fromMicrosecondsSinceEpoch(int.parse(this.date!))
        : DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
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
                  '좌석 예약 정보',
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
            height: 40,
          ),
          Container(
            height: 600,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            dept,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            studentId,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Divider(color: Colors.black, thickness: 1.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('예약 좌석'),
                  Text(
                    sheetPoint,
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Divider(color: Colors.black, thickness: 1.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('예약 날짜'),
                  Text(
                    '${date.year}년 ${date.month}월 ${date.day}일',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('예약 버스'),
                  Text(
                    '$stationName - 경복대학교',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: reservated!
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(14)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        child: Center(child: Text('예약 취소')),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      debugPrint('$busCode,$studentId,$date,$sheetPoint');
                      bool result = await client.Create().onReservation(
                        busCode,
                        studentId: studentId,
                        date: date.microsecondsSinceEpoch.toString(),
                        sheetCode: sheetPoint,
                        stationName: stationName,
                      );

                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '$stationName 에서 출발하는 셔틀버스의 $sheetPoint좌석을 예약하였습니다.',
                            ),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KbuShuttleBusMain(
                                name: name, studentId: studentId, dept: dept),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                '이미 다른 좌석을 예약하였습니다.\n나의 예약에서 확인하신후 취소하고 다시 예약해주세요.')));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(14)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        child: Center(child: Text('예약하기')),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
