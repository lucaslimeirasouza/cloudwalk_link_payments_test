class PaymentLinkEntity {
  final String? transactionId;
  final String? merchantId;
  final String? userId;
  final String? cardNumber;
  final String? transactionDate;
  final String? transactionAmount;
  final String? deviceId;
  final String? hasCbk;

  const PaymentLinkEntity({
    required this.transactionId,
    required this.merchantId,
    required this.userId,
    required this.cardNumber,
    required this.transactionDate,
    required this.transactionAmount,
    required this.deviceId,
    required this.hasCbk,
  });
}
