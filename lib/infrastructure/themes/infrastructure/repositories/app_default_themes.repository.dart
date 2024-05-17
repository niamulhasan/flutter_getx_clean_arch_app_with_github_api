import 'package:flutter/material.dart';
import '../../domain/entities/app.colors.dart';
import '../../domain/entities/app_theme.dart';
import '../../domain/repositories/themes_repository.dart';

class AppDefaultThemesRepository implements ThemesRepository {
  @override
  AppTheme get lightTheme => AppTheme(
        name: "Light Mode",
        themeData: ThemeData.light().copyWith(
          splashColor: AppColors.light.primaryColor.withOpacity(0.5),
          primaryColorLight: AppColors.light.primaryColor,
          scaffoldBackgroundColor: AppColors.light.primaryBg,
          primaryColor: AppColors.light.primaryColor,
          cardColor: AppColors.light.cardColor,
          cardTheme: CardTheme(
            color: AppColors.light.cardColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.light.cardColor.withOpacity(0.9),
            surfaceTintColor: AppColors.light.cardColor.withOpacity(0.9),
            elevation: 0,
            shape: Border(
                bottom: BorderSide(
              color: Colors.black.withOpacity(0.1),
            )),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.light.primaryColor,
            //rounded border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          //checkbox
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(AppColors.light.bodyTextGray),
            checkColor: MaterialStateProperty.all(Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            fillColor: AppColors.light.inputBg,
            filled: true,
            hintStyle: TextStyle(
              color: AppColors.light.secondaryText,
              fontSize: 16.0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.light.stock,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.light.stock,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.light.primaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorStyle: TextStyle(
              color: AppColors.light.error,
              fontSize: 14.0,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.light.error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            activeIndicatorBorder: BorderSide(
              color: AppColors.light.primaryColor,
              width: 2.0,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.light.stock,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.light.error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          sliderTheme: SliderThemeData(
            activeTrackColor: AppColors.light.primaryColor.withOpacity(0.1),
            inactiveTrackColor: AppColors.light.primaryColor.withOpacity(0.2),
            trackHeight: 2.0,
            thumbColor: AppColors.light.primaryColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayColor: AppColors.light.primaryColor.withOpacity(0.5),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 8.0),
            valueIndicatorColor: AppColors.light.primaryColor,
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.hovered)) {
                  return AppColors.light.primaryColor.withOpacity(0.5);
                }
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.light.primaryColor.withOpacity(0.2);
                }
                return AppColors.light.primaryColor;
              }),
              textStyle: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return size 40, otherwise 20
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(color: Colors.white);
                }
                return const TextStyle(color: Colors.white);
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  AppTheme get darkTheme => AppTheme(
      name: "Dark Mode",
      themeData: ThemeData.dark().copyWith(
        splashColor: AppColors.dark.primaryColor.withOpacity(0.5),
        primaryColorLight: AppColors.dark.primaryColor,
        scaffoldBackgroundColor: AppColors.dark.primaryBg,
        primaryColor: AppColors.dark.primaryColor,
        cardColor: AppColors.dark.cardColor,
        cardTheme: CardTheme(
          color: AppColors.dark.cardColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.dark.cardColor.withOpacity(0.9),
          surfaceTintColor: AppColors.dark.cardColor.withOpacity(0.9),
          elevation: 0,
          shape: Border(
              bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
          )),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.dark.primaryColor,
          //rounded border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        //checkbox
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(AppColors.dark.bodyTextGray),
          checkColor: MaterialStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          fillColor: AppColors.dark.inputBg,
          filled: true,
          hintStyle: TextStyle(
            color: AppColors.dark.secondaryText,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.dark.stock,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.dark.stock,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.dark.primaryColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorStyle: TextStyle(
            color: AppColors.dark.error,
            fontSize: 14.0,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.dark.error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          activeIndicatorBorder: BorderSide(
            color: AppColors.dark.primaryColor,
            width: 2.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.dark.stock,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.dark.error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        sliderTheme: SliderThemeData(
            activeTrackColor: AppColors.light.primaryColor.withOpacity(0.1),
            inactiveTrackColor: AppColors.light.primaryColor.withOpacity(0.2),
            trackHeight: 2.0,
            thumbColor: AppColors.light.primaryColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayColor: AppColors.light.primaryColor.withOpacity(0.5),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 8.0),
            valueIndicatorColor: AppColors.light.primaryColor,
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.hovered)) {
                return AppColors.dark.primaryColor.withOpacity(0.5);
              }
              if (states.contains(MaterialState.disabled)) {
                return AppColors.dark.primaryColor.withOpacity(0.2);
              }
              return AppColors.dark.primaryColor;
            }),
            textStyle: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return size 40, otherwise 20
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(color: Colors.white);
              }
              return const TextStyle(color: Colors.white);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ));
}
