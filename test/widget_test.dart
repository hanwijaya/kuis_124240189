import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/main.dart';
import 'package:quiz/data_mobil.dart';
import 'package:quiz/home_page.dart';

void main() {
  test('Data dan format harga rupiah', () {
    expect(cars.length, 10);
    expect(cars.first.formattedPrice, 'Rp 595.000.000');
    expect(cars[6].formattedPrice, 'Rp 1.350.000.000');
  });
  testWidgets('Login gagal menampilkan snackbar merah', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byType(TextField).first, 'siska');
    await tester.enterText(find.byType(TextField).last, 'salah');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(find.text('Login gagal!'), findsOneWidget);
    expect(
      tester.widget<SnackBar>(find.byType(SnackBar)).backgroundColor,
      Colors.red,
    );
    expect(find.byType(HomePage), findsNothing);
  });
  testWidgets('Login, detail, warna profil, navigasi dan logout', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byType(TextField).first, 'Han');
    await tester.enterText(find.byType(TextField).last, '124240189');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(find.text('Halo, Han!'), findsOneWidget);
    expect(
      tester.widget<SnackBar>(find.byType(SnackBar)).backgroundColor,
      Colors.green,
    );
    await tester.tap(find.text('Honda Civic RS'));
    await tester.pumpAndSettle();
    expect(find.byType(CarDetailPage), findsOneWidget);
    expect(find.text('Rp 595.000'), findsOneWidget);
    expect(find.text(cars.first.description), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();
    expect(find.text('Han'), findsOneWidget);
    expect(
      tester.widget<CircleAvatar>(find.byType(CircleAvatar)).backgroundColor,
      Colors.green,
    );
    for (final entry in {
      'Biru': Colors.blue,
      'Merah': Colors.red,
      'Ungu': Colors.purple,
    }.entries) {
      await tester.tap(find.text(entry.key));
      await tester.pumpAndSettle();
      expect(
        tester.widget<CircleAvatar>(find.byType(CircleAvatar)).backgroundColor,
        entry.value,
      );
      final button = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Logout'),
      );
      expect(button.style!.backgroundColor!.resolve({}), entry.value);
    }
    await tester.tap(find.text('Beranda'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Profil').last);
    await tester.pumpAndSettle();
    expect(
      tester.widget<CircleAvatar>(find.byType(CircleAvatar)).backgroundColor,
      Colors.purple,
    );
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
    expect(
      tester.state<NavigatorState>(find.byType(Navigator)).canPop(),
      isFalse,
    );
  });
}
