import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../finders/finders.dart';


class SearchBarField {
  late WidgetTester tester;

  SearchBarField(this.tester);

  final _searchField = findByType(TextField);

  Future search(String contentName) async {
    await tester.enterText(_searchField, contentName);
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future clear() async{
    final Finder widgetFinder = findByKey(Key('clearSearch'));
    await tester.tap(widgetFinder);
  }

  Future getTextInSearchBar() async{
        return tester.widget<TextField>(_searchField).controller?.text;
  }

}