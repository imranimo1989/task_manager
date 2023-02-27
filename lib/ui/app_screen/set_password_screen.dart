import 'package:flutter/material.dart';

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
                      controller: TextEditingController()),
                  const SizedBox(
                    height: 16,
                  ),
                  appTextEditingStyle(
                      obSecureText: true,
                      hintText: 'Confirm Password',
                      controller: TextEditingController()),
                  const SizedBox(
                    height: 24,
                  ),
                  AppButtonStyleWidget(
                    onPressed: () {},
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
      ),
    );
  }
}
