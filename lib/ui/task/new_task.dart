import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/ui/Utills/SnacbarMessage.dart';
import 'package:task_manager/widgets/item_progress_dashboard_widget.dart';
import 'package:task_manager/widgets/screen_background_widget.dart';
import 'dart:developer';
import '../../data/urls.dart';
import '../../widgets/app_task_item_card.dart';
import '../../data/model/taskModel.dart';
import '../../widgets/change_task_BottomSheet.dart';
import '../../widgets/deletedTask.dart';

class MyNewTask extends StatefulWidget {
  const MyNewTask({Key? key}) : super(key: key);

  @override
  State<MyNewTask> createState() => _MyNewTaskState();
}

bool isLoading = false;
String? newTaskCount, cancelTaskCount,completedTaskCount,progressTaskCount;

class _MyNewTaskState extends State<MyNewTask> {

 static GetTaskModel getNewTaskModel = GetTaskModel();


  @override
  void initState() {
    newTaskList();
    statusCount();
    super.initState();
  }
  Future<void> statusCount()async{

    final responseNewTask = await NetworkUtils.httpGetMethod(Urls.newTaskList);
    final getNewTaskModel = GetTaskModel.fromJson(responseNewTask);
    setState(() {
      newTaskCount = "${getNewTaskModel.data?.length ?? 0}";
    });

    setState(() {
    newTaskCount = "${getNewTaskModel.data?.length ?? 0}";
  });

     final responseCancelTask = await NetworkUtils.httpGetMethod(Urls.cancelTaskList);
     final getCaneTaskModel = GetTaskModel.fromJson(responseCancelTask);
  setState(() {
    cancelTaskCount = "${getCaneTaskModel.data?.length ?? 0}";
  });


     final responseCompletedTask = await NetworkUtils.httpGetMethod(Urls.completedTaskList);
     final getCompletedTaskModel = GetTaskModel.fromJson(responseCompletedTask);
    setState(() {
      completedTaskCount = "${getCompletedTaskModel.data?.length ?? 0}";
    });

     final responseProgressTask = await NetworkUtils.httpGetMethod(Urls.progressTaskList);
     final getProgressTaskModel = GetTaskModel.fromJson(responseProgressTask);
     setState(() {
       progressTaskCount = "${getProgressTaskModel.data?.length ?? 0}";
     });

  }

  Future<void> newTaskList() async {
    isLoading = true;
    setState(() {});
    final result = await NetworkUtils.httpGetMethod(
      Urls.newTaskList,
    );
    isLoading = false;
    setState(() {});
    log("New task result: $result");
    if (result != null) {
      getNewTaskModel = GetTaskModel.fromJson(result);
    } else {
      if (mounted) {
        snackBarMessage(context, 'Something went wrong!!!', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
      children: [
          SizedBox(height: 8,),
          Row(
            children:  [
              Expanded(
                child: ItemCountBoard(
                  cardBackgroundColor: Colors.blue[100]!,
                  itemCount: newTaskCount??"0",
                  itemName: 'New',
                ),
              ),
              Expanded(
                child: ItemCountBoard(
                  cardBackgroundColor: Colors.green[100]!,
                  itemCount: completedTaskCount??"0",
                  itemName: 'Completed',
                ),
              ),
              Expanded(
                child: ItemCountBoard(
                  cardBackgroundColor: Colors.red[100]!,
                  itemCount: cancelTaskCount??"0",
                  itemName: 'Cancel',
                ),
              ),
              Expanded(
                  child: ItemCountBoard(
                    cardBackgroundColor: Colors.purple[100]!,
                itemCount: progressTaskCount??"0",
                itemName: 'Progress',
              )),
            ],
          ),
          SizedBox(height: 12,),
          Expanded(
            child: isLoading
                ? (const Center(
                    child: CircularProgressIndicator(),
                  ))
                : RefreshIndicator(
                    onRefresh: newTaskList,
                    child: ListView.builder(
                        itemCount: getNewTaskModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ItemCard(
                            taskName: getNewTaskModel.data?[index].title ?? "",
                            taskDescription:
                                getNewTaskModel.data?[index].description ?? "",
                            createdDate:
                                getNewTaskModel.data?[index].createdDate ?? "",
                            typeOfTask: getNewTaskModel.data?[index].status ?? "",
                            onDeletePressed: () {
                              onTaskDeleted(
                                  getNewTaskModel.data?[index].title ?? "",
                                  getNewTaskModel.data?[index].sId ?? "", () {
                                newTaskList();
                                statusCount();
                              });
                            },
                            onEditPressed: () {
                              changeTaskStatus(
                                getNewTaskModel.data?[index].sId ?? "",
                                "New",
                                () {
                                  newTaskList();
                                  statusCount();
                                },
                              );
                            }, backgroundColor: Colors.blue[800]!,
                          );
                        }),
                  ),
          )
      ],
    ),
        ));
  }
  


}
