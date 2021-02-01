import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';

class BottomSheet extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Add Task")],
        ),
      ),
    );
  }
}
