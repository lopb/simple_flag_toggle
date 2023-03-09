import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:simple_flag_toggle/simple_flag_toggle.dart';

Finder animatedToggleSwitch = find.byType(AnimatedToggleSwitch<int>);
Finder lessThanTwoText = find.textContaining("Error: flag list size < 2");

void main() {
  group('Widget tests', () {
    testWidgets('From index 1 to 0 and 0 to 1 using tapping the flags',
        (WidgetTester tester) async {
      FlagBar toggle = FlagBar(
        flagList: const ["us", "br"],
        initialIndex: 1,
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: toggle));

      expect(animatedToggleSwitch, findsOneWidget);

      Offset centerOffset = tester.getCenter(animatedToggleSwitch);

      await tester.tapAt(Offset(centerOffset.dx - 20, centerOffset.dy));
      await tester.pumpAndSettle();
      AnimatedToggleSwitch widget =
          animatedToggleSwitch.evaluate().single.widget as AnimatedToggleSwitch;
      expect(widget.current, 0);

      await tester.tapAt(Offset(centerOffset.dx + 20, centerOffset.dy));
      await tester.pumpAndSettle();
      widget =
          animatedToggleSwitch.evaluate().single.widget as AnimatedToggleSwitch;
      expect(widget.current, 1);
    });

    testWidgets('From index 0 to 1 using swipe gesture (drag)',
        (WidgetTester tester) async {
      FlagBar toggle = FlagBar(
        flagList: const ["us", "br"],
        initialIndex: 1,
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: toggle));

      Offset topLeftOffset = tester.getTopLeft(animatedToggleSwitch);
      Offset topRightOffset = tester.getTopRight(animatedToggleSwitch);

      await tester.dragFrom(
          Offset(topLeftOffset.dx + 10, topLeftOffset.dy + 10),
          Offset(topRightOffset.dx - 10, topRightOffset.dy + 10));
      await tester.pumpAndSettle();
      AnimatedToggleSwitch widget =
          animatedToggleSwitch.evaluate().single.widget as AnimatedToggleSwitch;
      expect(widget.current, 1);
    });

    testWidgets('Less than 2 flags (only one)', (WidgetTester tester) async {
      FlagBar toggle = FlagBar(
        flagList: const ["us"],
        initialIndex: 0,
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: toggle));
      expect(lessThanTwoText, findsOneWidget);
    });

    testWidgets('Less than 2 flags (none)', (WidgetTester tester) async {
      FlagBar toggle = FlagBar(
        flagList: const [],
        initialIndex: 0,
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: toggle));
      expect(lessThanTwoText, findsOneWidget);
    });

    testWidgets('Initial index less than 0', (WidgetTester tester) async {
      FlagBar toggle = FlagBar(
        flagList: const ["us", "br"],
        initialIndex: -1,
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: toggle));
      AnimatedToggleSwitch widget =
          animatedToggleSwitch.evaluate().single.widget as AnimatedToggleSwitch;
      expect(widget.current, 0);
    });

    testWidgets('Initial index more than flag list size',
        (WidgetTester tester) async {
      FlagBar toggle = FlagBar(
        flagList: const ["us", "br"],
        initialIndex: 999,
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: toggle));
      AnimatedToggleSwitch widget =
          animatedToggleSwitch.evaluate().single.widget as AnimatedToggleSwitch;
      expect(widget.current, 0);
    });
  });
}
