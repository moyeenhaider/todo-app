import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/modules/home/views/widgets/taskTile.dart';

class TasksList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: controller.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final task = controller.tasks[index].copyWith(id: index + 1);
            return TaskTile(
              task: task,
              onStarTap: () {
                controller.tasks[index] = task.togglePin();
                controller.sortPinned();
              },
              onSlidingTile: () {
                // controller.tasks[index] = task.switchImpotance();
                // controller.impotantTask();
              },
              deleteTask: () {},
              //deleting task controller.deleteTask(index);
            );
          },
        ),
      ),
    );
  }
}

// (DismissDirection direction) {
//                 if (direction == DismissDirection.endToStart) {
//                   //add to impotance and sort
//                   if (controller.tasks[index].isImportant) {
//                     Get.snackbar(
//                         "ALready impotant", "Please make it unimportant first");
//                   } else {
//                     controller.tasks[index] = task.switchImpotance();
//                     controller.impotantTask();
//                   }
//                 }
//                 if (direction == DismissDirection.startToEnd) {
//                   if (controller.tasks[index].isImportant) {
//                     Get.snackbar(
//                         "Not impotant", "Please make it important first");
//                   } else {
//                     controller.tasks[index] = task.switchImpotance();
//                     controller.impotantTask();
//                   }

//                   //remove from impotance and sort
//                 }
//               }
