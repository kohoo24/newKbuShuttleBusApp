import 'package:flutter/material.dart';

class SeatColumn extends StatelessWidget {
  final String label;

  const SeatColumn({
    super.key,
    required this.label,
  });

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
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
        _buildSeat(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSeat() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
