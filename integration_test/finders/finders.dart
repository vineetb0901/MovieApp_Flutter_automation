import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findByText(String text) {
  return find.text(text);
}

Finder findByType(Type type) {
  return find.byType(type);
}

Finder findByToolTip(String toolTip) {
  return find.byTooltip(toolTip);
}

Finder findByKey(Key key) {
  return find.byKey(key);
}

Finder findByIcon(IconData icon) {
  return find.byIcon(icon);
}
