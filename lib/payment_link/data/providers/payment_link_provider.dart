import '../model/payment_link_model.dart';
import 'ipayment_link_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PaymentLinkProvider extends IPaymentLinkProvider {
  @override
  Future<List<PaymentLinkModel>> getList() async {
    try {
      var value =
          await rootBundle.loadString('assets/data/api_local_risk.json');
      List postJson = jsonDecode(value);
      return postJson.map((e) => PaymentLinkModel.fromJson(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
