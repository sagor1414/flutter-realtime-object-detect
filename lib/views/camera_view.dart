import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detect/controller/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialzied.value
                ? Stack(
                    children: [
                      CameraPreview(controller.cameraController),
                      Positioned(
                        top: controller.y,
                        right: controller.x,
                        child: Container(
                          width: controller.w,
                          height: controller.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.green, width: 3)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  color: Colors.white,
                                  child: Text(controller.lable))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const Center(child: Text("Loading Preview .."));
          }),
    );
  }
}
