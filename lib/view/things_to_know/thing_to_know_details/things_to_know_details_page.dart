import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/model/things_to_know.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/widgets/custom_appbar.dart';
import 'package:flutter_ehliyet_sinavi/widgets/error_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/html_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class ThingsToKnowDetailsPage extends StatelessWidget {
  final ThingsToKnowModel model;
  const ThingsToKnowDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.thingsToKnow),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: HtmlWidget(
                    model.content,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const HtmlLoadingWidget(),
                    onErrorBuilder: (context, element, error) =>
                        const CustomErrorWidget(
                      message: StringConstants.errorText,
                    ),
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
}
