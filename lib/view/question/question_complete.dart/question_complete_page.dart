import 'package:confetti/confetti.dart';
import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/service/routes/app_routes.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_complete.dart/question_complete_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_autosize_text.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class QuestionCompletePage extends BaseGetView<QuestionCompletePageController> {
  final String controllerTag;
  const QuestionCompletePage({super.key, required this.controllerTag});

  @override
  String get tag => controllerTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<QuestionCompletePageController>(
          init: controller,
          tag: tag,
          builder: (controller) {
            return _buildBody();
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        _buildScoreTable(),
        ConfettiWidget(
          confettiController: controller.confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: const [
            AppColors.primaryGreenColor,
            AppColors.primaryRedColor,
            AppColors.secondaryCardColor,
            AppColors.primaryColor,
          ],
          numberOfParticles: 20,
        ),
        Expanded(
          child: _buildResultText(),
        ),
        SizedBox(
          height: Get.height * 0.05,
        ),
        _buildMenu(),
        SizedBox(
          height: Get.height * 0.05,
        ),
      ],
    );
  }

  Widget _buildMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.home);
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.cardColor,
                ),
                child: Icon(
                  Icons.home_filled,
                  size: Get.width * 0.08,
                  color: theme.primaryColor,
                ).paddingAll(Get.width * 0.025),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              ScaleFactorText(
                text: 'Anasayfa',
                style: theme.textTheme.bodyLarge!.medium
                    .copyWith(color: AppColors.secondaryBlackColor),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => controller.replay(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.cardColor,
                ),
                child: Icon(
                  Icons.restart_alt_rounded,
                  size: Get.width * 0.08,
                  color: theme.primaryColor,
                ).paddingAll(Get.width * 0.025),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              ScaleFactorText(
                text: controller.isWrongQuestion ? 'Geri dön' : 'Tekrar oyna',
                style: theme.textTheme.bodyLarge!.medium
                    .copyWith(color: AppColors.secondaryBlackColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResultText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            ScaleFactorText(
              text: controller.getQuestionCategory(),
              style: theme.textTheme.titleLarge!.medium
                  .copyWith(color: AppColors.secondaryBlackColor),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Image(
              image: AssetImage(
                controller.getQuestionImg(),
              ),
              fit: BoxFit.cover,
              width: Get.width * 0.2,
              height: Get.width * 0.2,
            ),
          ],
        ),
        Column(
          children: [
            ScaleFactorText(
              text: controller.getInfoText(),
              style: theme.textTheme.titleLarge!.medium
                  .copyWith(color: AppColors.secondaryBlackColor),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            ScaleFactorText(
              text: controller.getInfoTypeText(),
              style: theme.textTheme.bodyLarge!.medium
                  .copyWith(color: AppColors.secondaryBlackColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreTable() {
    if (controller.questionType != QuestionType.VIDEO_QUESTION &&
        !controller.isWrongQuestion) {
      return Column(
        children: [
          Container(
            width: Get.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: theme.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleFactorAutoSizeText(
                        text: 'Doğru',
                        style: theme.textTheme.bodySmall!.medium
                            .copyWith(color: theme.scaffoldBackgroundColor),
                        maxLines: 1,
                      ),
                      4.height,
                      ScaleFactorAutoSizeText(
                        text: controller.questionTrueCount.toString(),
                        style: theme.textTheme.bodyMedium!.semibold
                            .copyWith(color: theme.scaffoldBackgroundColor),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 30,
                  color: theme.scaffoldBackgroundColor.withOpacity(0.3),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleFactorAutoSizeText(
                        text: 'Yanlış',
                        style: theme.textTheme.bodySmall!.medium
                            .copyWith(color: theme.scaffoldBackgroundColor),
                        maxLines: 1,
                      ),
                      4.height,
                      ScaleFactorAutoSizeText(
                        text: controller.questionFalseCount.toString(),
                        style: theme.textTheme.bodyMedium!.semibold
                            .copyWith(color: theme.scaffoldBackgroundColor),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 30,
                  color: theme.scaffoldBackgroundColor.withOpacity(0.3),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleFactorAutoSizeText(
                        text: 'Boş',
                        style: theme.textTheme.bodySmall!.medium
                            .copyWith(color: theme.scaffoldBackgroundColor),
                        maxLines: 1,
                      ),
                      4.height,
                      ScaleFactorAutoSizeText(
                        text: controller.questionEmptyCount.toString(),
                        style: theme.textTheme.bodyMedium!.semibold
                            .copyWith(color: theme.scaffoldBackgroundColor),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(
                horizontal: Get.width * 0.02, vertical: Get.width * 0.01),
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
