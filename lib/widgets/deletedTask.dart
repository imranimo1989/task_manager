import 'package:flutter/material.dart';
import 'package:task_manager/main.dart';
import '../data/network_utils.dart';
import '../data/urls.dart';

void onTaskDeleted(taskTitle, taskId, voidCalBack){


  showDialog<String>(
    context: Home.globalNavigatorKey.currentContext!,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete!'),
      content:  Text('Do you want to deleted this Task? \n\n" $taskTitle" '),
      actions: <Widget>[
        TextButton(
          onPressed: () =>


              Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {

            final deletedResponse = await NetworkUtils.httpGetMethod(
                Urls.deleteTask(taskId));

            if(deletedResponse!=null){
              voidCalBack();
              Navigator.pop(context, 'OK');
            }

          },
          child: const Text('OK'),
        ),
      ],
    ),
  );








}