import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:node_connect/our_home.dart';
import 'package:node_connect/text_style.dart';

import 'button.dart';
import 'currentState.dart';
import 'my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKeyLogin = GlobalKey<FormState>();
  var isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CurrentState _instance = Get.put(CurrentState());
  Future<String> _LoginUser() async {
    final isvalid = _formKeyLogin.currentState?.validate();
    final _auth = FirebaseAuth.instance;
    late String retVal = "";
    _formKeyLogin.currentState?.save();
    if (isvalid ?? false) {
      try {
        setState(() {
          isLoading = true;
        });
        // String retVal = await _instance.loginUserWithEmail(
        //     email.text.trim(), pass.text.trim());
        // UserCredential _authResult = await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());

        retVal = await _instance.loginUser(email.text, pass.text);
        if (retVal == "success") {
          retVal = "Login Successful";
          // Navigate the user to the page
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomeScreen()),
          //         (route) => false);

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => OurHome()),
              (route) => false);

          Fluttertoast.showToast(
              msg: retVal,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
          isLoading = false;
        } else {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: retVal,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } catch (e) {
        print(e);
      }
    }
    return "fkdkbfbs";
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        child: Center(
          child: Container(
            width: width / 2,
            child: Column(
              children: [
                // SizedBox(
                //   height: 100,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     _instance.createNewUser(
                //         name: "Gurpal Singh",
                //         email: "gurpal@gmail.com",
                //         password: "random123");
                //   },
                //   child: Text("Create a new account for me daddy"),
                // ),
                Container(
                  height: 300,
                  width: 300,
                  child: Lottie.network(
                      "https://assets9.lottiefiles.com/private_files/lf30_enimaxev.json"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 100,
                    right: width > 360 ? 20 : 10,
                    left: width > 360 ? 20 : 10,
                  ),
                  child: Form(
                    key: _formKeyLogin,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: height / 16,
                          // ),
                          TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: MyColors.blue_ribbon,
                              ),
                              labelText: 'Email address',
                              labelStyle: MyTextStyle.text1,
                            ),
                            style: MyTextStyle.text2,
                            validator: (value) {
                              print(value);
                              if (value?.isNotEmpty ?? false) {
                                if (EmailValidator.validate(email.text)) {
                                } else {
                                  return "Enter a valid email";
                                }
                              } else {
                                return "Please enter a email";
                              }
                            },
                            onChanged: (text) {
                              // do something with text
                            },
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          TextFormField(
                            controller: pass,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: MyColors.blue_ribbon,
                              ),
                              labelText: 'Password',
                              labelStyle: MyTextStyle.text1,
                            ),
                            style: MyTextStyle.text2,
                            validator: (value) {
                              if (value != null) {
                                if (value.length < 8) {
                                  return "Please enter a valid password";
                                }
                              } else {
                                return "Please enter a password";
                              }
                            },
                            obscureText: true,
                            onChanged: (text) {
                              // do something with text
                            },
                          ),
                          SizedBox(
                            height: height / 70,
                          ),

                          !isLoading
                              ? GestureDetector(
                                  onTap: () {
                                    //closes keyboard
                                    _LoginUser();
                                  },
                                  child: Button(
                                    text: "Log In",
                                    color: 1,
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator()),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
