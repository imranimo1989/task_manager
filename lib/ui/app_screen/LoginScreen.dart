import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/Utills/SnacbarMessage.dart';
import 'package:task_manager/ui/Utills/Styles.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';
import '../../widgets/app_Text_Form_Field_Widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../dashboard_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final _formKeyLogin = GlobalKey<FormState>();

TextEditingController _emailEtController = TextEditingController();
TextEditingController _passwordEtController = TextEditingController();

bool _isLoading = false;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Form(
                key: _formKeyLogin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get Started With',
                      style: appTitleStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    appTextEditingStyle(
                        validator: (value) {
                          final emailRegExp = RegExp(r'\S+@\S+\.\S+');
                          if (value!.isEmpty) {
                            return "Please Enter your email";
                          } else if (!emailRegExp.hasMatch(value)) {
                            return "Please Enter a Valid Email";
                          }
                          return null;
                        },
                        hintText: 'Email', controller: _emailEtController),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }else if(value.length<6 ){
                            return 'Password should be minimum length 6 character ';
                          }

                          return null;
                        },
                        hintText: 'Password',
                        obSecureText: true,
                        controller: _passwordEtController),
                    const SizedBox(
                      height: 24,
                    ),
                    AppButtonStyleWidget(
                        onPressed: () async {
                          if (_formKeyLogin.currentState!.validate()) {
                            _isLoading =true;
                            setState(() {});
                            final result = await NetworkUtils.httpPostMethod(
                                Urls.loginUrl,
                                body: {
                                  "email": _emailEtController.text.trim(),
                                  "password": _passwordEtController.text
                                });
                            _isLoading = false;
                            setState(() {});

                            if (result != null && result["status"] == "success") {
                              snackBarMessage(context, 'Login Successful');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard()));
                            } else {
                              snackBarMessage(context,
                                  "Login Failed, User Name or Passowrd  error!", true);
                            }
                          }
                        },
                        child: _isLoading? (const CircularProgressIndicator(color: Colors.white,)) : const Icon(Icons.arrow_circle_right_outlined)),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/ForgotPasswordAndEmailVerification");
                            },
                            child: const Text(
                              "Forget password ?",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account ?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Registration');
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
