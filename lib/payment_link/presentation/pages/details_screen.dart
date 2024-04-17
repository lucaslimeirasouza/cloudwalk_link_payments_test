import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/settings.dart';
import '../cubit/payment_link_cubit.dart';
import 'package:intl/intl.dart';

import '../widgets/elevated_button_widget.dart';
import '../widgets/text_field_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late PaymentLinkCubit _cubit;
  final TextEditingController _creditNumberController = TextEditingController();
  final _creditNumberKey = GlobalKey();

  @override
  void initState() {
    _cubit = BlocProvider.of<PaymentLinkCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: IconButton(
                      onPressed: () {
                        _cubit.reset();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 10),
                    child: Text(
                      'Payment link data',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Transaction ID'),
                            Text(_cubit.paymentLinkFilter.transactionId!),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Collector ID'),
                            Text(_cubit.paymentLinkFilter.merchantId!),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Value'),
                            Text(NumberFormat.currency(
                                    symbol: Settings.instance.currencySymbol)
                                .format((double.parse(_cubit
                                    .paymentLinkFilter.transactionAmount!)))),
                          ],
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                        'Enter your credit card number registered in the app'),
                  ),
                  TextFieldWidget(
                    key: const Key('txtFieldCardKey'),
                    textfieldKey: _creditNumberKey,
                    controller: _creditNumberController,
                    hintText: 'Credit card number',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
        child: ElevatedButtonWidget(
            key: const Key('payBtnCardKey'),
            onPressed: () {
              _cubit.getResponsePayment(_creditNumberController.text);
            },
            title: 'Conclude'),
      ),
    );
  }
}
