import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../finders/finders.dart';
import 'movie_screens.dart';

class home_screen {
  WidgetTester tester;

  home_screen(this.tester);

  Future<WidgetTester> selectMovie(String movieName) async {
    await tester.pump();
    final searchIcon = findByType(TextField);
    await tester.enterText(searchIcon, movieName);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(const Duration(seconds: 5));
    return tester;
  }

  Future<home_screen> selectCatagories(String category) async {
    await tester.pump();
    final categoryElement = findByText(category);
    await tester.tap(categoryElement);
    await tester.pump(const Duration(seconds: 5));
    return this;
  }

  Future<movie_screen> selectMovieCard() async {
    final scrollableFinder = find.text("Popular Now");
    await tester.fling(scrollableFinder, const Offset(0, -500), 1000,
        warnIfMissed: false);
    await tester.pump(Duration(seconds: 5));
    final movieCard = find.ancestor(
        of: find.text("1994-09-23"), matching: findByType(GestureDetector));
    await tester.tap(movieCard);
    await tester.pump(Duration(seconds: 5));
    return new movie_screen(tester);
  }
}
