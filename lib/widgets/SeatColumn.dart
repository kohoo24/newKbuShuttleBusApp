import 'package:flutter/material.dart';

class SeatColumn extends StatelessWidget {
  final String label;
  final BoxDecoration statusDecoration;
  const SeatColumn(
      {super.key, required this.label, required this.statusDecoration});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff000000),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
        buildSeat(statusDecoration: statusDecoration),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildSeat({required BoxDecoration statusDecoration}) {
    return Container(
      width: 40,
      height: 40,
      decoration: statusDecoration,
    );
  }
}
