import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../finders/finders.dart';
import 'home_screen.dart';

class movie_screen {
  WidgetTester tester;
  movie_screen(this.tester);

  Future<movie_screen> addToFavorites() async {
    final iconButtonFinder = findByIcon(Icons.favorite);
    await tester.tap(iconButtonFinder);
    return this;
  }

  Future<home_screen> backToHomeScreen() async {
    final homeIcon = findByIcon(FontAwesomeIcons.houseUser);
    await tester.tap(homeIcon);
    await Future.delayed(Duration(seconds: 5));
    return home_screen(tester);
  }
}
