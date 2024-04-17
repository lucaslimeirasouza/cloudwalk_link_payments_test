import '../../domain/entities/payment_link_entity.dart';

class PaymentLinkModel extends PaymentLinkEntity {
  PaymentLinkModel({
    transactionId,
    merchantId,
    userId,
    cardNumber,
    transactionDate,
    transactionAmount,
    deviceId,
    hasCbk,
  }) : super(
          transactionId: transactionId,
          merchantId: merchantId,
          userId: userId,
          cardNumber: cardNumber,
          transactionDate: transactionDate,
          transactionAmount: transactionAmount,
          deviceId: deviceId,
          hasCbk: hasCbk,
        );

  factory PaymentLinkModel.fromJson(dynamic json) {
    return PaymentLinkModel(
      transactionId:
          json['transaction_id'] == null ? null : json['transaction_id'],
      merchantId: json['merchant_id'] == null ? null : json['merchant_id'],
      userId: json['user_id'] == null ? null : json['user_id'],
      cardNumber: json['card_number'] == null ? null : json['card_number'],
      transactionDate:
          json['transaction_date'] == null ? null : json['transaction_date'],
      transactionAmount: json['transaction_amount'] == null
          ? null
          : json['transaction_amount'],
      deviceId: json['device_id'] == null ? null : json['device_id'],
      hasCbk: json['has_cbk'] == null ? null : json['has_cbk'],
    );
  }
}
