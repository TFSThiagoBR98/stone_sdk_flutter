// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'installment_type.dart';
import 'transaction_type.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

@freezed
class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    int? amount,
    TransactionType? transactionType,
    InstallmentType? installmentType,
    int? installmentCount,
    String? orderId,
    bool? editableAmount,
    required String returnSchema,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}
