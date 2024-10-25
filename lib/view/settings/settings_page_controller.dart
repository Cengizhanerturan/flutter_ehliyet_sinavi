import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:flutter_ehliyet_sinavi/widgets/dialogs/custom_dialog.dart';
import 'package:get/get.dart';

class SettingsPageController extends GetxController {
  Future<void> deleteAllData() async {
    try {
      // Not shared
    } catch (e) {
      await Helper.openDialog(
        dialog: const CustomDialog(
          message: 'Bir hata oluştu, daha sonra tekrar deneyin.',
        ),
      );
    }
  }
}
