import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseGetView<T> extends GetView<T> {
  const BaseGetView({super.key});

  ThemeData get theme => Get.theme;
}
