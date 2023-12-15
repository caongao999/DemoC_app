

import 'package:flutter/material.dart';
import 'package:untitled1/src/BloC/bloC1.dart';
import 'Home.dart';
import 'Login.dart';
class Register extends StatelessWidget {
   //Register({super.key});

  bloC1 bloc1check = bloC1();

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();


  void clickRegister(BuildContext context) {
    int? phoneNumber = int.tryParse(_phoneController.text);

    if (phoneNumber != null && bloc1check.isValidIn4(_userController.text, _passController.text, phoneNumber)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GoHome(context)));
    } else {
      print("Không hợp lệ");
    }
  }

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
                Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                  child: Icon(Icons.logo_dev_sharp),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text("Welcome to Brooo!",
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
                  padding: const EdgeInsets.only(top: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.person),
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
                  child: StreamBuilder<Object?>(
                    stream: bloc1check.phoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? (snapshot.error as String?) : null,
                            labelText: "Phone Number",
                            prefixIcon: Container(
                              width: 50,
                              child: Icon(Icons.phone),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black38, width: 10),
                                borderRadius: BorderRadius.circular(20.0)
                            )
                        ),
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: StreamBuilder<Object?>(
                    stream: bloc1check.userStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _userController,
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? (snapshot.error as String?) : null,
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
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: StreamBuilder<Object?>(
                    stream: bloc1check.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? (snapshot.error as String?) : null,
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
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
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
                  padding: const EdgeInsets.only(top: 20),
                  child:ElevatedButton(

                    onPressed: () {
                      // Xử lý sự kiện khi nút được nhấn
                      clickRegister(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.fromLTRB(150, 20, 150, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Container( // Bọc văn bản bằng Container
                      alignment: Alignment.center, // Đặt căn giữa văn bản
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Alreadly a User ? ",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,

                        ),),
                      SizedBox(width: 6,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> GoLogin(context) ));
                        },
                        child: Text("Login",
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
  Widget GoLogin(BuildContext context) {
    return Login();
  }

  Widget GoHome(BuildContext context) {
    return Home();
  }
}
