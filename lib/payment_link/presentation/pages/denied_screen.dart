import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../cubit/payment_link_cubit.dart';
import '../widgets/elevated_button_widget.dart';

class DeniedScreen extends StatefulWidget {
  const DeniedScreen({super.key});

  @override
  State<DeniedScreen> createState() => _DeniedScreenState();
}

class _DeniedScreenState extends State<DeniedScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                      child: Lottie.asset(
                          'assets/lotties/cancel-animation.json',
                          height: 200,
                          repeat: true)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 10),
                  child: Text(
                    'Your payment was declined.',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Text('Please contact CloudWalk'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
        child: ElevatedButtonWidget(
            key: const Key('deniBtnKey'),
            onPressed: () {
              _cubit.reset();
            },
            title: 'Try with a different credit card'),
      ),
    );
  }
}
