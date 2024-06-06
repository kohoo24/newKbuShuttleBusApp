//회원가입 페이지
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kbushuttlebus01/pages/account/login.dart';
import 'package:kbushuttlebus01/widgets/SignUPInputBox.dart';

class KbuShuttleBusSignUp01 extends StatefulWidget {
  const KbuShuttleBusSignUp01({super.key});

  @override
  State<KbuShuttleBusSignUp01> createState() => _KbuShuttleBusSignUp01State();
}

class _KbuShuttleBusSignUp01State extends State<KbuShuttleBusSignUp01> {
  final deptTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final sexTextController = TextEditingController();
  final stuNumTextController = TextEditingController();

  void handleSignUp() {
    final String strDept = deptTextController.value.text;
    final String strName = nameTextController.value.text;
    final String strPassword = passwordTextController.value.text;
    final String strSex = sexTextController.value.text;
    final String strStudentNum = stuNumTextController.value.text;

    final ref = FirebaseDatabase.instance.ref('users');
    ref.push().set({
      'Dept': strDept,
      'Name': strName,
      'Password': strPassword,
      'Sex': strSex,
      'StudentNum': strStudentNum,
    });
  }

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
                        SignUpInputBox(
                          placeholder: '학과',
                          controller: deptTextController,
                        ),
                        SignUpInputBox(
                          placeholder: '이름',
                          controller: nameTextController,
                        ),
                        SignUpInputBox(
                          password: true,
                          placeholder: '비밀번호',
                          controller: passwordTextController,
                        ),
                        SignUpInputBox(
                          placeholder: '성별',
                          controller: sexTextController,
                        ),
                        SignUpInputBox(
                          placeholder: '학번',
                          controller: stuNumTextController,
                          textInputType: TextInputType.number,
                        ),
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
                              handleSignUp();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const KbuShuttleBus()),
                              // );
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
