import 'package:cloudwalk_link_payment_test/payment_link/presentation/pages/payment_link_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/payment_link_cubit.dart';
import '../cubit/payment_link_states.dart';
import 'approved_screen.dart';
import 'denied_screen.dart';
import 'details_screen.dart';
import 'loading_screen.dart';

class OrchestratorScreen extends StatefulWidget {
  const OrchestratorScreen({super.key});

  @override
  State<OrchestratorScreen> createState() => _OrchestratorScreenState();
}

class _OrchestratorScreenState extends State<OrchestratorScreen> {
  late final PaymentLinkCubit cubit;

  GlobalKey paymentLinkKey = GlobalKey();
  GlobalKey detailsKey = GlobalKey();
  GlobalKey approvedKey = GlobalKey();
  GlobalKey deniedKey = GlobalKey();

  @override
  void initState() {
    cubit = PaymentLinkCubit(
        /*PaymentLinkUsecase(PaymentLinkRepository(PaymentLinkProvider()))*/);
    cubit.inicialPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentLinkCubit>.value(
      value: cubit,
      child: BlocConsumer<PaymentLinkCubit, PaymentLinkState>(
        listener: (context, state) async {
          if (state is LoadingPaymentLinkState) {
            const CircularProgressIndicator();
          }
          if (state is LinkPaymentErrorPaymentLinkState) {
            cubit.linkPaymentReset();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Invalid payment link'),
              backgroundColor: Colors.red,
            ));
          }
          if (state is CreditCardErrorPaymentLinkState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Invalid credit card'),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          return buildPage();
        },
      ),
    );
  }

  Widget buildPage() {
    if (cubit.state is PaymentLinkScreenState) {
      return PaymentLinkScreen(key: paymentLinkKey);
    }
    if (cubit.state is DetailsScreenState) {
      return DetailsScreen(key: detailsKey);
    }
    if (cubit.state is ApprovedScreenState) {
      return ApprovedScreen(key: approvedKey);
    }
    if (cubit.state is DeniedScreenState) {
      return DeniedScreen(key: deniedKey);
    }

    return const LoadingScreen();
  }
}
