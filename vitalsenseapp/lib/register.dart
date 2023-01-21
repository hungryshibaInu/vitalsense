import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/login.dart';
import 'package:flutter/src/widgets/icon.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //late DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 0, right: 60),
            child: Form(
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
                  Padding(
                    padding: EdgeInsets.only(left: 40, right:200),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 330, top: 10),
                    child: Text(
                      "DOB:",
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
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Phone No.:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      decoration: InputDecoration(
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
                      "Email:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 200),
                    child: TextField(
                      decoration: InputDecoration(
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: FloatingActionButton(
                          backgroundColor: Colors.amberAccent,
                          child: Icon(
                              Icons.arrow_forward_ios,
                              size: 35,
                              color: Colors.black,),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                        ),
                      ),
                    )
                ],
              ),
            )
        )
    );
  }
}
