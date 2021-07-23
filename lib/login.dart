import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:bluestacks_flutter_assigment/local_save.dart';
import 'package:bluestacks_flutter_assigment/main.dart';
import 'package:bluestacks_flutter_assigment/text_field.dart';
import 'package:bluestacks_flutter_assigment/validate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String username;
  late String password;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() : GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                InputField(
                  isObscure: false,
                  icon: FontAwesomeIcons.user,
                  hintText: 'Username',
                  inputAction: TextInputAction.next,
                  controller: _usernameController,
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                  isObscure: true,
                  icon: FontAwesomeIcons.lock,
                  hintText: 'Password',
                  inputAction: TextInputAction.done,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blueAccent
                  ),
                  child: TextButton(
                    onPressed: () async {
                      username = _usernameController.text.trim();
                      password = _passwordController.text.trim();
                      String? showError = Validation().loginValidation(user: username, pass: password);
                      if(showError == null){
                        setState(() {
                          loading = true;
                        });
                        showError = Validation().login(user: username, pass: password);
                        if(showError == null) {
                          await localDataSaving(username: username, password: password);
                          //await GameTv.sharedPreferences!.setString(GameTv.username, username);
                          //await GameTv.sharedPreferences!.setString(GameTv.password, password);
                          Future.delayed(const Duration(seconds: 2), (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp())
                            );
                          });
                        } else {
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                      if(showError != null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(showError),
                            backgroundColor: Colors.redAccent.withOpacity(0.4),
                            duration: Duration(seconds: 5),
                            elevation: 0,
                          )
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
