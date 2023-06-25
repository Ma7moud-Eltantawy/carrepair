import 'package:flutter/material.dart' show Colors, Color, TextStyle;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/utils/duration_formatter.dart';

snackBarError(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.errorBG,
    colorText: ColorsManager.errorText,
  );
}

snackBarSuccess(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.white,
    colorText: ColorsManager.primary,
  );
}

getNameFromEmail(String email) {
  return email.split('@').first;
}

bool isPositive(String value) {
  final num = int.parse(value);
  return num > 0;
}

TextStyle getStyleBasedOnValue(String value) {
  Color textColor = isPositive(value) ? Colors.black : Colors.red;
  return TextStyle(color: textColor, fontSize: 16);
}

String getTodayDate() {
  return DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());
}

String getTimeSince(String dateString) {
  final date = DateFormat('d/M/yyyy').parse(dateString);
  final duration = DateTime.now().difference(date);
  return DurationFormatter.arabic(duration);
}

String formatNumberWithSeparator(String numberString) {
  final number = int.tryParse(numberString);
  if (number == null) {
    return numberString;
  }

  final formatter = NumberFormat('#,##0', 'en_US');
  return formatter.format(number);
}

int getWarningValue(String value) {
  num data = int.parse(value) / 4;
  return data.toInt();
}
