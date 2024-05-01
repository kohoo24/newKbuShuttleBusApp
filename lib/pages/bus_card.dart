//메인 페이지

import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/reserve_shuttle_bus.dart';

class BusCard extends StatelessWidget {
  const BusCard({
    super.key,
    required this.stationName,
    required this.busStartTime,
    required this.remainingTime,
  });
  final stationName;
  final busStartTime;
  final remainingTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Reservation()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '정류장',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          stationName,
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
                          '버스 출발시간',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          busStartTime,
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
                          '남은 시간',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          remainingTime,
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
    );
  }
}
