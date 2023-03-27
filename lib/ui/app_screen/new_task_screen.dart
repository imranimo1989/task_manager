import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/ui/Utills/Styles.dart';
import 'package:task_manager/ui/dashboard_screen.dart';
import 'package:task_manager/widgets/app_Text_Form_Field_Widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';
import '../../data/shared_preferece_data.dart';
import '../../data/urls.dart';
import '../../widgets/app_buttoon_style_widget.dart';
import '../Utills/SnacbarMessage.dart';

class NewTaskItem extends StatefulWidget {
  const NewTaskItem({Key? key}) : super(key: key);

  @override
  State<NewTaskItem> createState() => _NewTaskItemState();
}
bool _isLoading = false;
final _formKeyAddNewTask = GlobalKey<FormState>();

TextEditingController _controllerSubject = TextEditingController();
TextEditingController _controllerDescription = TextEditingController();

class _NewTaskItemState extends State<NewTaskItem> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Form(
            key: _formKeyAddNewTask,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Add New Task',
                      style: appTitleStyle,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: appTextEditingStyle(
                        hintText: 'Subject',
                        controller: _controllerSubject,
                        validator: (value){
                          if(value== null||value.isEmpty){
                            return "Add task field empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                      child: appTextEditingStyle(
                        hintText: 'Description',
                        multiLine: 10,
                        controller: _controllerDescription,
                        validator: (value){
                          if(value== null||value.isEmpty){
                            return "Description field empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: AppButtonStyleWidget(
                          onPressed: () {
                            addNewTask(context);

                          },
                          child: _isLoading
                              ? (const CircularProgressIndicator(
                            color: Colors.white,
                          ))
                              : const Icon(Icons.arrow_circle_right_outlined)),
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

  Future<void> addNewTask(BuildContext context) async {
    if (_formKeyAddNewTask.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      final result = await NetworkUtils.httpPostMethod(Urls.addNewTask, header: {
        "Content-Type": "application/json",
        "token": SharedPrefData.userToken??"",
      }, body: {
        "title": _controllerSubject.text.trim(),
        "description": _controllerDescription.text,
        "status":"New"
      },

          ///authorisation check
          onUnAuthorised: () {
        snackBarMessage(context, "UnAuthorised", true);
      });
      _isLoading = false;
      setState(() {});

      if (result != null && result["status"] == "success") {


        print(result);

        snackBarMessage(context, 'Task added Successful');

        //Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
        Get.to(const Dashboard());
      }
    }
  }
}
