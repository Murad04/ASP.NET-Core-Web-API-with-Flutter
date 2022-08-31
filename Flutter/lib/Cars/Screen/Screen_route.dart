import 'package:carapp/Cars/Screen/CarsMainScreen.dart';
import 'package:flutter/material.dart';
import 'package:carapp/Cars/Screen/CarsCreateUpdateScreen.dart';
import 'package:carapp/Cars/Cars.dart';
import 'package:carapp/Cars/Screen/screens.dart';

import '../Model/Cars.dart';

class CarsAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => CarsMainScreen());
    }

    if (settings.name == CarsCreateUpdateService.routeName) {
      CarsArguments args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CarsCreateUpdateService(
                args: args,
              ));
    }

    if (settings.name == CarsDetail.routeName) {
      Cars cars = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CarsDetail(
                cars: cars,
              ));
    }

    return MaterialPageRoute(builder: (context) => CarsMainScreen());
  }
}

class CarsArguments {
  final Cars cars;
  final bool edit;
  CarsArguments({this.cars, this.edit});
}
