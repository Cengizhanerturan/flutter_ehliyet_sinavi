import 'package:flutter_ehliyet_sinavi/core/config/theme/theme_extension.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ScaleFactorText(
        text: title,
        style: Get.theme.textTheme.titleMedium!.medium,
      ),
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.only(left: Get.width * 0.05),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Get.theme.cardColor,
            border: Helper.getBoxBorder(),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: Get.width * 0.05,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(kToolbarHeight, null);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
