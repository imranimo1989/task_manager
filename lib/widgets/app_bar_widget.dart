import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/shared_preferece_data.dart';
import '../data/network_utils.dart';
import '../ui/app_screen/LoginScreen.dart';
import '../ui/app_screen/update_profile_screen.dart';

AppBar AppTaskBar(context, photo, firstName, lastName, email) {
  return AppBar(
    backgroundColor: Colors.green,
    flexibleSpace: GestureDetector(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateProfile()));
        Get.to(const UpdateProfile());
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 40, 10, 5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 24,
              child: ClipOval(
                child: Image.memory(
                  (NetworkUtils.ShowBase64Image(photo)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lastName',
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(email),
              ],
            )
          ],
        ),
      ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await SharedPrefData.clearData();
            //Navigator.pushAndRemoveUntil(  context,  MaterialPageRoute(builder: (context) => const Login()),(route) => false);
            Get.offAll(const Login(),predicate: (route)=>false);
          },
          icon: const Icon(Icons.output))
    ],
  );
}
