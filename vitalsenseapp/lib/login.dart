import 'package:flutter/material.dart';
import 'package:vitalsenseapp/register.dart';
import 'package:vitalsenseapp/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/icon.dart';

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
            Image.asset("assets/images/Vector.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Text(
                    "Email:",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),

              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
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
                padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                child: Text(
                  "Password:",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
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

                Container(
                  alignment: Alignment.bottomCenter,
                    height: 90,
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: FloatingActionButton(
                      backgroundColor: Colors.amberAccent,
                      child: Icon(
                        Icons.play_arrow_outlined,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWidget()));
                      },
                    ),
                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterForm()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
