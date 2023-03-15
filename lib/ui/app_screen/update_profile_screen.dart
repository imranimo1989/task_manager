import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/shared_preferece_data.dart';
import 'package:task_manager/ui/Utills/SnacbarMessage.dart';

import '../../data/urls.dart';
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

  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerFirstName = TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerMobile = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  @override
  void initState() {
    textEditingControllerEmail.text = SharedPrefData.userEmail??"";
    textEditingControllerFirstName.text = SharedPrefData.userFirstName??"";
    textEditingControllerLastName.text = SharedPrefData.userLastName??"";
    textEditingControllerMobile.text =SharedPrefData.userMobile??"";

    super.initState();
  }
  XFile? imagePicker;



  Future<void> profileUpdate() async {

    final response = await NetworkUtils.httpPostMethod(
      Urls.profileUpdate,
      header: {
        "Content-Type": "application/json",
        "token": SharedPrefData.userToken!
      },
      body: {
        "email":textEditingControllerEmail.text.trim(),
        "firstName":textEditingControllerFirstName.text.trim(),
        "lastName": textEditingControllerLastName.text.trim(),
        "mobile":textEditingControllerMobile.text.trim()
      }

    );

    if(response!=null&&response["status"]==["success"]){
      snackBarMessage(context, "Profile Updated Successfully!!",false);

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("firstname", textEditingControllerFirstName.text.trim());
      await sharedPreferences.setString("lastName", textEditingControllerLastName.text.trim());
      await sharedPreferences.setString("mobile", textEditingControllerMobile.text.trim());




    }

  }
  

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
                      onTap: () {
                        imagePicked();
                      },
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
                              child:  Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                imagePicker?.name??"", maxLines: 1, overflow: TextOverflow.ellipsis,
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
                        hintText: 'Email',
                        controller: textEditingControllerEmail,
                    readOnly: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'First Name',
                        controller: textEditingControllerFirstName),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Last Name',
                        controller: textEditingControllerLastName),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Mobile',
                        controller: textEditingControllerMobile),
                    const SizedBox(
                      height: 16,
                    ),
                    appTextEditingStyle(
                        hintText: 'Password',
                        obSecureText: true,
                        readOnly: true,
                        controller: textEditingControllerPassword),
                    const SizedBox(
                      height: 24,
                    ),
                    AppButtonStyleWidget(
                        onPressed: () {
                          profileUpdate();
                        },
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

  void imagePicked() async {

    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: const Text("Image From"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    imagePicker = await ImagePicker().pickImage(source: ImageSource.camera);
                    if(imagePicker!=null){
                      setState(() {
                        Navigator.pop(context);
                      });
                    }
                  },
                  title: const Text("Camera"),
                  leading: const Icon(Icons.camera),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(imagePicker!=null){
                      setState(() {
                        Navigator.pop(context);
                      });
                    }
                  },
                  title: const Text("Gallery"),
                  leading: const Icon(Icons.photo),
                ),

              ],
            ),

          );
        });

  }



}
