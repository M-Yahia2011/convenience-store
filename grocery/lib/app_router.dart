import 'package:flutter/material.dart';

import '/presentation/screens/register_screen.dart';
import '/presentation/screens/sign_in_screen.dart';
class AppRouter {
  static Route<dynamic> route(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
         
          case SignInScreen.routeName:
            return const SignInScreen();
          case RegisterScreen.routeName:
            return const RegisterScreen();

          default:
           return const RegisterScreen();
            // if (AuthService.authInstance.currentUser != null) {
              // return const AllNotesScreen();
            // } else {
              // return const RegisterScreen();
            // }
        }
      },
    );
  }
}
