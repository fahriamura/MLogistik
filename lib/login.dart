import 'package:flutter/material.dart';
import 'package:logistik/dashboard.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
  return Scaffold(
    body : Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Image.asset(
           // "assets/img/logo.png",
           // height: 80,
           // width: 80,
           // ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                color: Colors.black),
              ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black),
              ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Averia Serif Libre',
                fontWeight: FontWeight.w500,
                color: Colors.black),
              ),
            const SizedBox(
              height: 100,
            ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 99, 180),
                  border: Border.all(color: Color(0xff475BD8)),
                  borderRadius: BorderRadius.circular(30)),
                  child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children :<Widget>[
                  Text("Username",
                 textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                shadows: [
                  Shadow( // bottomLeft
                    offset: Offset(-0.5, -0.5),
                    color: Colors.black
                  ),
                  Shadow( // bottomRight
                    offset: Offset(0.5, -0.5),
                    color: Colors.black
                  ),
                  Shadow( // topRight
                    offset: Offset(0.5, 0.5),
                    color: Colors.black
                  ),
                  Shadow( // topLeft
                    offset: Offset(-0.5, 0.5),
                    color: Colors.black
                  ),
                ]
                  ),),
                  const SizedBox(height: 10,),
                  Container(
                  height: MediaQuery.of(context).size.height *0.07,
                  width :double.infinity,
                  padding:EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 5, 5, 6)),
                  borderRadius: BorderRadius.circular(10)),
                  child :TextFormField(
                    decoration: InputDecoration.collapsed(hintText: ""),
                  ),
                  ),
                  const SizedBox(
                  height: 30,
                  ),
                Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                shadows: [
                  Shadow( // bottomLeft
                    offset: Offset(-0.5, -0.5),
                    color: Colors.black
                  ),
                  Shadow( // bottomRight
                    offset: Offset(0.5, -0.5),
                    color: Colors.black
                  ),
                  Shadow( // topRight
                    offset: Offset(0.5, 0.5),
                    color: Colors.black
                  ),
                  Shadow( // topLeft
                    offset: Offset(-0.5, 0.5),
                    color: Colors.black
                  ),
                ]
                  ),),
                const SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height *0.07,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color.fromARGB(255, 1, 1, 1)),
                    borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(hintText: ""),
                  ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                Container(
                  height: 50,
                  width: 150,

                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 254, 254, 255),
                    border: Border.all(color: Color(0xff475BD8)),
                    borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(builder: (context) => dashboard());
                      Navigator.push(context,route);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500),
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
            