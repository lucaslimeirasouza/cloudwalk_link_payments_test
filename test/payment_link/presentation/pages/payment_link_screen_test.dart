// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:risk_mobile_engineer_test/payment_link/presentation/pages/payment_link_screen.dart';

// void main() {
//   group(
//     'payment link field test',
//     () {
//       testWidgets(
//         'Enter the payment link and continue',
//         (tester) async {
//           await tester.pumpWidget(
//             const PaymentLinkScreen(),
//           );

//           final txtField = find.byKey(const Key('txtFieldKey'));

//           await tester.tap(txtField);
//           await tester.pumpAndSettle();

//           await tester.enterText(txtField, '21320398');
//           await tester.pumpAndSettle();

//           final payButton = find.byKey(const Key('payBtnKey'));
//           await tester.tap(payButton);
//           await tester.pumpAndSettle();

//           expect(txtField, findsOneWidget);
//         },
//       );
//     },
//   );
// }
