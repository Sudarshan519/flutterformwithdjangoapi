import 'dart:io';

import 'package:firebaseapi/app/modules/home/providers/home_provider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  getData() {
    //HomeProvider().postdata();
    //HomeProvider().getdata();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => controller.selectedPath.value == ''
                ? Text(
                    'Select image from camera/gallery',
                    style: TextStyle(fontSize: 20),
                  )
                : Image.file(File(controller.selectedPath.value))),
            SizedBox(height: 10),
            Obx(() => Text(controller.selectedImageSize.value == ''
                ? ''
                : controller.selectedImageSize.value)),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            InkWell(
                onTap: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text('Browser'))
          ],
        ),
      ),
    );
  }
}
