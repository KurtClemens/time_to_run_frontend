import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_to_run/screens/intro_screen.dart';
import 'package:time_to_run/screens/register_screen.dart';
import 'package:time_to_run/screens/user.dart';
// import 'package:time_to_run/services/dbservices.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:http/http.dart' as http;
import 'package:time_to_run/services/authservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  User user = User('', '');
  var email, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/Man-running-beach.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Stack(
              children: [
                Container(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text('Sign In',
                            style: GoogleFonts.pacifico(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.blueGrey)),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: user.email),
                            onChanged: (value) {
                              user.email = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter something';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Enter valid email';
                              }
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white38,
                                hintText: 'Enter email',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.red))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: user.password),
                            onChanged: (value) {
                              user.password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter something';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white38,
                                hintText: 'Enter password',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.red))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(52, 145, 52, 0),
                          child: Container(
                              height: 50,
                              width: 400,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white38),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Colors.blueGrey)))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('ok');
                                    AuthService()
                                        .login(user.email, user.password)
                                        .then((val) {
                                      if (val != null && val.data['success']) {
                                        token = val.data['token'];
                                        Fluttertoast.showToast(
                                            msg: 'Welcome, let\'s run!',
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16);

                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    IntroScreen()));
                                      }
                                    });
                                  } else {
                                    print('not ok');
                                  }
                                },
                                child: Text('Sign in',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 24)),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  child: Text(
                                    'Register here!',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))));
  }
}
