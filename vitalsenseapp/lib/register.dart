import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/model/profile.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //late DateTime _dateTime;
  final registerKey = GlobalKey<FormState>();
  Profile profile = Profile(firstname: '', lastname: '',  gender: '', phone: '', dob: '', email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 20, right: 40),
            child: Form(
              key: registerKey,
              child:SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/Vector.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Firstname:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Firstname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? firstname){
                        profile.firstname = firstname!;
                      },
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Lastname:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right:40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Lastname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? lastname){
                        profile.lastname = lastname!;
                      },
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 260, top: 10),
                    child: Text(
                      "Date Of Birth:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right:40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Date of Birth",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? dob){
                        profile.dob = dob!;
                      },
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

                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 310, top: 10),
                    child: Text(
                      "Phone:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? phone){
                        profile.phone = phone!;
                      },
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 310, top: 10),
                    child: Text(
                      "Gender:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Gender",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? gender){
                        profile.gender = gender!;
                      },
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 320, top: 10),
                    child: Text(
                      "Email:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,

                      decoration: const InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? email){
                        profile.email = email!;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 280, top: 10),
                    child: Text(
                      "Password:",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onSaved: (String? password){
                        profile.password = password!;
                      },
                    ),
                  ),
                  SizedBox(
                      height: 100,
                      child: Row(
                          children : <Widget>[
                            Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    registerKey.currentState?.save();
                                    if (kDebugMode) {
                                      print("firstname = ${profile.firstname} lastname = ${profile.lastname}  gender = ${profile.gender} dob = ${profile.dob} phone = ${profile.phone} email = ${profile.email} password =  ${profile.password}");
                                    }
                                    registerKey.currentState?.reset();
                                    Navigator.pop(context);
                                  },
                                  backgroundColor: Colors.teal,
                                  child: const Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                )
                            ),
                          ]
                      )
                  )
                  ],
                ),
              )
            )
        )
    );
  }
}
