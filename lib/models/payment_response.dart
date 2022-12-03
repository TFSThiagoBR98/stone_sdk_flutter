// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'installment_type.dart';
import 'transaction_type.dart';

part 'payment_response.freezed.dart';
part 'payment_response.g.dart';

@freezed
class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    int? amount,
    String? cardholderName,
    String? itk,
    String? atk,
    String? authorizationDateTime,
    String? brand,
    String? orderId,
    String? authorizationCode,
    int? installmentCount,
    String? pan,
    TransactionType? type,
    String? entryMode,
    String? accountId,
    String? customerWalletProviderId,
    String? code,
    String? message,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => _$PaymentResponseFromJson(json);
}
