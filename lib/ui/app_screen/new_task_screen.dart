import 'package:flutter/material.dart';
import 'package:task_manager/ui/Utills/Styles.dart';
import 'package:task_manager/ui/dashboard_screen.dart';
import 'package:task_manager/widgets/app_Text_Form_Field_Widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';
import '../../widgets/app_buttoon_style_widget.dart';

class NewTaskItem extends StatefulWidget {
  const NewTaskItem({Key? key}) : super(key: key);

  @override
  State<NewTaskItem> createState() => _NewTaskItemState();
}

class _NewTaskItemState extends State<NewTaskItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Center(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: appTextEditingStyle(
                    hintText: 'Subject',
                    controller: TextEditingController(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                  child: appTextEditingStyle(
                    hintText: 'Description',
                    multiLine: 10,
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: AppButtonStyleWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
