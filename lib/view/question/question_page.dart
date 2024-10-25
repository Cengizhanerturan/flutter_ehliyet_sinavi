import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/model/question.dart';
import 'package:flutter_ehliyet_sinavi/core/util/extensions.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/widgets/empty_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/image_error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/loading_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_autosize_text.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter_ehliyet_sinavi/widgets/video_error_widget.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skeleton_text/skeleton_text.dart';

class QuestionPage extends BaseGetView<QuestionPageController> {
  final String controllerTag;
  const QuestionPage({super.key, required this.controllerTag});

  @override
  String get tag => controllerTag;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: controller.canBack.value,
      onPopInvokedWithResult: controller.onPopInvokedWithResult,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: GetBuilder(
                init: controller,
                tag: controllerTag,
                builder: (controller) {
                  return controller.obx(
                    (state) => _buildBody(),
                    onLoading: LoadingWidget(),
                    onEmpty: const CustomEmptyWidget(
                        message:
                            'Şuan için çözülebilecek herhangi bir soru bulunmamaktadır'),
                    onError: (error) => CustomErrorWidget(
                      message: StringConstants.errorText,
                      isRetry: true,
                      retryFunction: () async => await controller.onError(),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            _buildScoreTable(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.005,
                    ),
                    _buildQuestionArea(controller.pageController),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            _buildNextAndFinishButton(controller.pageController),
            SizedBox(
              height: Get.height * 0.016,
            ),
          ],
        ),
        Obx(() {
          if (controller.checkIsLoading) {
            return LoadingWidget();
          } else {
            return const SizedBox();
          }
        }),
      ],
    );
  }

  Widget _buildNextAndFinishButton(PageController pageController) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () async {
          await controller.nextAndFinishButton(pageController: pageController);
        },
        child: Container(
          width: Get.width * 0.16,
          height: Get.width * 0.13,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
            color: theme.cardColor,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Obx(
              () {
                if (controller.questionPageIndex.value <
                    controller.questionList.length - 1) {
                  return ImageIcon(
                    const AssetImage(AssetsConstants.nextIcon),
                    color: theme.primaryColor,
                    size: Get.width * 0.08,
                  );
                } else {
                  return ImageIcon(
                    const AssetImage(AssetsConstants.finishIcon),
                    color: theme.primaryColor,
                    size: Get.width * 0.08,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionArea(PageController pageController) {
    return ExpandablePageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.questionList.length,
        controller: pageController,
        onPageChanged: (value) {},
        itemBuilder: (BuildContext context, index) {
          var questionModel = controller.questionList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildQuestion(
                  questionModel: questionModel, index: index, context: context),
              SizedBox(
                height: Get.height * 0.025,
              ),
              _buildAnswer(answer: 'a', questionModel: questionModel),
              SizedBox(
                height: Get.height * 0.015,
              ),
              _buildAnswer(answer: 'b', questionModel: questionModel),
              SizedBox(
                height: Get.height * 0.015,
              ),
              _buildAnswer(answer: 'c', questionModel: questionModel),
              SizedBox(
                height: Get.height * 0.015,
              ),
              _buildAnswer(answer: 'd', questionModel: questionModel),
            ],
          ).paddingSymmetric(horizontal: Get.width * 0.05);
        });
  }

  Widget _buildQuestion(
      {required QuestionModel questionModel,
      required int index,
      required BuildContext context}) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        color: theme.cardColor,
      ),
      child: Column(
        children: [
          _buildQuestionNumber(),
          SizedBox(
            height: Get.height * 0.01,
          ),
          _buildQuestionMedia(model: questionModel, context: context),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: ScaleFactorAutoSizeText(
              text: questionModel.question,
              style: theme.textTheme.bodyMedium!.regular
                  .copyWith(color: AppColors.secondaryBlackColor),
              textAlign: TextAlign.center,
              minFontSize: 0,
            ),
          ).paddingSymmetric(horizontal: Get.width * 0.03),
          SizedBox(
            height: Get.height * 0.03,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionNumber() {
    if (controller.questionType != QuestionType.VIDEO_QUESTION) {
      return Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.03),
            bottomRight: Radius.circular(Get.width * 0.03),
          ),
        ),
        child: ScaleFactorText(
          text:
              'Soru ${controller.questionPageIndex.value + 1}/${controller.questionList.length}',
          style: theme.textTheme.bodyMedium!.semibold.copyWith(
            color: theme.scaffoldBackgroundColor,
          ),
        ).paddingSymmetric(
            horizontal: Get.width * 0.1, vertical: Get.height * 0.005),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.03),
            bottomRight: Radius.circular(Get.width * 0.03),
          ),
        ),
        child: ScaleFactorText(
          text: controller.questionType.getTurkishString,
          style: theme.textTheme.bodyMedium!.semibold.copyWith(
            color: theme.scaffoldBackgroundColor,
          ),
        ).paddingSymmetric(
            horizontal: Get.width * 0.08, vertical: Get.height * 0.005),
      );
    }
  }

  Widget _buildAnswer(
      {required QuestionModel questionModel, required String answer}) {
    return Row(
      children: [
        Obx(
          () => Container(
            width: Get.width * 0.085,
            height: Get.width * 0.085,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.answerTypeCardColorController(
                    answer: answer, correctAnswer: questionModel.answer)),
            child: Align(
              alignment: Alignment.center,
              child: ScaleFactorText(
                text: answer.toUpperCase(),
                style: theme.textTheme.bodyLarge!.medium.copyWith(
                    color: controller.answerTypeTextColorController(
                        answer: answer, correctAnswer: questionModel.answer)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.02,
        ),
        Expanded(
          child: InkWell(
            onTap: () => controller.clickedAnswer(answer, questionModel.answer),
            child: Obx(
              () => Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                  color: controller.answerCardColorController(
                      answer: answer, correctAnswer: questionModel.answer),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: ScaleFactorAutoSizeText(
                    text: questionModel.toJson()[answer],
                    style: theme.textTheme.bodyMedium!.regular.copyWith(
                        color: controller.answerCardTextColorController(
                            answer: answer,
                            correctAnswer: questionModel.answer)),
                    textAlign: TextAlign.center,
                    minFontSize: 0,
                  ).paddingSymmetric(
                      horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScoreTable() {
    if (controller.questionType != QuestionType.VIDEO_QUESTION) {
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
                      Obx(
                        () => ScaleFactorAutoSizeText(
                          text: controller.questionTrueCount.value.toString(),
                          style: theme.textTheme.bodyMedium!.semibold
                              .copyWith(color: theme.scaffoldBackgroundColor),
                          maxLines: 1,
                        ),
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
                      Obx(
                        () => ScaleFactorAutoSizeText(
                          text: controller.questionFalseCount.value.toString(),
                          style: theme.textTheme.bodyMedium!.semibold
                              .copyWith(color: theme.scaffoldBackgroundColor),
                          maxLines: 1,
                        ),
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
                      Obx(
                        () => ScaleFactorAutoSizeText(
                          text: controller.questionEmptyCount.value.toString(),
                          style: theme.textTheme.bodyMedium!.semibold
                              .copyWith(color: theme.scaffoldBackgroundColor),
                          maxLines: 1,
                        ),
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

  Widget _buildQuestionMedia(
      {required QuestionModel model, required BuildContext context}) {
    if (model.questionImage != null && model.questionImage!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: model.questionImage!,
        imageBuilder: (context, imageProvider) => Column(
          children: [
            Container(
              width: Get.width,
              height: Get.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.04),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        placeholder: (context, url) => SkeletonAnimation(
          child: SizedBox(
            width: Get.width,
            height: Get.width * 0.5,
          ),
        ),
        errorWidget: (context, url, error) => LayoutBuilder(
          builder: (context, constraint) {
            return ImageErrorWidget(
              width: Get.width,
              height: Get.width * 0.5,
              isContainer: true,
            );
          },
        ),
      ).paddingSymmetric(horizontal: Get.width * 0.03);
    } else if (model.questionVideo != null && model.questionVideo!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        child: FlickVideoPlayer(
          flickManager: controller.initVideoPlayer(model: model),
          flickVideoWithControls: FlickVideoWithControls(
            controls: const FlickPortraitControls(),
            backgroundColor: theme.cardColor,
            playerLoadingFallback: LoadingWidget(),
            playerErrorFallback: VideoErrorWidget(
              width: Get.width,
              isContainer: true,
              color: theme.scaffoldBackgroundColor,
            ),
          ),
        ),
      ).paddingSymmetric(horizontal: Get.width * 0.03);
    } else {
      return const SizedBox();
    }
  }
}
