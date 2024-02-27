import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findByText(String text) {
  return find.text(text);
}

Finder findBytype(Type type) {
  return find.byType(type);
}

Finder findByIcon(IconData iconData) {
  return find.byIcon(iconData);
}
