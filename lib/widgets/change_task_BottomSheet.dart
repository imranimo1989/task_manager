

import 'package:flutter/material.dart';
import 'package:task_manager/widgets/app_buttoon_style_widget.dart';

import '../data/network_utils.dart';
import '../data/urls.dart';
import '../main.dart';
import '../ui/Utills/SnacbarMessage.dart';

void changeTaskStatus(taskId, currentTaskStatus,voidCallBack ) {
  String groupTask=currentTaskStatus;

  showModalBottomSheet(
      context: Home.globalNavigatorKey.currentContext!,
      builder: (context) {
        return StatefulBuilder(
            builder: (context, changeState) {
              return Column(
                children: [
                  const SizedBox(height: 15,),
                  const Text("Change Task Status!",style: TextStyle(fontSize: 25),),
                  const SizedBox(height: 15,),
                  RadioListTile(
                      value: "New",
                      title: const Text("New"),
                      groupValue: groupTask,
                      onChanged: (value) {
                        changeState(() {
                          groupTask=value!;
                        });

                      }),
                  RadioListTile(
                      value: "Completed",
                      title: const Text("Completed"),
                      groupValue: groupTask,
                      onChanged: (value) {
                        changeState(() {
                          groupTask=value!;
                        });

                      }),
                  RadioListTile(
                      value: "Cancel",
                      title: const Text("Cancel"),
                      groupValue: groupTask,
                      onChanged: (value) {
                        changeState(() {
                          groupTask=value!;
                        });
                      }),
                  RadioListTile(
                      value: "Progress",
                      title: const Text("Progress"),
                      groupValue: groupTask,
                      onChanged: (value) {
                        changeState(() {
                          groupTask=value!;
                        });

                      }),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: AppButtonStyleWidget(
                            onPressed: () async {

                              final response = await NetworkUtils.httpGetMethod(Urls.changeStatusUrl(taskId, groupTask));
                              if(response!=null){
                                voidCallBack();
                                Navigator.pop(context);
                              }else{
                                snackBarMessage("Status Change Failed! try again",true);
                              }




                            }, child: const Text("Change Task Status"))),
                  ),
                ],
              );
            }
        );
      });
}