import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/shared_preferece_data.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/Utills/SnacbarMessage.dart';
import 'package:task_manager/ui/Utills/Styles.dart';
import 'package:task_manager/ui/app_screen/email_verification_screen.dart';
import 'package:task_manager/ui/app_screen/registration_screen.dart';
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
  void initState() {
    getRegEmail();
    super.initState();
  }

  /// get registration email after successfully registration//=====
  void getRegEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final regEmail = sharedPreferences.getString("regEmail");
    _emailEtController.text = regEmail??"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: SingleChildScrollView(
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
                          hintText: 'Email',
                          controller: _emailEtController),
                      const SizedBox(
                        height: 16,
                      ),
                      appTextEditingStyle(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
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
                            ///Login Process
                            await loginData(context);
                          },
                          child: _isLoading
                              ? (const CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : const Icon(Icons.arrow_circle_right_outlined)),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                              //  Navigator.pushNamed(context,"/ForgotPasswordAndEmailVerification");
                                Get.to(const ForgotPasswordAndEmailVerification());
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
                                   // Navigator.pushNamed(context, '/Registration');
                                    Get.to(const Registration());
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
      ),
    );
  }

  Future<void> loginData(BuildContext context) async {
    if (_formKeyLogin.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      final result = await NetworkUtils.httpPostMethod(Urls.loginUrl,
          header: {"Content-Type": "application/json"},
          body: {
        "email": _emailEtController.text.trim(),
        "password": _passwordEtController.text,
      },

          ///authorisation check
          onUnAuthorised: () {
        snackBarMessage(context, "Your Username or password incorrect", true);
      });
      _isLoading = false;
      setState(() {});

      if (result != null && result["status"] == "success") {
        SharedPrefData.saveDataToSharedPref(
            result['token'],
            result['data']['email'],
            result['data']['firstName'],
            result['data']['lastName'],
            result['data']['mobile'],
            result['data']['photo']);


        print(result);

        snackBarMessage(context, 'Login Successful');
        _emailEtController.clear();
        _passwordEtController.clear();

  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Dashboard()), (route) => false);
  Get.offAll(const Dashboard());
      }
    }
  }
}
