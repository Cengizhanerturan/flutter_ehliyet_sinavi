import 'package:flutter_ehliyet_sinavi/core/base/base_stateless_widget.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyWidget extends BaseStatelessWidget {
  final String message;
  const CustomEmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetsConstants.emptyGif,
            fit: BoxFit.contain,
            width: Get.width,
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          ScaleFactorText(
            text: message,
            style: theme.textTheme.bodyLarge!.medium
                .copyWith(color: AppColors.secondaryBlackColor),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: Get.width * 0.01),
        ],
      ),
    );
  }
}
