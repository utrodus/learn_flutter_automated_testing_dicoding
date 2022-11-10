import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn_flutter_automated_testing_dicoding/main.dart' as app;

void main() {
  group('Testing Full App', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Done module test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final keys = [
        'Modul 1 - Pengenalan Dart',
        'Modul 2 - Memulai Pemrograman dengan Dart',
        'Modul 3 - Dart Fundamental',
      ];

      for (var key in keys) {
        await tester.tap(find.byKey(Key(key)));
      }

      await tester.tap(find.byKey(const Key('done_page_button')));

      final listFinder = find.byType(ListView);
      final firstItem = find.text('Modul 1 - Pengenalan Dart');

      await tester.scrollUntilVisible(listFinder, 5000);
      expect(firstItem, findsOneWidget);

      /// We can combine the process of testing and recording application performance
      /// with the binding.traceAction() function.
      /// record the performance of the app
      /// To save the performance capture, create a test_driver folder in the main directory.
      /// The code below will capture performance in a Map format variable.
      await binding.traceAction(() async {
        await tester.scrollUntilVisible(listFinder, 500);
        expect(firstItem, findsOneWidget);
      });
    });
  });
}
