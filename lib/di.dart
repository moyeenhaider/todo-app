import 'package:get/get.dart';
import 'package:todo/app/data/models/taskModel.dart';

class Di {
  @override
  Future<void> initState() {
    Get.lazyPut(() => TaskModel());
  }
}
