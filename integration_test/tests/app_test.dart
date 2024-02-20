import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// import '../fixtures/init_test.dart';
import 'package:r08fullmovieapp/main.dart' as app;

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  group('E2E test', () { 
    testWidgets('test the first screen', (tester) async {
      await app.main();
      await tester.pumpAndSettle();
      expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.data == 'By Niranjan dahal',
      ),
      findsOneWidget,
    );
    
    },
    skip: true
    );
    
    testWidgets('test Search bar', (tester)async{
      await app.main();
      await tester.pump(const Duration(seconds: 7));
      final searchBar = find.byType(TextField);
      await tester.enterText(searchBar, 'little mermaid');
      final enteredText = tester.widget<TextField>(searchBar).controller?.text;
      
      expect(enteredText, 'little mermaid');

      final Finder widgetFinder = find.byKey(Key('clearSearch'));

      expect(widgetFinder, findsOneWidget);

      await tester.tap(widgetFinder);
      await tester.pump();

      final textAfterClearing = tester.widget<TextField>(searchBar).controller?.text;
      expect(textAfterClearing, '');
    },
    skip: true
    );

    testWidgets('menu ', (tester) async {
      await app.main();
      await tester.pump(const Duration(seconds: 7));
      final Finder drawerFinder = find.byType(Drawer);
      final Finder listViewFinder = find.descendant(
        of: drawerFinder,
        matching: find.byType(ListView),
      );
      expect(listViewFinder, findsOneWidget);
      // final Finder drawerFinder = find.byType(Drawer);
      // expect(drawerFinder, findsOneWidget);
    });

    // testWidgets('movies', (tester) async {
    //   app.main();
    //   await tester.pump(const Duration(seconds: 7));
    //   final Finder tabBarFinder = find.byType(TabBar);
    //   final Finder moviesTabFinder = find.descendant(
    //     of: tabBarFinder,
    //     matching: find.text('Movies'),
    //   );
    //   expect(moviesTabFinder, findsOneWidget);

    //   await tester.tap(moviesTabFinder);
    //   await tester.pump();
    //   await Future.delayed(Duration(seconds: 5));

    // });

    // testWidgets('search', (tester) async{
    //   await app.main();
    //   await tester.pump(const Duration(seconds: 7));
    //   final searchBar = find.byType(TextField);
    //   await tester.enterText(searchBar, 'little mermaid');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();
    //   await Future.delayed(Duration(seconds: 5));
    //   final Finder searchedMovie = find.text('movie');
    //   await tester.tap(searchedMovie);
    //   await tester.pump();

    // });

  });
}