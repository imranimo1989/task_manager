import 'package:flutter/material.dart';
import 'package:task_manager/widgets/item_progress_dashboard_widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';

import '../../widgets/app_task_item_card.dart';

class MyInProgressTask extends StatefulWidget {
  const MyInProgressTask({Key? key}) : super(key: key);

  @override
  State<MyInProgressTask> createState() => _MyInProgressTaskState();
}

class _MyInProgressTaskState extends State<MyInProgressTask> {
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
            typeOfTask: "In Progress",
            onDeletePressed: () {},
            onEditPressed: () {},
          );
        },

      ),
    );
  }
}
