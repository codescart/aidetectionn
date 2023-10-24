import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';
import 'package:lungs_pneumonia_ai/core/constants/image_constants.dart';
import 'package:lungs_pneumonia_ai/core/init/theme/color/color_theme.dart';
import 'package:lungs_pneumonia_ai/view/blog/controller/blog_controller.dart';
import 'package:lungs_pneumonia_ai/view/home/view/widget/title_with_description_widget.dart';
import 'blog_detail_view.dart';

class BlogView extends GetView<BlogController> {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: GetBuilder<BlogController>(
          init: BlogController(),
          builder: (blogController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithDescription(title: "blog", description: "blogInfo"),
                SizedBox(
                  height: Utility(context).dynamicHeight(0.70),
                  width: Utility(context).dynamicWidth(1),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: Utility(context).dynamicWidthPixel(18)),
                    shrinkWrap: true,
                    itemCount: blogController.blogList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(BlogDetailView(index: index));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: Utility(context).dynamicWidthPixel(22)),
                          child: Column(
                            children: [
                              Container(
                                width: Utility(context).dynamicWidth(1),
                                height: Utility(context).dynamicWidthPixel(150),
                                decoration: BoxDecoration(
                                  color: AppColors().white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Utility(context).dynamicHeightPixel(22)),
                                    topRight: Radius.circular(Utility(context).dynamicHeightPixel(22)),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(ImageConstants.instance.jpgPath.dummyImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: Utility(context).dynamicWidth(1),
                                height: Utility(context).dynamicWidthPixel(140),
                                decoration: BoxDecoration(
                                  color: AppColors().white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(Utility(context).dynamicHeightPixel(22)),
                                    bottomRight: Radius.circular(Utility(context).dynamicHeightPixel(22)),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: Utility(context).dynamicWidthPixel(16),
                                    left: Utility(context).dynamicWidthPixel(16),
                                    top: Utility(context).dynamicWidthPixel(16),
                                    bottom: Utility(context).dynamicWidthPixel(22),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          blogController.blogList[index].title,
                                          style: Utility(context).textTheme.titleSmall!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          blogController.blogList[index].text,
                                          style: Utility(context).textTheme.bodySmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
