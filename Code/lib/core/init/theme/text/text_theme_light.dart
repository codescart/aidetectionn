import 'package:flutter/material.dart';
import '../color/color_theme.dart';
import 'text_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  late final TextTheme data;

  @override
  final Color? primaryColor = AppColors().mainBlueColor;

  //Pages titles style
  @override
  TextStyle? titleLarge = TextStyle(
    fontWeight: ITextTheme.bold,
    fontSize: TextSize().dynamicTextSize(34),
    color: AppColors().mainBlueColor,
  );

  //buttons style
  @override
  TextStyle? titleMedium = TextStyle(
    fontWeight: ITextTheme.bold,
    fontSize: TextSize().dynamicTextSize(16),
    color: AppColors().white,
  );

  //Blog text titles
  @override
  TextStyle? titleSmall = TextStyle(
    fontWeight: ITextTheme.bold,
    fontSize: TextSize().dynamicTextSize(24),
    color: AppColors().mainBlueColor,
  );

  //Sub information text style
  @override
  TextStyle? bodySmall = TextStyle(
    fontWeight: ITextTheme.regular,
    fontSize: TextSize().dynamicTextSize(14),
    color: AppColors().grey1,
  );

  //Onboarding, popup main text style
  @override
  TextStyle? bodyMedium = TextStyle(
    fontWeight: ITextTheme.medium,
    fontSize: TextSize().dynamicTextSize(16),
    color: AppColors().mainBlueColor,
  );

  @override
  TextStyle? bodyLarge;

  @override
  TextStyle? errorStyle;

  @override
  TextStyle? hintStyle;

  @override
  TextStyle? labelMedium;

  @override
  TextStyle? labelStyle;

  TextThemeLight() {
    data = TextTheme(
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelMedium: labelMedium,
    ).apply(displayColor: primaryColor);
  }
}
