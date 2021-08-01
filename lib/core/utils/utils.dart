import 'package:intl/intl.dart';
import 'package:ii_test/core/utils/exports.dart';

class Utils{

  static final currencyFormatter2 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 2);
  static final currencyFormatter0 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);
  static final normalFormatter = new NumberFormat("#,###");

  static final SystemUiOverlayStyle light = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static final SystemUiOverlayStyle dark = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );
}