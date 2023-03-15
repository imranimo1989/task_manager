import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager/widgets/deletedTask.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';

import '../../data/model/taskModel.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../../widgets/app_task_item_card.dart';
import '../../widgets/change_task_BottomSheet.dart';
import '../Utills/SnacbarMessage.dart';

class MyCancelTask extends StatefulWidget {
  const MyCancelTask({Key? key}) : super(key: key);

  @override
  State<MyCancelTask> createState() => MyCancelTaskState();

}
bool isLoading = false;


class MyCancelTaskState extends State<MyCancelTask> {

  GetTaskModel getCancelTaskModel = GetTaskModel();



  @override
  void initState() {
    cancelTaskList();
    super.initState();
  }

  Future<void> cancelTaskList() async {
    isLoading = true;
    setState(() {});
    final result = await NetworkUtils.httpGetMethod(
      Urls.cancelTaskList,
    );
    isLoading = false;
    setState(() {});
    log("Completed task result: $result");
    if (result != null) {
      getCancelTaskModel = GetTaskModel.fromJson(result);
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
                onRefresh: cancelTaskList,
                child: ListView.builder(
                    itemCount: getCancelTaskModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        taskName:
                        getCancelTaskModel.data?[index].title ?? "",
                        taskDescription:
                        getCancelTaskModel.data?[index].description ??
                            "",
                        createdDate:
                        getCancelTaskModel.data?[index].createdDate ??
                            "",
                        typeOfTask:
                        getCancelTaskModel.data?[index].status ?? "",
                        onDeletePressed: () {
                          onTaskDeleted(getCancelTaskModel.data?[index].title ??
                              "", getCancelTaskModel.data?[index].sId ?? "", () {
                              cancelTaskList();
                            });
                          },
                        onEditPressed: () {
                          changeTaskStatus(
                            getCancelTaskModel.data?[index].sId ?? "",
                            "Cancel",
                                () {
                                  cancelTaskList();
                            },
                          );
                        }, backgroundColor: Colors.red[800]!,
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
