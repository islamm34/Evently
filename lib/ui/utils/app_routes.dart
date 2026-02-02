

import 'package:evently2/ui/screens/navigation/tabs/register/register_screen.dart';
import 'package:evently2/ui/screens/navigation/tabs/spalsh_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screens/navigation/tabs/add_event/add_event.dart';
import '../screens/navigation/tabs/login/login_screen.dart';
import '../screens/navigation/tabs/navigation_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());

  static MaterialPageRoute get navigation =>
      MaterialPageRoute(builder: (_) => NavigationScreen());

  static MaterialPageRoute get addEvent =>
      MaterialPageRoute(builder: (_) => AddEventScreen());
  static MaterialPageRoute get splashScreen =>
      MaterialPageRoute(builder: (_) => SplashScreen());
}
