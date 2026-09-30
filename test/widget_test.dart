import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:budget/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Splash shows dollar mark then opens sign up', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const BudgetApp());

    expect(find.text('\$'), findsOneWidget);
    expect(find.text('Budget'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 2000));
    await tester.pumpAndSettle();

    expect(find.text('Create your account'), findsOneWidget);
    expect(find.text('Sign up'), findsWidgets);
  });

  testWidgets('Existing account opens login after splash', (tester) async {
    SharedPreferences.setMockInitialValues({'has_signed_up': true});
    await tester.pumpWidget(const BudgetApp());

    await tester.pump(const Duration(milliseconds: 2000));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Log in'), findsWidgets);
  });
}
