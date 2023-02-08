import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vitalsenseapp/pages/home.dart';
import 'package:vitalsenseapp/pages/register.dart';
import 'package:vitalsenseapp/pages/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/icon.dart';

import '../model/profile.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                padding: const EdgeInsets.only(left: 20, right: 40),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Vector.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Padding(
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
                              padding:
                                  const EdgeInsets.only(left: 40, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                          "Please enter your email example 'vitalsense@something.com'"),
                                  EmailValidator(
                                      errorText:
                                          "Please enter correct email format"),
                                ]),
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 3, color: Colors.black),
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
                              children: const [
                                Padding(
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
                              padding:
                                  const EdgeInsets.only(left: 40, right: 20),
                              child: TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please enter your password"),
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
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 90,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 30, 10, 10),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2.0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(500.0),
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.amberAccent,
                                      child: const Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 35,
                                        color: Colors.black,
                                      ),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState?.save();
                                          try {
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email: profile.email,
                                                    password: profile.password)
                                                .then((value) {
                                              formKey.currentState?.reset();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()));
                                            });
                                          } on FirebaseAuthException catch (e) {
                                            Fluttertoast.showToast(
                                                msg: e.message!,
                                                gravity: ToastGravity.CENTER);
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                const Text('Does not have account?'),
                                TextButton(
                                  child: const Text(
                                    'sign up',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterForm()));
                                  },
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
