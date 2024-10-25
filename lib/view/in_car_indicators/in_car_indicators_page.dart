import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/model/in_car_indicators.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/view/in_car_indicators/in_car_indicators_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/custom_appbar.dart';
import 'package:flutter_ehliyet_sinavi/widgets/empty_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/image_error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/load_more_loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:skeleton_text/skeleton_text.dart';

class InCarIndicatorsPage extends BaseGetView<InCarIndicatorsPageController> {
  const InCarIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.inCarIndicators),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: controller.obx(
            (state) => _buildList(),
            onLoading: LoadingWidget(),
            onEmpty: const CustomEmptyWidget(
                message:
                    'Şuan için herhangi bir araç içi gösterge bulunmamaktadır'),
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
                itemBuilder: (context, i) {
                  if (controller.list.length == i) {
                    return LoadMoreLoadingWidget();
                  }
                  return Column(
                    children: [
                      _buildCard(model: controller.list[i]),
                      if (i == controller.list.length - 1)
                        SizedBox(
                          height: Get.height * 0.03,
                        )
                    ],
                  );
                },
              ),
            ).paddingSymmetric(horizontal: Get.width * 0.05),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Get.find<AdsService>().buildBannerAds(),
      ],
    );
  }

  Widget _buildCard({required InCarIndicatorsModel model}) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        color: theme.cardColor,
        border: Helper.getBoxBorder(),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: model.imgUrl,
            imageBuilder: (context, imageProvider) => Column(
              children: [
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            placeholder: (context, url) => SkeletonAnimation(
              child: SizedBox(
                width: Get.width * 0.3,
                height: Get.width * 0.3,
              ),
            ),
            errorWidget: (context, url, error) => LayoutBuilder(
              builder: (context, constraint) {
                return ImageErrorWidget(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  isContainer: true,
                );
              },
            ),
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
      ).paddingAll(Get.width * 0.03),
    ).paddingSymmetric(vertical: Get.width * 0.02);
  }
}
