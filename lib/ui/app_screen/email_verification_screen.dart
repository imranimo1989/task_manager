import 'package:flutter/material.dart';

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

class _ForgotPasswordAndEmailVerificationState
    extends State<ForgotPasswordAndEmailVerification> {
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
                    hintText: 'Email', controller: TextEditingController()),
                const SizedBox(
                  height: 24,
                ),

                AppButtonStyleWidget(onPressed: (){
                  Navigator.pushNamed(context, '/PinVerification');
                },
                    child: const Icon(Icons.arrow_circle_right_outlined)),
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
                          Navigator.pushNamed(context, "/Login");
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
