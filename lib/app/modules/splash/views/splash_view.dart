import 'package:banku/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({super.key}) {
    Get.put(SplashController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png', width: 200, height: 200),
      ),
    );
  }
}
