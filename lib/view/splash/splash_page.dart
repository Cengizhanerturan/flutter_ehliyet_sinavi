import 'package:flutter_ehliyet_sinavi/core/constants/app_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/service/ads/ads_service.dart';
import 'package:flutter_ehliyet_sinavi/core/service/cache/cache_service.dart';
import 'package:flutter_ehliyet_sinavi/core/service/routes/app_routes.dart';
import 'package:flutter_ehliyet_sinavi/core/service/user/user.dart';
import 'package:flutter_ehliyet_sinavi/widgets/scale_factor_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' as nb;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  late final UserService _userService;
  ThemeData get theme => Get.theme;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    startService();
    await _userService.signInAnonymously();
    if (mounted) nb.finish(context);
    Get.offNamed(Routes.home);
  }

  void startService() {
    Get.put(CacheService(), permanent: true);
    Get.put(AdsService(), permanent: true);
    Get.put(DatabaseService());
    _userService = Get.put(UserService(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Container(
            child: ScaleFactorText(
              text: AppConstants.appName,
              style: theme.textTheme.bodyMedium,
            ).center(),
          ),
          Expanded(
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ).paddingBottom(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
