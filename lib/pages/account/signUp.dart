//회원가입 페이지
import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/account/login.dart';
import 'package:kbushuttlebus01/widgets/SignUPInputBox.dart';

class KbuShuttleBusSignUp01 extends StatelessWidget {
  const KbuShuttleBusSignUp01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 25),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const KbuShuttleBus()),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 179,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 60,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const SignUpInputBox(placeholder: '학과'),
                        const SignUpInputBox(placeholder: '이름'),
                        const SignUpInputBox(placeholder: '비밀번호'),
                        const SignUpInputBox(placeholder: '성별'),
                        const SignUpInputBox(placeholder: '학번'),
                        const SizedBox(
                          height: 11,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: const MaterialStatePropertyAll(
                                Size(500, 60),
                              ),
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.blue.shade900,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const KbuShuttleBus()),
                              );
                            },
                            child: const Text(
                              '회원가입',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
