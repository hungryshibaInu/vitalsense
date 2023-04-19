import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vitalsenseapp/pages/login.dart';
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
  final CollectionReference _userCollection =
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
              body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 40, top: 50),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset("assets/images/logo_new.png")),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Firstname:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
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
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Lastname:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
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
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Birthday:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
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

                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Phone:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
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
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Gender:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
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
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Email:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
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
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "Password:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 20),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText:
                                      "Please enter your password. example '12@jldwj&dhq'"),
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  //borderSide:
                                  //BorderSide(width: 2, color: Colors.black),
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
                              height: 120,
                              child: Column(children: <Widget>[
                                Expanded(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2.0),
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(500.0),
                                        child: FloatingActionButton(
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState?.save();
                                              await _userCollection.add({
                                                "firstname": profile.firstname,
                                                "lastname": profile.lastname,
                                                "birthday": profile.dob,
                                                "gender": profile.gender,
                                                "phone": profile.phone,
                                                "email": profile.email,
                                                "password": profile.password,
                                              });
                                              try {
                                                await FirebaseAuth.instance
                                                    .createUserWithEmailAndPassword(
                                                        email: profile.email,
                                                        password:
                                                            profile.password)
                                                    .then((value) {
                                                  formKey.currentState?.reset();
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Account created successfully.",
                                                      gravity:
                                                          ToastGravity.TOP);
                                                  Navigator.pop(context);
                                                });
                                              } on FirebaseAuthException catch (e) {
                                                //print(e.code);
                                                //print(e.message);
                                                Fluttertoast.showToast(
                                                    msg: e.message!,
                                                    gravity:
                                                        ToastGravity.CENTER);
                                              }
                                            }
                                          },
                                          backgroundColor: Colors.amberAccent,
                                          child: const Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 35,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'if already have account',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 11),
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'sign in',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 12),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Login()));
                                        },
                                      )
                                    ])
                              ]))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
