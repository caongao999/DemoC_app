import 'package:flutter/material.dart';
import 'package:untitled1/src/pages/Register.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 140,
                ),
                //Image.asset('logo.png'),
                //Image(image: NetworkImage('https://play-lh.googleusercontent.com/R6l6YloXRmlHQOVrMpZ0KTcQ-dfxlGFMnGLwbBA03ufsMwKy1TD5WUm7HVe3_8Vv2Q')),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text("Welcome back Brooo!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Login to using C-app",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Container(
                        width: 50,
                        child: Icon(Icons.email),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                          BorderSide(color: Colors.black38, width: 10),
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.password),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black38, width: 10),
                            borderRadius: BorderRadius.circular(20.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("Forget password?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,

                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GoHome(context)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.fromLTRB(160, 20, 160, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: Text("Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("New User ? ",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,

                        ),),
                      SizedBox(width: 6,),
                      GestureDetector(   //là hàm cha cho cái text có thể onTap => tạo event cho text
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => GoRegister(context)));
                        },
                        child: Text("Register",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                        ),),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget GoRegister(BuildContext context) {
    return Register();
  }
  Widget GoHome(BuildContext context) {
    return Home();
  }
}
