import 'dart:io';

Future<bool> checkConnectionInternet() async {
  bool activeConnection = false;

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      activeConnection = true;
    }
  } on SocketException catch (_) {
    // ToastApp.showErrorToast(text: 'checkYourInternetConnection'.tr());
    activeConnection = false;
  }
  return activeConnection;
}
