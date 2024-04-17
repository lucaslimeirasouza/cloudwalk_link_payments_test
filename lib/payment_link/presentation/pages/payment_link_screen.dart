import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/payment_link_entity.dart';
import '../cubit/payment_link_cubit.dart';
import '../widgets/elevated_button_widget.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_form_field_widget.dart';

class PaymentLinkScreen extends StatefulWidget {
  const PaymentLinkScreen({super.key});

  @override
  State<PaymentLinkScreen> createState() => _PaymentLinkScreenState();
}

class _PaymentLinkScreenState extends State<PaymentLinkScreen> {
  late PaymentLinkCubit _cubit;
  final TextEditingController _paymentLinkController = TextEditingController();
  final _paymentLinkKey = GlobalKey();
  final Key keyTxtField = const Key('txtFieldKey');

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
                  const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Text(
                      'Did you receive an\nid-transaction or a payment link?',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 80),
                    child: Text('Paste the id or link into the field below'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Link'),
                  ),
                  TextFormFieldWidget(
                    key: keyTxtField,
                    textfieldKey: _paymentLinkKey,
                    controller: _paymentLinkController,
                    hintText: 'Paste here the id or link you received',
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
            key: const Key('payBtnKey'),
            onPressed: () {
              _cubit.getLinkPayment(_paymentLinkController.text);
            },
            title: 'Pay'),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('risk'),
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(24),
  //       child: ListView.builder(
  //         itemCount: _cubit.getListLink.length,
  //         itemBuilder: (context, index) {
  //           final item = _cubit.getListLink[index];
  //           return buildCard(item, context);
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Card buildCard(PaymentLinkEntity item, BuildContext context) {
  //   return Card(
  //     elevation: 0.3,
  //     child: ListTile(
  //       title: Text(
  //         item.transactionId!,
  //         style: Theme.of(context)
  //             .textTheme
  //             .bodyText1!
  //             .copyWith(fontWeight: FontWeight.w400),
  //       ),
  //     ),
  //   );
  // }
