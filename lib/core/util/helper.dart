import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static Future openDialog({required Widget dialog}) async {
    return await Get.dialog(
      barrierColor: Colors.black87.withOpacity(0.7),
      dialog,
    );
  }

  static String toCamelcase({required String text}) {
    String newText = '';
    text = text.toLowerCase();
    List textList = text.split(' ');
    for (var val in textList) {
      val = val[0].toString().toUpperCase() + val.toString().substring(1);
      newText += '$val ';
    }
    newText = newText.trim();
    return newText;
  }

  static BoxBorder getBoxBorder() {
    return Border.all(
      width: Get.width * 0.002,
      color: Get.theme.dividerColor,
      style: BorderStyle.solid,
    );
  }
}
