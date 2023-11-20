import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumLight14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  // Title text style
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 16.fSize,
      );
  static get titleMediumGray900SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumGray900SemiBold17 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
