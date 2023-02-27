import 'package:flutter/material.dart';

import '../../widgets/app_Text_Form_Field_Widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../../widgets/screen_background_widget.dart';
import '../Utills/Styles.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({
    super.key,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Profile',
                      style: appTitleStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8))),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('Photos'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  '',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Email', controller: TextEditingController()),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'First Name',
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Last Name',
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Mobile',
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Password',
                        obSecureText: true,
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 24,
                    ),
                    AppButtonStyleWidget(
                        onPressed: () {},
                        child: const Icon(Icons.arrow_circle_right_outlined)),
                    const SizedBox(
                      height: 40,
                    ),
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
