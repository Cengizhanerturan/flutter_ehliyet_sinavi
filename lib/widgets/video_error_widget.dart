import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoErrorWidget extends StatelessWidget {
  final double width;
  final double? height;
  final bool isContainer;
  final Color? color;
  const VideoErrorWidget({
    super.key,
    required this.width,
    this.height,
    this.isContainer = false,
    this.color,
  });

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
            Icons.error,
            color: Get.theme.cardColor,
            size: isContainer ? width * 0.3 : width,
          ),
        ),
      ),
    );
  }
}
