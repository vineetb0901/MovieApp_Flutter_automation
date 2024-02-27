import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';


class SearchMovie {
  late WidgetTester tester;
  SearchMovie(this.tester);

  final sendMovieName = findBytype(TextField);

  Future searchMovieName() async {
    
    await tester.enterText(sendMovieName, 'Legend');
    await tester.testTextInput.receiveAction(TextInputAction.done); 
     
  }
}
