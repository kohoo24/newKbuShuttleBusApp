import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/widgets/loginInputBox.dart';

class KbuShuttleBus01 extends StatelessWidget {
  const KbuShuttleBus01({super.key});

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
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 120,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            const LoginBox(
                              placeholder: '학번',
                              password: false,
                            ),
                            const LoginBox(
                              placeholder: '비밀번호',
                              password: true,
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
                                          const KbuShuttleBusMain01(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  '로그인',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '비밀번호를 잊어버리셨나요?',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 175,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KbuShuttleBusSignUp01()),
                                    );
                                  },
                                  child: const Text(
                                    '회원가입',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14),
                  child: Transform.translate(
                    offset: const Offset(140, 90),
                    child: Transform.scale(
                      scale: 0.3,
                      child: Image.asset('assets/images/bus.png'),
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
