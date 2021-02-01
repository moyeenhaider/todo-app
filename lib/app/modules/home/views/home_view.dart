import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/modules/home/views/widgets/bottomSheet.dart';
import 'package:todo/app/modules/home/views/widgets/tasksList.dart';

class HomeView extends GetView<HomeController> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController taskNameControler = TextEditingController();
  final TextEditingController taskDescNameControler = TextEditingController();

  final kInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueAccent, //this has no effect
        ),
        borderRadius: BorderRadius.circular(10.0)),
    hintText: "Task Name",
  );

  Widget buildBottomSheet() {
    return SingleChildScrollView(
      child: Container(
        height: 300,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add Task",
                style: TextStyle(fontSize: 25, color: Colors.blueAccent),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: taskNameControler,
                decoration: kInputDecoration.copyWith(hintText: "Task Name"),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: taskDescNameControler,
                decoration:
                    kInputDecoration.copyWith(hintText: "Task Description"),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  if (taskNameControler.text.trim().isNotEmpty &&
                      taskDescNameControler.text.trim().isNotEmpty) {
                    controller.addTask(
                        taskNameControler.text, taskDescNameControler.text);
                    taskNameControler.clear();
                    taskDescNameControler.clear();
                    Get.back();
                  } else {
                    Get.back();

                    Get.snackbar("Error", "Please ENter all the fields",
                        backgroundColor: Colors.blueAccent,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Icon(
                  Icons.check,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            Get.bottomSheet(
              buildBottomSheet(),
              isDismissible: true,
            );
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  // '${Provider.of<TaskData>(context).taskCount} Tasks',
                  controller.tasks.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
