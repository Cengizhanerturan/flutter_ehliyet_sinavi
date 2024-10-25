import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/model/question.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/core/util/extensions.dart';
import 'package:flutter_ehliyet_sinavi/core/util/get_extension.dart';
import 'package:flutter_ehliyet_sinavi/view/wrong_questions/wrong_questions_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/custom_appbar.dart';
import 'package:flutter_ehliyet_sinavi/widgets/empty_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_autosize_text.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrongQuestionsPage extends BaseGetView<WrongQuestionsPageController> {
  const WrongQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.wrongQuestions),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: controller.obx(
            (state) => _buildList(),
            onLoading: LoadingWidget(),
            onEmpty: const CustomEmptyWidget(
                message: 'Yanlış yapılan sorunuz bulunmamaktadır'),
            onError: (error) => CustomErrorWidget(
              message: StringConstants.errorText,
              isRetry: true,
              retryFunction: () => controller.onError(),
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
              var model = controller.list[index];
              return _buildCard(model: model, questionIndex: index);
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

  Widget _buildCard({
    required QuestionModel model,
    required int questionIndex,
  }) {
    return InkWell(
      onTap: () async {
        Get.find<AdsService>().showRewardedVideoAds();
        await Get.toQuestionPage(
          id: model.id,
          questionType: model.questionType,
          questionIndex: questionIndex,
          isWrongQuestion: true,
          wrongQuestionModel: model,
        );
      },
      child: Container(
        width: Get.width,
        height: Get.height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          color: theme.cardColor,
          border: Helper.getBoxBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      model.questionTypeIcon,
                    ),
                    fit: BoxFit.cover,
                    width: Get.width * 0.1,
                    height: Get.width * 0.1,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ScaleFactorAutoSizeText(
                          text: model.question,
                          style: theme.textTheme.bodyMedium!.medium
                              .copyWith(color: AppColors.secondaryBlackColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        SizedBox(
                          height: Get.height * 0.008,
                        ),
                        ScaleFactorText(
                          text: model.questionType.getTurkishString,
                          style: theme.textTheme.bodySmall!.medium.copyWith(
                              color: AppColors.secondaryBlackColor
                                  .withOpacity(0.5)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: Get.width * 0.05,
                color: theme.cardColor,
              ).paddingAll(Get.width * 0.01),
            ),
          ],
        ).paddingSymmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
      ).paddingSymmetric(vertical: Get.width * 0.02),
    );
  }
}
