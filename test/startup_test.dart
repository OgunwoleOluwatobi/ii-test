import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:ii_test/app/locator.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/models/user_list_response.dart';
import 'package:ii_test/core/services/user_service.dart';
import 'package:ii_test/core/utils/hive_boxes.dart';
import 'package:ii_test/core/utils/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'startup_test.mocks.dart';

// class MockUserService extends Mock implements UserService {}

// class MockHive extends Mock implements HiveInterface {}
// class MockRegistry extends Mock implements TypeRegistry {}

// class MockBox<T> extends Mock implements Box<T> {}

@GenerateMocks([
  HiveInterface,
  Box,
  UserService
])
void main() {
  test('Setup is working', () async{
    TestWidgetsFlutterBinding.ensureInitialized();

    locator.allowReassignment = true;
    setupLogger(test: true);

    final mockUserService = MockUserService();

    final userMockBox = MockBox<User>();

    final mockhive = MockHiveInterface();

    when(mockhive.isBoxOpen(HiveBox.user)).thenAnswer((_) => false);

    when(mockhive.openBox<User>(HiveBox.user))
        .thenAnswer((_) async => Future.value(userMockBox));

    locator.registerSingleton<HiveInterface>(mockhive);
    locator.registerSingleton<UserService>(mockUserService);

    await setupLocator(test: true);
    await locator.allReady();
  });
}