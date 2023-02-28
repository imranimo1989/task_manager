import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/widgets/item_progress_dashboard_widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';

import '../../widgets/app_task_item_card.dart';

class MyNewTask extends StatefulWidget {
  const MyNewTask({Key? key}) : super(key: key);

  @override
  State<MyNewTask> createState() => _MyNewTaskState();
}

class _MyNewTaskState extends State<MyNewTask> {


  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: ItemCountBoard(
                itemCount: '15',
                itemName: 'Canceled',
              ),
            ),
            Expanded(
              child: ItemCountBoard(
                itemCount: '15',
                itemName: 'Completed',
              ),
            ),
            Expanded(
              child: ItemCountBoard(
                itemCount: '15',
                itemName: 'Progress',
              ),
            ),
            Expanded(
                child: ItemCountBoard(
              itemCount: '15',
              itemName: 'New Task',
            )),

          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
              itemBuilder: (context, index) {
            return ItemCard(
              taskName: 'lkasdljflsajflks',
              taskDescription: 'asbkdjflaksdjflkasjdldfjalssdjflkasjdflkjasdlfj',
              createdDate: '12-12-1212',
              typeOfTask: "New",
              onDeletePressed: () {},
              onEditPressed: () {},
            );
          }),
        )
      ],
    ));
  }
}
