class AppAsset {
  AppAsset._internal();
  static final AppAsset _instance = AppAsset._internal();

  factory AppAsset(){
    return _instance;
  }

  static const String applogo = 'assets/images/onboarding.png';

}