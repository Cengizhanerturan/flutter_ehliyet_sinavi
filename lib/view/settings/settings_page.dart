import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/view/settings/settings_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/custom_appbar.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends BaseGetView<SettingsPageController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.settings),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildCard(),
                    ],
                  ).paddingSymmetric(horizontal: Get.width * 0.05),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Get.find<AdsService>().buildBannerAds(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return InkWell(
      onTap: () async => await controller.deleteAllData(),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          color: theme.cardColor,
          border: Helper.getBoxBorder(),
        ),
        child: Row(
          children: [
            Image(
              image: const AssetImage(
                AssetsConstants.deleteIcon,
              ),
              fit: BoxFit.cover,
              width: Get.width * 0.1,
              height: Get.width * 0.1,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Expanded(
              child: ScaleFactorText(
                text: StringConstants.deleteAllData,
                style: theme.textTheme.bodyLarge!.medium
                    .copyWith(color: AppColors.secondaryBlackColor),
              ),
            ),
          ],
        ).paddingSymmetric(
            horizontal: Get.width * 0.03, vertical: Get.width * 0.05),
      ).paddingSymmetric(vertical: Get.width * 0.02),
    );
  }
}
