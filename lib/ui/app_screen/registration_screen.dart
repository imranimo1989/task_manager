import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';

import '../../widgets/app_Text_Form_Field_Widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../../widgets/screen_background_widget.dart';
import '../Utills/SnacbarMessage.dart';
import '../Utills/Styles.dart';


class Registration extends StatefulWidget {
  const Registration({
    super.key,
  });

  @override
  State<Registration> createState() => _RegistrationState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController emailEtController = TextEditingController();
TextEditingController firstNameEtController = TextEditingController();
TextEditingController lastNameEtController = TextEditingController();
TextEditingController mobileEtController = TextEditingController();
TextEditingController passwordEtController = TextEditingController();

 bool isLoading = false;




class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Join With Us',
                        style: appTitleStyle,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      appTextEditingStyle(
                        hintText: 'Email',
                        controller: emailEtController,
                        validator: (value) {
                          final emailRegExp = RegExp(r'\S+@\S+\.\S+');
                          if (value!.isEmpty) {
                            return "Please Enter your email";
                          } else if (!emailRegExp.hasMatch(value)) {
                            return "Please Enter a Valid Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      appTextEditingStyle(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          hintText: 'First Name',
                          controller: firstNameEtController),
                      const SizedBox(
                        height: 16,
                      ),
                      appTextEditingStyle(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter you last name';
                            }
                            return null;
                          },
                          hintText: 'Last Name',
                          controller: lastNameEtController),
                      const SizedBox(
                        height: 16,
                      ),
                      appTextEditingStyle(
                          validator: (value) {
                            final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
                            if (value!.isEmpty) {
                              return "Please Enter your mobile number";
                            } else if (!phoneRegExp.hasMatch(value)) {
                              return "Please Enter a Valid phone number";
                            }
                            return null;
                          },
                          hintText: 'Mobile',
                          controller: mobileEtController),
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
                          controller: passwordEtController),
                      const SizedBox(
                        height: 24,
                      ),
                      AppButtonStyleWidget(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {
                              });
                              final result = await NetworkUtils.httpPostMethod(
                                Urls.registrationUrl,
                                body: {
                                  "email": emailEtController.text.trim(),
                                  "firstName": firstNameEtController.text.trim(),
                                  "lastName": lastNameEtController.text.trim(),
                                  "mobile": mobileEtController.text.trim(),
                                  "password": passwordEtController.text,
                                }
                              );
                              isLoading =false;
                              setState(() {

                              });
                              if(result != null && result["status"]=="success")
                              {
                                snackBarMessage(context,'Registration Success, Please login to enter...',);

                                emailEtController.clear();
                                firstNameEtController.clear();
                                lastNameEtController.clear();
                                mobileEtController.clear();
                                passwordEtController.clear();


                              }
                              else{
                                snackBarMessage(context, "Registration failed! try again", true);
                              }
                       

                              Navigator.pushNamed(context, '/Login');
                            }
                          },
                          child: isLoading ? (const CircularProgressIndicator( color: Colors.white,)): const Icon(Icons.arrow_circle_right_outlined)),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Have account ?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Login');
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ))
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
}
