import 'package:flutter_test/flutter_test.dart';
import 'package:ii_test/app/locator.dart';
import 'package:ii_test/core/utils/logger.dart';

void main() {
  test('Setup is working', () async{
    TestWidgetsFlutterBinding.ensureInitialized();

    locator.allowReassignment = true;
    setupLogger(test: true);

    await setupLocator(test: true);

    await locator.allReady();
  });
}