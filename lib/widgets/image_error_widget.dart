import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageErrorWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isContainer;
  final Color? color;
  const ImageErrorWidget(
      {super.key,
      required this.width,
      required this.height,
      this.isContainer = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: isContainer
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width * 0.03),
              color: color ?? Get.theme.dividerColor,
            )
          : null,
      child: SizedBox(
        child: Center(
          child: Icon(
            Icons.image,
            color: Get.theme.cardColor,
            size: isContainer ? width - width * 0.5 : width,
          ),
        ),
      ),
    );
  }
}
