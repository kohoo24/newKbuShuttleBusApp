import 'package:flutter/material.dart';

class SignUpInputBox extends StatelessWidget {
  final String placeholder;

  const SignUpInputBox({
    super.key,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blue.shade100,
                  width: 1,
                ),
              ),
              labelText: placeholder,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
