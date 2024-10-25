import 'package:flutter_ehliyet_sinavi/core/base/base_stateless_widget.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExitAppDialog extends BaseStatelessWidget {
  const ExitAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
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
              height: Get.height * 0.01,
            ),
            ScaleFactorText(
              text: 'Uygulamadan Çık',
              style: Get.theme.textTheme.titleSmall!.medium.copyWith(
                color: AppColors.secondaryBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            ScaleFactorText(
              text: 'Uygulamadan çıkmak istediğinizden emin misiniz?',
              style: Get.theme.textTheme.bodyMedium!.regular.copyWith(
                color: AppColors.secondaryBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                      color: AppColors.primaryRedColor,
                    ),
                    child: ScaleFactorText(
                      text: 'Çık',
                      style: Get.theme.textTheme.bodyMedium!.semibold.copyWith(
                        color: theme.scaffoldBackgroundColor,
                      ),
                    ).paddingSymmetric(horizontal: 36.0, vertical: 12.0),
                  ),
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
                      text: 'İptal',
                      style: Get.theme.textTheme.bodyMedium!.semibold.copyWith(
                        color: theme.scaffoldBackgroundColor,
                      ),
                    ).paddingSymmetric(horizontal: 36.0, vertical: 12.0),
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(16.0),
      ),
    );
  }
}
