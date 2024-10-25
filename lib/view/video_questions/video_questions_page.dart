import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/model/video_questions.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/core/util/get_extension.dart';
import 'package:flutter_ehliyet_sinavi/view/video_questions/video_questions_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/custom_appbar.dart';
import 'package:flutter_ehliyet_sinavi/widgets/empty_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/load_more_loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class VideoQuestionsPage extends BaseGetView<VideoQuestionsPageController> {
  const VideoQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.videoQuestions),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: controller.obx(
            (state) => _buildList(),
            onLoading: LoadingWidget(),
            onEmpty: const CustomEmptyWidget(
                message: 'Şuan için herhangi bir videolu soru bulunmamaktadır'),
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

  Widget _buildCard({
    required VideoQuestionsModel model,
    required int questionIndex,
  }) {
    return Stack(
      children: [
        InkWell(
          onTap: () async {
            if (!model.locked.value) {
              Get.find<AdsService>().showRewardedVideoAds();
              await Get.toQuestionPage(
                id: model.id,
                questionType: model.questionType,
                questionIndex: questionIndex,
              );
            }
          },
          child: Container(
            width: Get.width,
            height: Get.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width * 0.04),
              color: theme.cardColor,
              border: Helper.getBoxBorder(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    AssetsConstants.playIcon,
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
            ).paddingSymmetric(horizontal: Get.width * 0.03),
          ).paddingSymmetric(vertical: Get.width * 0.02),
        ),
        _buildLock(isLock: model.locked),
      ],
    );
  }

  Widget _buildLock({required RxBool isLock}) {
    return Obx(() {
      if (isLock.value) {
        return Container(
          width: Get.width,
          height: Get.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.04),
            color: theme.cardColor.withOpacity(0.9),
            border: Helper.getBoxBorder(),
          ),
          child: Center(
            child: Image(
              image: const AssetImage(
                AssetsConstants.lockIcon,
              ),
              fit: BoxFit.cover,
              width: Get.width * 0.1,
              height: Get.width * 0.1,
            ),
          ),
        ).paddingSymmetric(vertical: Get.width * 0.02);
      } else {
        return const SizedBox();
      }
    });
  }

  Widget _buildList() {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => LazyLoadScrollView(
              scrollOffset: (Get.height * 0.1).toInt(),
              onEndOfPage: () async =>
                  await controller.getData(isLazyLoad: true),
              isLoading: controller.isLoadingMore.value,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.isLoadingMore.value
                    ? controller.list.length + 1
                    : controller.list.length,
                itemBuilder: (BuildContext context, int index) {
                  if (controller.list.length == index) {
                    return LoadMoreLoadingWidget();
                  }
                  return Column(
                    children: [
                      _buildCard(
                          model: controller.list[index], questionIndex: index),
                      if (index == controller.list.length - 1)
                        SizedBox(
                          height: Get.height * 0.03,
                        )
                    ],
                  );
                },
              ).paddingSymmetric(horizontal: Get.width * 0.05),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Get.find<AdsService>().buildBannerAds(),
      ],
    );
  }
}
