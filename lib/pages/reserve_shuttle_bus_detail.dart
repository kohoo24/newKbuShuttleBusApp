import 'package:flutter/material.dart';

class MyReservation extends StatelessWidget {
  const MyReservation({super.key});

  @override
  Widget build(BuildContext context) {
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '고호현',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '소프트웨어융합과',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '2001003',
                            style: TextStyle(
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
                  const Text(
                    '3-4',
                    style: TextStyle(
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
                  const Text(
                    '2024-04-29',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('예약 버스'),
                  const Text(
                    '당고개역 - 경복대학교',
                    style: TextStyle(
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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(14)),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                ),

                //여기는 뭘 넣어야할 지 모르겠음.
                child: Center(child: Text('예약하기')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
