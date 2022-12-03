// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentRequest _$$_PaymentRequestFromJson(Map<String, dynamic> json) =>
    _$_PaymentRequest(
      amount: json['amount'] as int?,
      transactionType: $enumDecodeNullable(
          _$TransactionTypeEnumMap, json['transactionType']),
      installmentType: $enumDecodeNullable(
          _$InstallmentTypeEnumMap, json['installmentType']),
      installmentCount: json['installmentCount'] as int?,
      orderId: json['orderId'] as String?,
      editableAmount: json['editableAmount'] as bool?,
      returnSchema: json['returnSchema'] as String,
    );

Map<String, dynamic> _$$_PaymentRequestToJson(_$_PaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'installmentType': _$InstallmentTypeEnumMap[instance.installmentType],
      'installmentCount': instance.installmentCount,
      'orderId': instance.orderId,
      'editableAmount': instance.editableAmount,
      'returnSchema': instance.returnSchema,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.debit: 'debit',
  TransactionType.credit: 'credit',
  TransactionType.voucher: 'voucher',
  TransactionType.instantPayment: 'instantPayment',
  TransactionType.pix: 'pix',
};

const _$InstallmentTypeEnumMap = {
  InstallmentType.merchant: 'merchant',
  InstallmentType.issuer: 'issuer',
  InstallmentType.none: 'none',
};
