import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_to_run/screens/login_screen.dart';
import 'package:time_to_run/screens/user.dart';
import 'package:http/http.dart' as http;
import 'package:time_to_run/services/authservice.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  // Future save() async {
  //   var result = await http.post(Uri.parse("http://localhost:8080/register"),
  //       headers: <String, String>{
  //         'Context-Type': 'application/json;charSet=UTF-8'
  //       },
  //       body: <String, String>{
  //         'email': user.email,
  //         'password': user.password
  //       });
  //   print(result.body);
  //       Navigator.push(
  //       context, new MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text('Register',
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
                                        .addUser(user.email, user.password)
                                        .then((val) {
                                      if (val != null &&
                                          user.email != "" &&
                                          user.password != "") {
                                        Fluttertoast.showToast(
                                            msg: val.data['msg'],
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
                                  } else {
                                    print('not ok');
                                  }
                                },
                                child: Text('Register',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 24)),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Already have an account? ',
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
                                    'Sign in',
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
            )

                //   body: Padding(
                // padding: const EdgeInsets.all(8.0),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     TextField(
                //       decoration: InputDecoration(labelText: 'Name'),
                //       onChanged: (val) {
                //         name = val;
                //       },
                //     ),
                //     TextField(
                //       obscureText: true,
                //       decoration: InputDecoration(labelText: 'Password'),
                //       onChanged: (val) {
                //         password = val;
                //       },
                //     ),
                //     // Authenticate user
                //     SizedBox(height: 10.0),
                //     ElevatedButton(
                //       child: Text('Authenticate'),
                //       onPressed: () {
                //         AuthService().login(name, password).then((val) {
                //           if (val != null && val.data['success']) {
                //             token = val.data['token'];
                //             Fluttertoast.showToast(
                //                 msg: 'Authenticated',
                //                 toastLength: Toast.LENGTH_LONG,
                //                 gravity: ToastGravity.BOTTOM,
                //                 backgroundColor: Colors.green,
                //                 textColor: Colors.white,
                //                 fontSize: 16);
                //           }
                //         });
                //       },
                //     ),
                //     // add user
                //     SizedBox(height: 10.0),
                //     ElevatedButton(
                //       child: Text('Add User'),
                //       onPressed: () {
                //         AuthService().addUser(name, password).then((val) {
                //           if (val != null) {
                //             Fluttertoast.showToast(
                //                 msg: val.data['msg'],
                //                 toastLength: Toast.LENGTH_LONG,
                //                 gravity: ToastGravity.BOTTOM,
                //                 backgroundColor: Colors.green,
                //                 textColor: Colors.white,
                //                 fontSize: 16);
                //           }
                //         });
                //       },
                //     ),
                //     SizedBox(height: 10.0),
                //     ElevatedButton(
                //       child: Text('Get Info'),
                //       onPressed: () {
                //         AuthService().getinfo(token).then((val) {
                //           if (val != null) {
                //             Fluttertoast.showToast(
                //                 msg: val.data['msg'],
                //                 toastLength: Toast.LENGTH_LONG,
                //                 gravity: ToastGravity.BOTTOM,
                //                 backgroundColor: Colors.green,
                //                 textColor: Colors.white,
                //                 fontSize: 16);
                //           }
                //         });
                //       },
                //     ),
                //   ],
                // )),
                )));
  }
}
