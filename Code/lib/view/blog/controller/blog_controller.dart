import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/constants/data_constants.dart';
import 'package:lungs_pneumonia_ai/view/blog/model/blog_model.dart';

class BlogController extends GetxController {
  late List<BlogModel> blogList = [];

  @override
  Future<void> onInit() async {
    await loadJsonData();
    super.onInit();
  }

  Future loadJsonData() async {
    var jsonText = await rootBundle.loadString(DataConstants.instance.jSONPath.data);
    blogList = blogModelFromJson(jsonText);
    update();
  }
}
