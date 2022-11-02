import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppSnackBar {
  // final _SnackBarWidget _widget = _SnackBarWidget();
  success({var onTap, String? message, String? title, Widget? icon, SnackPosition? position}) {
    Get.showSnackbar(GetSnackBar(
      onTap: onTap,
      // backgroundColor: colorApp(AppColors.sea,AppColors.gold),
      borderRadius: 15,
      message: message ?? 'Message',
      isDismissible: true,
      title: title ?? 'Title',
      margin: const EdgeInsets.all(8),
      duration: const Duration(seconds: 2),
      icon: icon,
      snackPosition: position ?? SnackPosition.BOTTOM,
    ));
  }
  error({var onTap, String? message, String? title, Widget? icon, SnackPosition? position}) {
    Get.showSnackbar(GetSnackBar(
      onTap: onTap,
      // backgroundColor: colorApp(AppColors.sea,AppColors.sea),
      borderRadius: 15,
      message: message ?? 'Message',
      isDismissible: true,
      title: title ?? 'Title',
      margin: const EdgeInsets.all(8),
      duration: const Duration(seconds: 2),
      icon: icon,
      snackPosition: position ?? SnackPosition.BOTTOM,
    ));
  }
  woring({var onTap, String? message, String? title, Widget? icon, SnackPosition? position}) {
    Get.showSnackbar(GetSnackBar(
      onTap: onTap,
      // backgroundColor: colorApp(AppColors.sea,AppColors.gold),
      borderRadius: 15,
      message: message ?? 'Message',
      isDismissible: true,
      title: title ?? 'Title',
      margin: const EdgeInsets.all(8),
      duration: const Duration(seconds: 2),
      icon: icon,
      snackPosition: position ?? SnackPosition.BOTTOM,
    ));
  }
}
