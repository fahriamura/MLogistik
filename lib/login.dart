import 'package:flutter/material.dart';
import 'package:logistik/menu_wakasek_page.dart';
import 'dashboard.dart';
import 'services/api_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = "";
  String _password = "";
  int id = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "M-Logistik",
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Averia Serif Libre',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 99, 180),
                    border: Border.all(color: const Color(0xff475BD8)),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "E-mail",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-0.5, -0.5),
                                color: Colors.black),
                            Shadow(
                                // bottomRight
                                offset: Offset(0.5, -0.5),
                                color: Colors.black),
                            Shadow(
                                // topRight
                                offset: Offset(0.5, 0.5),
                                color: Colors.black),
                            Shadow(
                                // topLeft
                                offset: Offset(-0.5, 0.5),
                                color: Colors.black),
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromARGB(255, 5, 5, 6)),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration.collapsed(
                            hintText: "mikhail@logistik.com"),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-0.5, -0.5),
                                color: Colors.black),
                            Shadow(
                                // bottomRight
                                offset: Offset(0.5, -0.5),
                                color: Colors.black),
                            Shadow(
                                // topRight
                                offset: Offset(0.5, 0.5),
                                color: Colors.black),
                            Shadow(
                                // topLeft
                                offset: Offset(-0.5, 0.5),
                                color: Colors.black),
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromARGB(255, 1, 1, 1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration.collapsed(
                            hintText: "password"),
                        obscureText: true,
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 254, 255),
                          border: Border.all(color: const Color(0xff475BD8)),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        onPressed: () async {
                          bool canLogin =
                              await SetupAPI().login(email, _password);
                          if (canLogin) {
                            if (email.contains("logistik")) {
                              Route route = MaterialPageRoute(
                                  builder: (context) => const dashboard());
                              Navigator.push(context, route);
                            } else {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      const MenuWakasekPage());
                              Navigator.push(context, route);
                            }
                          } else {
                            showDialog(
                              context: context, // Use the local context here.
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: SingleChildScrollView(
                                      child: ListBody(
                                    children: [
                                      Text(
                                        "E-mail atau Password Salah!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      )
                                    ],
                                  )),
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
