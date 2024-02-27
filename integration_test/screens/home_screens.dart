import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../finders/finders.dart';

class HomeScreen {
  late WidgetTester tester;
  HomeScreen(this.tester);

  final upcoming =
      find.descendant(of: findBytype(TabBar), matching: findByText('Upcoming'));

  final resultOfUpcoming = find.descendant(
      of: findBytype(Padding), matching: findByText('Upcomming'));

  final upcomingMovieScroll = find.descendant(
      of: findBytype(Padding), matching: findByText('2023-12-21'));

  final upcomingMovieTap = find.descendant(
      of: findBytype(Padding), matching: findByText('2024-02-27'));

  final shareButton = find.descendant(
      of: findBytype(GestureDetector), matching: findByText('Share'));

  final copyMovie = find.descendant(
      of: findBytype(GestureDetector), matching: findByText('Copy Link'));

  final backToHome = findByIcon(FontAwesomeIcons.circleArrowLeft);

  Finder upcomingTabFinder() {
    return find.descendant(
      of: findBytype(TabBar),
      matching: findByText('Upcoming'),
    );
  }

  Future getUpcoming() async {
    await tester.tap(upcoming, warnIfMissed: true);
    await callScroll();
    await shareAndCopyMovie();
  }

  Future callScroll() async {
    await tester.pump();
    // await tester.tap(upcomingMovieScroll, warnIfMissed: true);
    await tester.pump(Duration(seconds: 7));
    await tester.fling(upcomingMovieScroll, const Offset(-800, 0), 800);
    await tester.pump(Duration(seconds: 7));
    await tester.tap(upcomingMovieTap, warnIfMissed: true);
    await tester.pump(Duration(seconds: 7));
  }

  Future shareAndCopyMovie() async {
    await tester.tap(shareButton, warnIfMissed: true);
    await tester.pump(Duration(seconds: 10));
    await tester.tap(copyMovie, warnIfMissed: true);
    await tester.pump(Duration(seconds: 5));
    await tester.tap(backToHome, warnIfMissed: true);
    await tester.pump(Duration(seconds: 5));
  }
}
