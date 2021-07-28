import 'package:day30/routes/routes.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changedButton = false;
  moveToHome(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });
    }

    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, Myroutes.homeRoute);
    setState(() {
      changedButton = false;
    });
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 30),
                Image.asset("assets/s.jpg",
                    height: 200, width: 250, fit: BoxFit.cover),
                SizedBox(height: 30),
                Text("welcome $name",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "username",
                        ),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return " username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            labelText: "password"),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return " username cannot be empty";
                          }
                          if (value.length < 6 ) {
                            return " password should not be more than 6";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 50),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            alignment: Alignment.center,
                            // color: Colors.deepPurple,
                            width: changedButton ? 50 : 150,
                            height: 50,
                            child: changedButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //    )
                          ),
                        ),
                      )

                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, Myroutes.homeRoute);
                      //   },
                      //   child: Text("login",
                      //       style: TextStyle(
                      //           fontSize: 20, fontWeight: FontWeight.bold)),
                      //   style: TextButton.styleFrom(minimumSize: Size(120, 45)),
                      // )
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
}
