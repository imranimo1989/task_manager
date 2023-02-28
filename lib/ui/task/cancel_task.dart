import 'package:flutter/material.dart';
import 'package:task_manager/widgets/item_progress_dashboard_widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';

import '../../widgets/app_task_item_card.dart';

class MyCancelTask extends StatefulWidget {
  const MyCancelTask({Key? key}) : super(key: key);

  @override
  State<MyCancelTask> createState() => _MyCancelTaskState();
}

class _MyCancelTaskState extends State<MyCancelTask> {
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
            typeOfTask: "Cancel",
            onDeletePressed: () {},
            onEditPressed: () {},
          );
        },

      ),
    );
  }
}
