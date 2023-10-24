import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';
import 'package:lungs_pneumonia_ai/core/init/theme/color/color_theme.dart';
import 'package:lungs_pneumonia_ai/view/onboarding/controller/onboarding_controller.dart';
import '../../../core/base/components/button/base_button.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: Utility(context).dynamicWidthPixel(160),
        ),
        child: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          builder: (onboardingController) {
            return CarouselSlider.builder(
              carouselController: onboardingController.buttonCarouselController,
              options: CarouselOptions(
                  height: Utility(context).dynamicHeight(1),
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  enableInfiniteScroll: false),
              itemCount: onboardingController.itemList.length,
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        Text(
                          onboardingController.itemList[index].title!.tr,
                          style: Utility(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Utility(context).dynamicWidth(0.070),
                          ),
                          child: SvgPicture.asset(
                            onboardingController.itemList[index].imagePath!,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Utility(context).dynamicWidth(0.80),
                          ),
                          child: SizedBox(
                            width: Utility(context).dynamicWidth(0.80),
                            child: Text(
                              onboardingController.itemList[index].description!.tr,
                              style: Utility(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: Utility(context).dynamicWidth(0.20),
                      child: BaseButton(
                        buttonText: index != onboardingController.itemList.length - 1 ? 'next'.tr : 'skip'.tr,
                        onPressed: () {
                          onboardingController.nextOnboardingScreen(index);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
