import 'package:flutter_ehliyet_sinavi/core/base/base_stateless_widget.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends BaseStatelessWidget {
  final String message;
  const CustomDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
      ),
      elevation: 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.theme.cardColor,
                    border: Helper.getBoxBorder(),
                  ),
                  child: Icon(
                    Icons.close,
                    size: Get.width * 0.05,
                  ).paddingAll(Get.width * 0.02),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            ScaleFactorText(
              text: message,
              style: Get.theme.textTheme.bodyLarge!.medium.copyWith(
                color: AppColors.secondaryBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                  color: AppColors.primaryColor,
                ),
                child: ScaleFactorText(
                  text: 'Tamam',
                  style: Get.theme.textTheme.bodyMedium!.semibold.copyWith(
                    color: theme.scaffoldBackgroundColor,
                  ),
                ).paddingSymmetric(horizontal: 36.0, vertical: 12.0),
              ),
            ),
          ],
        ).paddingAll(16.0),
      ),
    );
  }
}
