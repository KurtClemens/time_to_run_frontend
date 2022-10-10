import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_to_run/screens/login_screen.dart';
import 'package:time_to_run/shared/strings.dart';
import 'package:time_to_run/shared/user.dart';
import 'package:http/http.dart' as http;
import 'package:time_to_run/services/authservice.dart';
//import 'package:time_to_run/services/dbservices.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  User user = User("", "");
  var token;

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
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text(Strings.register,
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
                                return Strings.enterValidEmail;
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return Strings.enterValidEmail;
                              }
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white38,
                                hintText: Strings.enterEmail,
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
                                return Strings.enterPassword;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white38,
                                hintText: Strings.enterPassword,
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
                                    AuthService()
                                        .addUser(user.email, user.password)
                                        .then((val) {
                                      if (val != null &&
                                          user.email != "" &&
                                          user.password != "") {
                                        Fluttertoast.showToast(
                                            msg: user.email + Strings.successRegistered,
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16);

                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      }
                                    });
                                  } 
                                },
                                child: Text(Strings.register,
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 24)),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                Strings.alreadyAccount,
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
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    Strings.signIn,
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
