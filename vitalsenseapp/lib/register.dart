import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vitalsenseapp/login.dart';
import 'package:vitalsenseapp/model/profile.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //late DateTime _dateTime;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
      firstname: '',
      lastname: '',
      gender: '',
      phone: '',
      dob: '',
      email: '',
      password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: Container(
                    padding: const EdgeInsets.only(left: 20, right: 40),
                    child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset("assets/images/Vector.png"),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 280, top: 10),
                                child: Text(
                                  "Firstname:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          "Please enter your firstname. example 'John'"),
                                  decoration: const InputDecoration(
                                    hintText: "Firstname",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? firstname) {
                                    profile.firstname = firstname!;
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 280, top: 10),
                                child: Text(
                                  "Lastname:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          "Please enter your lastname. example 'Kyle"),
                                  decoration: const InputDecoration(
                                    hintText: "Lastname",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? lastname) {
                                    profile.lastname = lastname!;
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 310, top: 10),
                                child: Text(
                                  "Birthday:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          "Please enter your birthday. example '08/04/2001' "),
                                  decoration: const InputDecoration(
                                    hintText: "DD/MM/YYYY",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? dob) {
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
                                padding: EdgeInsets.only(
                                    left: 40, right: 310, top: 10),
                                child: Text(
                                  "Phone:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          "Enter your mobile phone. example '099999876'"),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "Phone number 10 digits",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? phone) {
                                    profile.phone = phone!;
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 310, top: 10),
                                child: Text(
                                  "Gender:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          "Please enter your gender. example 'male, female, other'"),
                                  decoration: const InputDecoration(
                                    hintText: "Male, Female, Other",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? gender) {
                                    profile.gender = gender!;
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 320, top: 10),
                                child: Text(
                                  "Email:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText:
                                            "Please enter your email. example 'vitalsense@something.com'"),
                                    EmailValidator(
                                        errorText:
                                            "Please enter correct email format."),
                                  ]),
                                  decoration: const InputDecoration(
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? email) {
                                    profile.email = email!;
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 280, top: 10),
                                child: Text(
                                  "Password:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          "Please enter your password. example '12@jldwj&dhq'"),
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? password) {
                                    profile.password = password!;
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: 100,
                                  child: Row(children: <Widget>[
                                    Expanded(
                                        child: FloatingActionButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState?.save();
                                          /*await _userCollection.add({
                                            "firstname": profile.firstname,
                                            "lastname": profile.lastname,
                                            "birthday": profile.dob,
                                            "gender": profile.gender,
                                            "phone": profile.phone,
                                            "email": profile.email,
                                            "password": profile.password,
                                          });*/
                                          try {
                                            await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                                    email: profile.email,
                                                    password: profile.password)
                                                .then((value) {
                                              formKey.currentState?.reset();
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Account created successfully.",
                                                  gravity: ToastGravity.TOP);
                                              Navigator.pop(context);
                                            });
                                          } on FirebaseAuthException catch (e) {
                                            //print(e.code);
                                            //print(e.message);
                                            Fluttertoast.showToast(
                                                msg: e.message!,
                                                gravity: ToastGravity.CENTER);
                                          }
                                        }
                                      },
                                      backgroundColor: Colors.teal,
                                      child: const Icon(
                                        Icons.check_circle,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    )),
                                    const Text(
                                      'if already have account click yellow button',
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 11),
                                    ),
                                    Expanded(
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Login()));
                                        },
                                        backgroundColor: Colors.amberAccent,
                                        child: Icon(
                                          Icons.play_arrow_outlined,
                                          size: 35,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ]))
                            ],
                          ),
                        ))));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
