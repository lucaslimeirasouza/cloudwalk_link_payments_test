import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../cubit/payment_link_cubit.dart';
import 'package:intl/intl.dart';
import '../../../components/settings.dart';
import '../widgets/elevated_button_widget.dart';

class ApprovedScreen extends StatefulWidget {
  const ApprovedScreen({super.key});

  @override
  State<ApprovedScreen> createState() => _ApprovedScreenState();
}

class _ApprovedScreenState extends State<ApprovedScreen> {
  late PaymentLinkCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<PaymentLinkCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                      child: Lottie.asset('assets/lotties/check-success.json',
                          height: 200, repeat: true)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: Text(
                    'Your payment was successful!',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text('Sales receipt'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Date'),
                          Row(
                            children: [
                              Text(
                                  '${DateFormat.yMMMd().format(DateTime.parse(_cubit.paymentLinkFilter.transactionDate!))} '),
                              Text(DateFormat.Hm().format(DateTime.parse(
                                  _cubit.paymentLinkFilter.transactionDate!))),
                            ],
                          ),
                        ],
                      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Credit Card Number'),
                          Text(_cubit.paymentLinkFilter.cardNumber!),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total value'),
                          Text(NumberFormat.currency(
                                  symbol: Settings.instance.currencySymbol)
                              .format((double.parse(_cubit
                                  .paymentLinkFilter.transactionAmount!)))),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
        child: ElevatedButtonWidget(
            key: const Key('approveBtnKey'),
            onPressed: () {
              _cubit.reset();
            },
            title: 'Start over'),
      ),
    );
  }
}
