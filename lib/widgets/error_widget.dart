import 'package:flutter_ehliyet_sinavi/core/base/base_stateless_widget.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_autosize_text.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends BaseStatelessWidget {
  final String message;
  final bool isRetry;
  final dynamic Function()? retryFunction;
  const CustomErrorWidget(
      {super.key,
      required this.message,
      this.isRetry = false,
      this.retryFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetsConstants.errorGif,
            fit: BoxFit.contain,
            width: Get.width,
          ).paddingSymmetric(horizontal: Get.width * 0.01),
          SizedBox(
            height: Get.height * 0.05,
          ),
          ScaleFactorText(
            text: message,
            style: theme.textTheme.bodyLarge!.medium
                .copyWith(color: AppColors.secondaryBlackColor),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: Get.width * 0.01),
          SizedBox(
            height: Get.height * 0.05,
          ),
          _buildRetryButton(),
        ],
      ),
    );
  }

  Widget _buildRetryButton() {
    if (isRetry) {
      return InkWell(
        onTap: () {
          if (retryFunction != null) {
            retryFunction!();
          }
        },
        child: Container(
          width: Get.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.1),
            color: theme.primaryColor,
          ),
          child: ScaleFactorAutoSizeText(
            text: 'Tekrar Dene',
            style: theme.textTheme.bodyMedium!.bold
                .copyWith(color: AppColors.backgroundColor),
            textAlign: TextAlign.center,
            maxLines: 1,
          ).paddingSymmetric(vertical: 16.0),
        ).paddingSymmetric(horizontal: 16.0),
      );
    } else {
      return const SizedBox();
    }
  }
}
