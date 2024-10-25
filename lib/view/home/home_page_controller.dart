import 'package:flutter_ehliyet_sinavi/core/model/user.dart';
import 'package:flutter_ehliyet_sinavi/core/service/user/user.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final _userService = Get.find<UserService>();

  Rxn<UserModel> get user => _userService.user;
}
