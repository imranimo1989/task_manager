import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';

import '../../data/model/taskModel.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../../widgets/app_task_item_card.dart';
import '../../widgets/change_task_BottomSheet.dart';
import '../../widgets/deletedTask.dart';
import '../Utills/SnacbarMessage.dart';

class MyCompletedTask extends StatefulWidget {
  const MyCompletedTask({Key? key}) : super(key: key);

  @override
  State<MyCompletedTask> createState() => _MyCompletedTaskState();
}

bool isLoading = false;

class _MyCompletedTaskState extends State<MyCompletedTask> {
  GetTaskModel getCompletedTaskModel = GetTaskModel();

  @override
  void initState() {
    completedTaskList();
    super.initState();
  }

  Future<void> completedTaskList() async {
    isLoading = true;
    setState(() {});
    final result = await NetworkUtils.httpGetMethod(
      Urls.completedTaskList,
    );
    isLoading = false;
    setState(() {});
    log("Completed task result: $result");
    if (result != null) {
      getCompletedTaskModel = GetTaskModel.fromJson(result);
    } else {
      snackBarMessage(context, 'Something went wrong!!!', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Column(
      children: [
        Expanded(
          child: isLoading
              ? (const Center(
                  child: CircularProgressIndicator(),
                ))
              : RefreshIndicator(
                  onRefresh: completedTaskList,
                  child: ListView.builder(
                      itemCount: getCompletedTaskModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          taskName:
                              getCompletedTaskModel.data?[index].title ?? "",
                          taskDescription:
                              getCompletedTaskModel.data?[index].description ??
                                  "",
                          createdDate:
                              getCompletedTaskModel.data?[index].createdDate ??
                                  "",
                          typeOfTask:
                              getCompletedTaskModel.data?[index].status ?? "",
                          onDeletePressed: () {

                            onTaskDeleted(getCompletedTaskModel.data?[index].title ??
                                "", getCompletedTaskModel.data?[index].sId ?? "", () {
                              completedTaskList();
                            });

                          },
                          onEditPressed: () {
                            changeTaskStatus(

                              getCompletedTaskModel.data?[index].sId ?? "",
                              "Completed",
                                  () {
                                    completedTaskList();
                              },
                            );
                          }, backgroundColor: Colors.green[800]!,
                        );
                      }),
                ),
        )
      ],
    ));
  }
}
