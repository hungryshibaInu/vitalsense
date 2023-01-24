import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/login.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:vitalsenseapp/user.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //late DateTime _dateTime;
  final registerKey = GlobalKey<FormState>();
  //UserInfo users = UserInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 0, right: 60),
            child: Form(
              key: registerKey,
              child:SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/Vector.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Firstname:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Firstname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Lastname:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  /*TextFormField(
                    onSaved: (String lname){
                      users.lname = lname;
                    },
                  ),*/
                  Padding(
                    padding: EdgeInsets.only(left: 40, right:200),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Lastname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 270, top: 10),
                    child: Text(
                      "Date Of Birth:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right:200),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Date of Birth",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*ElevatedButton(
                        child: Text('Select Date'),
                         onPressed: () async {
                           DateTime? newDate = await showDatePicker(
                             context: context,
                             initialDate: _dateTime == null
                                 ? DateTime.now()
                                 : _dateTime,
                             firstDate: DateTime(1900),
                             lastDate: DateTime(2100),
                           ).then((date) {
                             setState(() {
                               _dateTime = date!;
                             });
                           });
                         },
                ),*/

                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 310, top: 10),
                    child: Text(
                      "Phone:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 310, top: 10),
                    child: Text(
                      "Gender:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Gender",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 320, top: 10),
                    child: Text(
                      "Email:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Password:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: FloatingActionButton(
                        backgroundColor: Colors.amberAccent,
                        child: Icon(
                          Icons.check_circle,
                          size: 30,
                          color: Colors.black,
                          ),
                        onPressed: () {
                          Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
        )
    );
  }
}
