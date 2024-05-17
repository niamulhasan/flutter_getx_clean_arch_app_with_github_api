import 'package:flutter/cupertino.dart';

abstract class AppColors {
  static final light = _LightColors();
  static final dark = _DarkColors();

  static AppColorsContract themed(BuildContext? context) {
    if(context == null) return light;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return darkModeOn ? dark : light;
  }
}

abstract class AppColorsContract {
  Color get mainBgColor;
  Color get primaryColor;
  Color get primaryColorGradientEnd;
  Color get primaryColorDark;
  Color get primaryBg;
  Color get primaryBgGradientEnd;
  Color get primaryBgGradientStart;
  Color get secondaryColor;
  Color get secondaryColorLight;
  Color get secondaryColorDeep;
  Color get inputBg;
  Color get primaryText;
  Color get secondaryText;
  Color get cardColor;
  Color get bodyText;
  Color get bodyTextGray;
  Color get success;
  Color get error;
  Color get stock;
  Color get shadow;
  Color get hintText;
  Color get lightText;
  Color get textFieldBg;
  Color get lightBg;
  Color get premium;
  Color get formBorder;
  Color get secondaryButtonBg;
}

class _LightColors implements AppColorsContract {
  @override
  final Color mainBgColor = const Color(0xFFFbFbFb);
  @override
  final Color primaryColor = const Color(0xFF005298);
  @override
  final Color primaryColorGradientEnd = const Color(0xFF005298);
  @override
  final Color primaryColorDark = const Color(0xFF5C2F87);
  @override
  final Color primaryBg = const Color(0xFFDDE2ED);
  @override
  final Color primaryBgGradientEnd = const Color(0xFFFFFFFF);
  @override
  final Color primaryBgGradientStart = const Color(0xFF005298);
  @override
  final Color secondaryColor = const Color(0xFFFF981F);
  @override
  final Color secondaryColorLight = const Color(0xFFFCCB93);
  @override
  final Color secondaryColorDeep = const Color(0xFFf5814e);
  @override
  final Color inputBg = const Color(0xFFF5F5F5);
  @override
  final Color primaryText = const Color(0xFF2B292C);
  @override
  final Color secondaryText = const Color(0xFF757575);
  @override
  final Color cardColor = const Color(0xFFFFFFFF);
  @override
  final Color bodyText = const Color(0xFF4F4F4F);
  @override
  final Color bodyTextGray = const Color(0xFF676269);
  @override
  final Color success = const Color(0xff22b765);
  @override
  final Color error = const Color(0xffe85356);
  @override
  final Color stock = const Color(0xffE6E6E6);
  @override
  final Color shadow = const Color(0xFFC1C1C1).withOpacity(0.33);
  @override
  final Color hintText = const Color(0xFFD4DDEC);
  @override
  final Color lightText = const Color(0xFF737373);
  @override
  final Color textFieldBg = const Color(0xFFF0F1F4);
  @override
  final Color lightBg = const Color(0xFFF2F2F2);
  @override
  final Color premium = const Color(0xFFc69842);
  @override
  final Color formBorder = const Color(0xFFE4E4E4);
  @override
  final Color secondaryButtonBg = const Color(0xFFE4E4E4);
}


class _DarkColors implements AppColorsContract {
  @override
  final Color mainBgColor = const Color(0xFFFbFbFb);
  @override
  final Color primaryColor = const Color(0xFF008BFC);
  @override
  final Color primaryColorGradientEnd = const Color(0xFF005298);
  @override
  final Color primaryColorDark = const Color(0xFF5C2F87);
  @override
  final Color primaryBg = const Color(0xFF1E1D2A);
  @override
  final Color primaryBgGradientEnd = const Color(0xFFFFFFFF);
  @override
  final Color primaryBgGradientStart = const Color(0xFF005298);
  @override
  final Color secondaryColor = const Color(0xFFFF981F);
  @override
  final Color secondaryColorLight = const Color(0xFFFCCB93);
  @override
  final Color secondaryColorDeep = const Color(0xFFf5814e);
  @override
  final Color inputBg = const Color(0xFFF5F5F5);
  @override
  final Color primaryText = const Color(0xFF2B292C);
  @override
  final Color secondaryText = const Color(0xFF757575);
  @override
  final Color cardColor = const Color(0xFF252737);
  @override
  final Color bodyText = const Color(0xFF4F4F4F);
  @override
  final Color bodyTextGray = const Color(0xFF676269);
  @override
  final Color success = const Color(0xff22b765);
  @override
  final Color error = const Color(0xffe85356);
  @override
  final Color stock = const Color(0xffE6E6E6);
  @override
  final Color shadow = const Color(0xFFC1C1C1).withOpacity(0.33);
  @override
  final Color hintText = const Color(0xFFD4DDEC);
  @override
  final Color lightText = const Color(0xFF737373);
  @override
  final Color textFieldBg = const Color(0xFFF0F1F4);
  @override
  final Color lightBg = const Color(0xFFF2F2F2);
  @override
  final Color premium = const Color(0xFFc69842);
  @override
  final Color formBorder = const Color(0xFF363848);
  @override
  final Color secondaryButtonBg = const Color(0xFF2E303E);
}
