import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager/widgets/change_task_BottomSheet.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';
import '../../data/model/taskModel.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../../widgets/app_task_item_card.dart';
import '../../widgets/deletedTask.dart';
import '../Utills/SnacbarMessage.dart';

class MyInProgressTask extends StatefulWidget {
  const MyInProgressTask({Key? key}) : super(key: key);

  @override
  State<MyInProgressTask> createState() => _MyInProgressTaskState();
}

bool isLoading = false;

class _MyInProgressTaskState extends State<MyInProgressTask> {
  GetTaskModel getProgressTaskModel = GetTaskModel();

  @override
  void initState() {
    progressTaskList();
    super.initState();
  }

  Future<void> progressTaskList() async {
    isLoading = true;
    setState(() {});
    final result = await NetworkUtils.httpGetMethod(
      Urls.progressTaskList,
    );
    isLoading = false;
    setState(() {});
    log("Completed task result: $result");
    if (result != null) {
      getProgressTaskModel = GetTaskModel.fromJson(result);
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
                  onRefresh: progressTaskList,
                  child: ListView.builder(
                      itemCount: getProgressTaskModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          taskName:
                              getProgressTaskModel.data?[index].title ?? "",
                          taskDescription:
                              getProgressTaskModel.data?[index].description ??
                                  "",
                          createdDate:
                              getProgressTaskModel.data?[index].createdDate ??
                                  "",
                          typeOfTask:
                              getProgressTaskModel.data?[index].status ?? "",
                          onDeletePressed: () {
                            onTaskDeleted(
                                getProgressTaskModel.data?[index].title ?? "",
                                getProgressTaskModel.data?[index].sId ?? "",
                                () {
                              progressTaskList();
                            });
                          },
                          onEditPressed: () {
                            changeTaskStatus(
                                getProgressTaskModel.data?[index].sId ?? "",
                                "Progress", () {
                              progressTaskList();
                            });
                          }, backgroundColor: Colors.purple[800]!,
                        );
                      }),
                ),
        )
      ],
    ));
  }
}
