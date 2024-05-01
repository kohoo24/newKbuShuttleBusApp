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
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: ingBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: possibilityBox()),
        const SizedBox(height: 20),
        _buildSeat(statusDecoration: ingBox()),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSeat({required BoxDecoration statusDecoration}) {
    return Container(
      width: 40,
      height: 40,
      decoration: statusDecoration,
    );
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
}
