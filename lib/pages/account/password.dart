import 'package:flutter/material.dart';

class FindPwd extends StatelessWidget {
  const FindPwd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
        ),
        const Text(
          "비밀번호찾기",
          style: TextStyle(fontSize: 30),
        ),
      ]),
    ));
  }
}
