import 'package:flutter_ehliyet_sinavi/core/base/base_stateless_widget.dart';
import 'package:flutter_ehliyet_sinavi/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HtmlLoadingWidget extends BaseStatelessWidget {
  const HtmlLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .5,
      child: LoadingWidget(),
    );
  }
}
