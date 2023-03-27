import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/Utills/SnacbarMessage.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/ui/app_screen/LoginScreen.dart';
import 'package:task_manager/ui/app_screen/pin_Verification.dart';

import '../../data/urls.dart';
import '../../widgets/app_Text_Form_Field_Widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../../widgets/screen_background_widget.dart';
import '../Utills/Styles.dart';

class ForgotPasswordAndEmailVerification extends StatefulWidget {
  const ForgotPasswordAndEmailVerification({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordAndEmailVerification> createState() =>
      _ForgotPasswordAndEmailVerificationState();
}
TextEditingController textEditingController = TextEditingController();



class _ForgotPasswordAndEmailVerificationState
    extends State<ForgotPasswordAndEmailVerification> {

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Email Address',
                  style: appTitleStyle,
                ),
                const SizedBox(height: 10,),
                const Text("A six digit pin verification pin will send to your email address",
                style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500,fontSize: 15),),
                const SizedBox(
                  height: 24,
                ),
                appTextEditingStyle(
                    hintText: 'Email', controller: textEditingController),
                const SizedBox(
                  height: 24,
                ),

                AppButtonStyleWidget(onPressed: () async {

               if(textEditingController.text.isNotEmpty){
                 isLoading = true;
                  final response = await http.get(Uri.parse(Urls.forgetPassword(textEditingController.text)));
                 isLoading = false;
                 if(response.statusCode==200){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerification(textEditingController.text)));
                   Get.to(PinVerification(textEditingController.text));
                 }
               }else{
                 snackBarMessage(context, "Please enter your register email address",true);
               }

                },
                    child: isLoading? (const CircularProgressIndicator()): const Icon(Icons.arrow_circle_right_outlined)),
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
    );
  }
}
