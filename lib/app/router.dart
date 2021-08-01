import 'package:flutter/cupertino.dart';
import 'package:ii_test/ui/views/user_details/user_details_view.dart';
import 'package:ii_test/ui/views/user_list/user_list_view.dart';
import '../core/utils/exports.dart';

abstract class Routes {
  static const usersList = '/usersList';
  static const userDetails = '/userDetails';
}

class Routers {

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.usersList:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => UserListView(),
          settings: settings
        );
      case Routes.userDetails:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => UserDetailsView(),
          settings: settings
        );
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
  builder: (ctx) => Scaffold(
    body: Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(
              routeName == "/"
                  ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                  : 'Route name $routeName is not found!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          OutlineButton.icon(
            label: Text('Back'),
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    ),
  ),
);