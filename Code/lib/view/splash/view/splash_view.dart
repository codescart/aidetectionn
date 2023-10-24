// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/constants/image_constants.dart';
import 'package:lungs_pneumonia_ai/core/init/theme/color/color_theme.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (splashController) {
        return Scaffold(
          backgroundColor: AppColors().mainBlueColor,
          body: Center(
            child: SvgPicture.asset(
              ImageConstants.instance.svgPath.lungs,
              color: AppColors().backgroundColor,
            ),
          ),
        );
      },
    );
  }
}
