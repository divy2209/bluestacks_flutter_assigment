import 'package:bluestacks_flutter_assigment/services/exports/login_imports.dart';
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
    return loading ? Loading() : GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Center(
          child: Stack(
            children: [
              Background(),
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 330,
                    height: 430,
                    color: Colors.grey.shade50.withOpacity(0.3),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Container(
                          height: 70,
                          width: 310,
                          child: Image.asset('assets/logo.png'),
                          //color: Colors.grey.shade50.withOpacity(0.2),
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        InputField(
                          isObscure: false,
                          icon: FontAwesomeIcons.user,
                          hintText: 'Username',
                          inputAction: TextInputAction.next,
                          controller: _usernameController,
                        ),
                        InputField(
                          isObscure: true,
                          icon: FontAwesomeIcons.lock,
                          hintText: 'Password',
                          inputAction: TextInputAction.done,
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 65,
                          width: 310,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.orangeAccent.withOpacity(0.7)
                          ),
                          child: TextButton(
                            onPressed: () async {
                              username = _usernameController.text.trim();
                              password = _passwordController.text.trim();
                              String? showError = LoginService().credentialsValidation(user: username, pass: password);
                              if(showError == null){
                                setState(() {
                                  loading = true;
                                });
                                showError = LoginService().login(user: username, pass: password);
                                if(showError == null) {
                                  await localDataSaving(username: username, password: password);
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
            ],
          ),
        ),
      ),
    );
  }
}
