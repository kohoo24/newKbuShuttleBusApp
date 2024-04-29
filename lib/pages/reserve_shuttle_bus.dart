import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/widgets/SeatColumn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 80,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    '좌석 예약 현황',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildColumnNumbers(),
                        const SizedBox(width: 24),
                        const SeatColumn(label: '1'),
                        const SizedBox(width: 30),
                        const SeatColumn(label: '2'),
                        const SizedBox(width: 80),
                        const SeatColumn(label: '3'),
                        const SizedBox(width: 30),
                        const SeatColumn(label: '4'),
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
                ),
              ),
            ),
          ],
        ),
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
