import 'package:flutter/material.dart';
import 'package:ii_test/ui/views/user_list/user_list_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/utils/exports.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:ii_test/styles/theme/theme.dart' as _theme;

void main() async{
WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    Utils.light
  );
  await DotEnv.load(fileName: '.env');
  setupLogger();
  await setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Builder(
        builder: (context) => MaterialApp(
          title: 'ii_test',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routers().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          theme: _theme.lightTheme,
          home: UserListView(),
        ),
      ),
    );
  }
}