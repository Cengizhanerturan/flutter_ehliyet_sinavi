import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/model/topic_explanations.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/core/util/get_extension.dart';
import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topic_explanations_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/custom_appbar.dart';
import 'package:flutter_ehliyet_sinavi/widgets/empty_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicExplanationsPage
    extends BaseGetView<TopicExplanationsPageController> {
  const TopicExplanationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.topicExplanations),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: controller.obx(
            (state) => _buildList(),
            onLoading: LoadingWidget(),
            onEmpty: const CustomEmptyWidget(
                message:
                    'Şuan için herhangi bir konu anlatımı bulunmamaktadır'),
            onError: (error) => CustomErrorWidget(
              message: StringConstants.errorText,
              isRetry: true,
              retryFunction: () async => await controller.onError(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.list.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildCard(model: controller.list[index]);
            },
          ).paddingSymmetric(horizontal: Get.width * 0.05),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Get.find<AdsService>().buildBannerAds(),
      ],
    );
  }

  Widget _buildCard({required TopicExplanationsModel model}) {
    return InkWell(
      onTap: () {
        Get.toTopicsPage(model: model);
      },
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
                AssetsConstants.documentsIcon,
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
                text: model.name,
                style: theme.textTheme.bodyMedium!.medium
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
