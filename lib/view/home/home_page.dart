import 'package:flutter_ehliyet_sinavi/core/base/base_get_view.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/core/service/routes/app_routes.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/view/home/home_page_controller.dart';
import 'package:flutter_ehliyet_sinavi/widgets/dialogs/exit_app_dialog.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends BaseGetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        await Helper.openDialog(dialog: const ExitAppDialog());
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                _buildAppBar(),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                _buildStatistics(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        _buildCategories(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScaleFactorText(
          text: StringConstants.welcomeText,
          style: theme.textTheme.titleLarge!.medium,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.settings);
            Get.find<AdsService>().showInterstitialAds();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.cardColor,
              border: Helper.getBoxBorder(),
            ),
            child: Image(
              image: const AssetImage(AssetsConstants.userIcon),
              width: Get.width * 0.08,
              height: Get.width * 0.08,
            ).paddingAll(Get.width * 0.02),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: Get.width * 0.05);
  }

  Widget _buildStatistics() {
    return Container(
      width: Get.width,
      color: theme.cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScaleFactorText(
            text: StringConstants.myStatisticsText,
            style: theme.textTheme.titleMedium!.medium
                .copyWith(color: AppColors.secondaryBlackColor),
          ),
          SizedBox(
            height: Get.width * 0.05,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => _buildStatisticsCard(
                          title: StringConstants.totalQuizText,
                          subtitle:
                              controller.user.value?.totalExam.toString() ??
                                  '0',
                          image: AssetsConstants.conversationIcon),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Obx(
                      () => _buildStatisticsCard(
                          title: StringConstants.totalTrueText,
                          subtitle:
                              controller.user.value?.trueCount.toString() ??
                                  '0',
                          image: AssetsConstants.checkedIcon),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.03,
              ),
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => _buildStatisticsCard(
                          title: StringConstants.totalQuestionText,
                          subtitle:
                              controller.user.value?.totalQuestion.toString() ??
                                  '0',
                          image: AssetsConstants.questionIcon),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Obx(
                      () => _buildStatisticsCard(
                          title: StringConstants.totalFalseText,
                          subtitle:
                              controller.user.value?.falseCount.toString() ??
                                  '0',
                          image: AssetsConstants.cancelIcon),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(
          horizontal: Get.width * 0.05, vertical: Get.width * 0.06),
    );
  }

  Widget _buildStatisticsCard(
      {required String title,
      required String subtitle,
      required String image}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        color: theme.scaffoldBackgroundColor,
        border: Helper.getBoxBorder(),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
            width: Get.width * 0.1,
            height: Get.width * 0.1,
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          Expanded(
            child: Column(
              children: [
                ScaleFactorText(
                  text: title,
                  style: theme.textTheme.bodyMedium!.medium,
                ),
                SizedBox(
                  height: Get.width * 0.01,
                ),
                ScaleFactorText(
                  text: subtitle,
                  style: theme.textTheme.bodyMedium!.semibold,
                ),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(
          horizontal: Get.width * 0.03, vertical: Get.width * 0.05),
    );
  }

  Widget _buildCategories() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              _buildCategoryCard(
                title: StringConstants.topicExplanations,
                image: AssetsConstants.documentsIcon,
                onTap: () {
                  Get.toNamed(Routes.topicExplanations);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.videoQuestions,
                image: AssetsConstants.playIcon,
                onTap: () async {
                  Get.toNamed(Routes.videoQuestions);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.trafficSigns,
                image: AssetsConstants.trafficLightIcon,
                onTap: () {
                  Get.toNamed(Routes.trafficSigns);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.drivingTest,
                image: AssetsConstants.handsIcon,
                onTap: () {
                  Get.toNamed(Routes.drivingTest);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.aboutMotorcycle,
                image: AssetsConstants.motorbikeIcon,
                onTap: () {
                  Get.toNamed(Routes.aboutMotorcycle);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.currentInformation,
                image: AssetsConstants.informationIcon,
                onTap: () {
                  Get.toNamed(Routes.currentInformation);
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
            ],
          ),
        ),
        SizedBox(
          width: Get.width * 0.03,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              _buildCategoryCard(
                title: StringConstants.trialExam,
                image: AssetsConstants.timerIcon,
                onTap: () {
                  Get.toNamed(Routes.trialExam);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.previouslyQuestions,
                image: AssetsConstants.questionMarkIcon,
                onTap: () {
                  Get.toNamed(Routes.previouslyQuestions);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.inCarIndicators,
                image: AssetsConstants.temperatureIcon,
                onTap: () {
                  Get.toNamed(Routes.inCarIndicators);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.parkingRules,
                image: AssetsConstants.carParkingIcon,
                onTap: () {
                  Get.toNamed(Routes.parkingRules);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.thingsToKnow,
                image: AssetsConstants.correctIcon,
                onTap: () {
                  Get.toNamed(Routes.thingsToKnow);
                },
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              _buildCategoryCard(
                title: StringConstants.wrongQuestions,
                image: AssetsConstants.checklistIcon,
                onTap: () {
                  Get.toNamed(Routes.wrongQuestions);
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: Get.width * 0.05);
  }

  Widget _buildCategoryCard(
      {required String title, required String image, required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
        Get.find<AdsService>().showInterstitialAds();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          color: theme.cardColor,
          border: Helper.getBoxBorder(),
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage(
                image,
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
                text: title,
                style: theme.textTheme.bodyMedium!.medium
                    .copyWith(color: AppColors.secondaryBlackColor),
              ),
            ),
          ],
        ).paddingSymmetric(
            horizontal: Get.width * 0.03, vertical: Get.width * 0.05),
      ),
    );
  }
}
