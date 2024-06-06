import 'package:flutter/material.dart';

class SignUpInputBox extends StatelessWidget {
  final String placeholder;
  final bool? password;
  final TextEditingController controller;
  final TextInputType? textInputType;
  const SignUpInputBox({
    super.key,
    this.password,
    this.textInputType,
    required this.placeholder,
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
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: password ?? false,
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
            controller: controller,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
