import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/account/password.dart';
import 'package:kbushuttlebus01/pages/home.dart';
import 'package:kbushuttlebus01/pages/account/signUp.dart';
import 'package:kbushuttlebus01/widgets/loginInputBox.dart';
import 'package:kbushuttlebus01/server/api/client_firebase.dart' as client;

class KbuShuttleBus extends StatelessWidget {
  const KbuShuttleBus({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerID = TextEditingController();
    TextEditingController controllerPWD = TextEditingController();
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
                      height: MediaQuery.of(context).size.height,
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
                            LoginBox(
                              placeholder: '학번',
                              password: false,
                              controller: controllerID,
                            ),
                            LoginBox(
                              placeholder: '비밀번호',
                              password: true,
                              controller: controllerPWD,
                            ),
                            FutureBuilder(
                                future: client.Read().getLicense(),
                                builder: (_, snapshot) {
                                  if (snapshot.hasError) {
                                    debugPrint('${snapshot.error}');
                                  }
                                  if (snapshot.hasData) {
                                    return Center(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize:
                                              const MaterialStatePropertyAll(
                                            Size(500, 60),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Colors.blue.shade900,
                                          ),
                                        ),
                                        onPressed: () {
                                          for (var element in snapshot.data!) {
                                            debugPrint(
                                                '${element['studentId']}');
                                            if (element['studentId']
                                                        .toString() ==
                                                    controllerID.text &&
                                                element['password'] ==
                                                    controllerPWD.text) {
                                              debugPrint(
                                                  '데이터 일치 ${element['studentId']} == ${controllerID.text} \n ${element['password']} == ${controllerPWD.text}');

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      KbuShuttleBusMain(
                                                    name: element['name'],
                                                    studentId:
                                                        element['studentId']
                                                            .toString(),
                                                    dept: element['dept'],
                                                  ),
                                                ),
                                              );
                                            } else {
                                              debugPrint(
                                                  '데이터 불일치 ${element['studentId']} != ${controllerID.text} \n ${element['password']} == ${controllerPWD.text}');
                                            }
                                          }
                                        },
                                        child: const Text(
                                          '로그인',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FindPwd()),
                                );
                              },
                              child: const Text(
                                '비밀번호를 잊어버리셨나요?',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
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
