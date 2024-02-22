import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../finders/finders.dart';


class HomeScreen {
  late WidgetTester tester;

  HomeScreen(this.tester);

  final _ownerName = findByType(TextField);

}