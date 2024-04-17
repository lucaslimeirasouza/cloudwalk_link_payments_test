// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:risk_mobile_engineer_test/payment_link/presentation/pages/details_screen.dart';

// void main() {
//   group(
//     'credit card field test',
//     () {
//       testWidgets(
//         'Enter the credit card number and finalize the payment',
//         (tester) async {
//           await tester.pumpWidget(
//             const DetailsScreen(),
//           );

//           final txtField = find.byKey(const Key('txtFieldCardKey'));

//           await tester.tap(txtField);
//           await tester.pumpAndSettle();

//           await tester.enterText(txtField, '434505******9116');
//           await tester.pumpAndSettle();

//           final payButton = find.byKey(const Key('payBtnCardKey'));
//           await tester.tap(payButton);
//           await tester.pumpAndSettle();

//           expect(txtField, findsOneWidget);
//         },
//       );
//     },
//   );
// }
