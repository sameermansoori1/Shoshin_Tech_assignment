import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech_assignment/models/detail_model.dart';
import 'dart:convert';

import 'package:shoshin_tech_assignment/models/tasks_model.dart';

class AppController extends GetxController {
  late List<TaskModel> taskModels;
  late List<DetailModel> detailModels;

  @override
  void onInit() {
    super.onInit();
    taskModels = RxList<TaskModel>();
    detailModels = RxList<DetailModel>();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final tasksJsonData =
    await rootBundle.loadString("assets/data/dummy_tasks.json");
    final detailsJsonData =
    await rootBundle.loadString("assets/data/dummy_details.json");

    final tasksList = json.decode(tasksJsonData) as List<dynamic>;
    final detailsList = json.decode(detailsJsonData) as List<dynamic>;

    taskModels.assignAll(tasksList.map((e) => TaskModel.fromJson(e)));
    detailModels.assignAll(detailsList.map((e) => DetailModel.fromJson(e)));

    update(); // This updates the state, causing the UI to rebuild.
  }
}
