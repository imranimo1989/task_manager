import 'package:flutter/material.dart';
import 'package:task_manager/widgets/item_progress_dashboard_widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';

import '../../widgets/app_task_item_card.dart';

class MyCompletedTask extends StatefulWidget {
  const MyCompletedTask({Key? key}) : super(key: key);

  @override
  State<MyCompletedTask> createState() => _MyCompletedTaskState();
}

class _MyCompletedTaskState extends State<MyCompletedTask> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
         return ItemCard(
            taskName: 'lkasdljflsajflks',
            taskDescription: 'asbkdjflaksdjflkasjdldfjalssdjflkasjdflkjasdlfj',
            createdDate: '12-12-1212',
            typeOfTask: "Completed",
            onDeletePressed: () {},
            onEditPressed: () {},
          );
        },

      ),
    );

  }
}
