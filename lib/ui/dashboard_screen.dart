import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/shared_preferece_data.dart';
import 'package:task_manager/ui/app_screen/new_task_screen.dart';
import 'package:task_manager/ui/task/cancel_task.dart';
import 'package:task_manager/ui/task/compled_task.dart';
import 'package:task_manager/ui/task/in_progress_task.dart';
import 'package:task_manager/ui/task/new_task.dart';
import '../data/urls.dart';
import '../widgets/app_bar_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() =>
      _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedScreen = 0;




  List<Widget> navScreen = [
    const MyNewTask(),
    const MyCompletedTask(),
    const MyCancelTask(),
    const MyInProgressTask()
  ];

  @override
  void initState() {
    SharedPrefData.getDataFromSharedPref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppTaskBar(
            context,
            Urls.DefaultProfilePic,
            SharedPrefData.userFirstName ?? "",
            SharedPrefData.userLastName ?? "",
            SharedPrefData.userEmail ?? "",


        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const NewTaskItem()));
            Get.to(const NewTaskItem());
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        currentIndex: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_label_outlined), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel), label: 'Cancel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_saver_off_sharp), label: 'In Progress'),
        ],
        onTap: (index) {
          _selectedScreen = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: navScreen.elementAt(_selectedScreen)),
          ],
        ),
      )

    );
  }
}
