import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/ui/Utills/SnacbarMessage.dart';
import 'package:task_manager/ui/app_screen/LoginScreen.dart';

import '../../data/urls.dart';
import '../../widgets/app_Text_Form_Field_Widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../../widgets/screen_background_widget.dart';
import '../Utills/Styles.dart';

class SetPasswordAndVerify extends StatefulWidget {
  const SetPasswordAndVerify({Key? key}) : super(key: key);

  @override
  State<SetPasswordAndVerify> createState() => _SetPasswordAndVerifyState();
}

class _SetPasswordAndVerifyState extends State<SetPasswordAndVerify> {


  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerConPassword = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set Password',
                    style: appTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Minimum length password 8 character with Letter and number combination.",
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  appTextEditingStyle(
                      hintText: 'Password',
                      obSecureText: true,
                      controller: textEditingControllerPassword),
                  const SizedBox(
                    height: 16,
                  ),
                  appTextEditingStyle(
                      obSecureText: true,
                      hintText: 'Confirm Password',
                      controller: textEditingControllerConPassword),
                  const SizedBox(
                    height: 24,
                  ),
                  AppButtonStyleWidget(
                    onPressed: () {

                      if(textEditingControllerPassword.text.isNotEmpty&&textEditingControllerConPassword.text.isNotEmpty){

                        if(textEditingControllerPassword.text.contains(textEditingControllerConPassword.text)){
                          resetPassword();

                        }
                        else{

                          snackBarMessage(context, "Password not equal, password confirmation error!",true);

                        }


                      }else{

                        snackBarMessage(context, "Please input your password",true);
                      }



                    },
                    child: const Text(
                      'Confirm',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
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
                            
                            resetPassword();
                            
                            
                            //Navigator.pushNamed(context, "/Login");
                            Get.to(const Login());
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
    );
  }

  Future<void> resetPassword() async{

    final sharePre = await SharedPreferences.getInstance();
    final otp = sharePre.getString('otp');
    final email = sharePre.getString("email");
    
    final response = NetworkUtils.httpPostMethod(
        Urls.resetPassword,
      body: {

        "email":email!,
        "OTP":otp!,
        "password":textEditingControllerPassword.text

      }
    );

    if(response != null){
      snackBarMessage(context, "Password Reset Successfully! Please login to enter",true);
      //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Login()), (route) => false);
      Get.offAll(const Login(),predicate: (route)=>false);

    }
    
  }
}
