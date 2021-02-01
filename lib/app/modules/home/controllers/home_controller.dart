import 'package:get/get.dart';
import 'package:todo/app/data/models/taskModel.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final RxBool isPinned = false.obs;

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  addTask(String taskName, String taskDescription) {
    TaskModel task =
        TaskModel(taskName: taskName, description: taskDescription);
    tasks.add(task);
    print(tasks);
  }

  sortPinned() {
    tasks.sort((a, b) => a.isPinned == true ? 0 : 1);
  }

  deleteTask(int index) {
    tasks.removeAt(index);
  }

  togglePin() {
    isPinned.toggle();
    print("star pressed");
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
