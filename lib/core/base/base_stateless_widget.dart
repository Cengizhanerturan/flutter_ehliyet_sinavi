import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  ThemeData get theme => Get.theme;
  const BaseStatelessWidget({super.key});
}
