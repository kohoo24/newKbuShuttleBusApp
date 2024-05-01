import 'package:flutter/material.dart';

class LoginBox extends StatelessWidget {
  final String placeholder;
  final bool password;
  final TextEditingController controller;

  const LoginBox({
    super.key,
    required this.placeholder,
    required this.password,
    required this.controller,
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
            obscureText: password,
            controller: controller,
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
          height: 20,
        ),
      ],
    );
  }
}
