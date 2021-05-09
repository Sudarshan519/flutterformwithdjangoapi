import 'dart:io';

import 'package:firebaseapi/app/modules/home/providers/home_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var selectedPath = ''.obs;
  var selectedImageSize = ''.obs;
  final count = 0.obs;

  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedPath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedPath.value).lengthSync()) / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
    }
    HomeProvider().posthero(selectedPath.value);
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
