import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter_automated_testing_dicoding/provider/done_module_provider.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_automated_testing_dicoding/ui/done_module_list.dart';
import 'package:learn_flutter_automated_testing_dicoding/ui/module_page.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<DoneModuleProvider>(
      create: (context) => DoneModuleProvider(),
      child: const MaterialApp(
        home: ModulePage(),
      ),
    );

Widget createDoneModuleListScreen() =>
    ChangeNotifierProvider<DoneModuleProvider>(
      create: (context) => DoneModuleProvider(),
      child: const MaterialApp(
        home: DoneModuleList(),
      ),
    );

void main() {
  group('Module List Page Widget Test', () {
    testWidgets('Testing if ListView show up', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing if ListView not show up in done module list',
        (WidgetTester tester) async {
      await tester.pumpWidget(createDoneModuleListScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test Done Button', (tester) async {
      /// Merender widget
      await tester.pumpWidget(createHomeScreen());

      /// Mencari ElevatedButton pertama kemudian melakukan gestur tap
      await tester.tap(find.byType(ElevatedButton).first);

      /// Rebuild tampilan karena perubahan state
      await tester.pumpAndSettle();

      /// Verifikasi apakah ditemukan 2 ikon done (Termasuk ikon done yang berada di AppBar)
      expect(find.byIcon(Icons.done), findsNWidgets(2));
    });
    testWidgets('Test Remove Button', (tester) async {
      /// Merender widget Module Page
      await tester.pumpWidget(createHomeScreen());

      /// Mencari ElevatedButton pertama kemudian melakukan gestur tap
      /// Untuk memberikan tanda bahwa modul pertama sudah selesai
      await tester.tap(find.byType(ElevatedButton).first);

      /// Rebuild tampilan karena perubahan state
      await tester.pumpAndSettle();

      /// Merender widget done module list
      await tester.pumpWidget(createDoneModuleListScreen());

      /// Mencari ElevatedButton pertama kemudian melakukan gestur tap
      /// Untuk menghapus modul pertama dari daftar modul yang sudah selesai
      await tester.tap(find.byType(ElevatedButton).first);

      /// Rebuild tampilan karena perubahan state
      await tester.pumpAndSettle();

      /// Verifikasi apakah ditemukan button dengan text 'Remove'
      expect(find.widgetWithText(ElevatedButton, 'Remove'), findsNothing);
    });
  });
}
