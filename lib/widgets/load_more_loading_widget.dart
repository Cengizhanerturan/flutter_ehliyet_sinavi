import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadMoreLoadingWidget extends StatelessWidget {
  const LoadMoreLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.06,
      child: Center(
        child: ScaleFactorText(
          text: 'Yükleniyor...',
          style: Get.theme.textTheme.bodyMedium!.medium,
        ),
      ),
    );
  }
}
