// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentResponse _$$_PaymentResponseFromJson(Map<String, dynamic> json) =>
    _$_PaymentResponse(
      amount: json['amount'] as int?,
      cardholderName: json['cardholderName'] as String?,
      itk: json['itk'] as String?,
      atk: json['atk'] as String?,
      authorizationDateTime: json['authorizationDateTime'] as String?,
      brand: json['brand'] as String?,
      orderId: json['orderId'] as String?,
      authorizationCode: json['authorizationCode'] as String?,
      installmentCount: json['installmentCount'] as int?,
      pan: json['pan'] as String?,
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']),
      entryMode: json['entryMode'] as String?,
      accountId: json['accountId'] as String?,
      customerWalletProviderId: json['customerWalletProviderId'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_PaymentResponseToJson(_$_PaymentResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'cardholderName': instance.cardholderName,
      'itk': instance.itk,
      'atk': instance.atk,
      'authorizationDateTime': instance.authorizationDateTime,
      'brand': instance.brand,
      'orderId': instance.orderId,
      'authorizationCode': instance.authorizationCode,
      'installmentCount': instance.installmentCount,
      'pan': instance.pan,
      'type': _$TransactionTypeEnumMap[instance.type],
      'entryMode': instance.entryMode,
      'accountId': instance.accountId,
      'customerWalletProviderId': instance.customerWalletProviderId,
      'code': instance.code,
      'message': instance.message,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.debit: 'debit',
  TransactionType.credit: 'credit',
  TransactionType.voucher: 'voucher',
  TransactionType.instantPayment: 'instantPayment',
  TransactionType.pix: 'pix',
};
