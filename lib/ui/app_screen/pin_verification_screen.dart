import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/app_Text_Form_Field_Widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../../widgets/screen_background_widget.dart';
import '../Utills/Styles.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({Key? key}) : super(key: key);

  @override
  State<PinVerification> createState() =>
      _PinVerificationState();
}

class _PinVerificationState
    extends State<PinVerification> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    'PIN Verification',
                    style: appTitleStyle,
                  ),
                  const SizedBox(height: 10,),
                  const Text("A six digit pin verification pin will send to your email address",
                    style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500,fontSize: 15),),
                  const SizedBox(
                    height: 24,
                  ),
                  PinCodeTextField(
                    onChanged: (value){},
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(6),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      selectedColor: Colors.green,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.white,

                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: null,

                    enableActiveFill: true,

                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  AppButtonStyleWidget(
                    onPressed: (){
                      Navigator.pushNamed(context, '/SetPasswordAndVerify');

                    },
                      child: const Text('Verify',style: TextStyle(fontWeight:
                      FontWeight.w500,fontSize: 16),),),
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
    );
  }
}
