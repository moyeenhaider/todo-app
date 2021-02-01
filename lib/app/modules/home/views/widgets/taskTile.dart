import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/models/taskModel.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';

class TaskTile extends GetView<HomeController> {
  final TaskModel task;
  final Function onStarTap;
  final Function onSlidingTile;
  final Function deleteTask;

  TaskTile({this.task, this.onStarTap, this.deleteTask, this.onSlidingTile});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: GlobalKey(),

      ///call it in controller
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          //add to impotance and sort
          if (task.isImportant) {
            Get.snackbar(
                "ALready impotant", "Please make it unimportant first");
          } else {
            // task = task.switchImpotance();
            // controller.impotantTask();
            onSlidingTile();
          }
        }
        if (direction == DismissDirection.startToEnd) {
          if (task.isImportant) {
            Get.snackbar("Not impotant", "Please make it important first");
          } else {
            // task = task.switchImpotance();
            // controller.impotantTask();
            onSlidingTile();
          }

          //remove from impotance and sort
        }
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onLongPress: deleteTask,
            child: ListTile(
              hoverColor: Colors.red,
              leading: Text("#${task.id}"),
              title: Text(task.taskName),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: (task.isPinned ?? false)
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border),
                onPressed: onStarTap,
              ),
            ),
          )),
    );
  }
}

// isPinned ? Icon(Icons.star) : Icon(Icons.star_border)
