// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) {
  return _PaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentResponse {
  int? get amount => throw _privateConstructorUsedError;
  String? get cardholderName => throw _privateConstructorUsedError;
  String? get itk => throw _privateConstructorUsedError;
  String? get atk => throw _privateConstructorUsedError;
  String? get authorizationDateTime => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get authorizationCode => throw _privateConstructorUsedError;
  int? get installmentCount => throw _privateConstructorUsedError;
  String? get pan => throw _privateConstructorUsedError;
  TransactionType? get type => throw _privateConstructorUsedError;
  String? get entryMode => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  String? get customerWalletProviderId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentResponseCopyWith<PaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseCopyWith<$Res> {
  factory $PaymentResponseCopyWith(
          PaymentResponse value, $Res Function(PaymentResponse) then) =
      _$PaymentResponseCopyWithImpl<$Res, PaymentResponse>;
  @useResult
  $Res call(
      {int? amount,
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
      String? message});
}

/// @nodoc
class _$PaymentResponseCopyWithImpl<$Res, $Val extends PaymentResponse>
    implements $PaymentResponseCopyWith<$Res> {
  _$PaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? cardholderName = freezed,
    Object? itk = freezed,
    Object? atk = freezed,
    Object? authorizationDateTime = freezed,
    Object? brand = freezed,
    Object? orderId = freezed,
    Object? authorizationCode = freezed,
    Object? installmentCount = freezed,
    Object? pan = freezed,
    Object? type = freezed,
    Object? entryMode = freezed,
    Object? accountId = freezed,
    Object? customerWalletProviderId = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      cardholderName: freezed == cardholderName
          ? _value.cardholderName
          : cardholderName // ignore: cast_nullable_to_non_nullable
              as String?,
      itk: freezed == itk
          ? _value.itk
          : itk // ignore: cast_nullable_to_non_nullable
              as String?,
      atk: freezed == atk
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationDateTime: freezed == authorizationDateTime
          ? _value.authorizationDateTime
          : authorizationDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      installmentCount: freezed == installmentCount
          ? _value.installmentCount
          : installmentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      entryMode: freezed == entryMode
          ? _value.entryMode
          : entryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerWalletProviderId: freezed == customerWalletProviderId
          ? _value.customerWalletProviderId
          : customerWalletProviderId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentResponseCopyWith<$Res>
    implements $PaymentResponseCopyWith<$Res> {
  factory _$$_PaymentResponseCopyWith(
          _$_PaymentResponse value, $Res Function(_$_PaymentResponse) then) =
      __$$_PaymentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
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
      String? message});
}

/// @nodoc
class __$$_PaymentResponseCopyWithImpl<$Res>
    extends _$PaymentResponseCopyWithImpl<$Res, _$_PaymentResponse>
    implements _$$_PaymentResponseCopyWith<$Res> {
  __$$_PaymentResponseCopyWithImpl(
      _$_PaymentResponse _value, $Res Function(_$_PaymentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? cardholderName = freezed,
    Object? itk = freezed,
    Object? atk = freezed,
    Object? authorizationDateTime = freezed,
    Object? brand = freezed,
    Object? orderId = freezed,
    Object? authorizationCode = freezed,
    Object? installmentCount = freezed,
    Object? pan = freezed,
    Object? type = freezed,
    Object? entryMode = freezed,
    Object? accountId = freezed,
    Object? customerWalletProviderId = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_PaymentResponse(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      cardholderName: freezed == cardholderName
          ? _value.cardholderName
          : cardholderName // ignore: cast_nullable_to_non_nullable
              as String?,
      itk: freezed == itk
          ? _value.itk
          : itk // ignore: cast_nullable_to_non_nullable
              as String?,
      atk: freezed == atk
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationDateTime: freezed == authorizationDateTime
          ? _value.authorizationDateTime
          : authorizationDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      installmentCount: freezed == installmentCount
          ? _value.installmentCount
          : installmentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      entryMode: freezed == entryMode
          ? _value.entryMode
          : entryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerWalletProviderId: freezed == customerWalletProviderId
          ? _value.customerWalletProviderId
          : customerWalletProviderId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentResponse
    with DiagnosticableTreeMixin
    implements _PaymentResponse {
  const _$_PaymentResponse(
      {this.amount,
      this.cardholderName,
      this.itk,
      this.atk,
      this.authorizationDateTime,
      this.brand,
      this.orderId,
      this.authorizationCode,
      this.installmentCount,
      this.pan,
      this.type,
      this.entryMode,
      this.accountId,
      this.customerWalletProviderId,
      this.code,
      this.message});

  factory _$_PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentResponseFromJson(json);

  @override
  final int? amount;
  @override
  final String? cardholderName;
  @override
  final String? itk;
  @override
  final String? atk;
  @override
  final String? authorizationDateTime;
  @override
  final String? brand;
  @override
  final String? orderId;
  @override
  final String? authorizationCode;
  @override
  final int? installmentCount;
  @override
  final String? pan;
  @override
  final TransactionType? type;
  @override
  final String? entryMode;
  @override
  final String? accountId;
  @override
  final String? customerWalletProviderId;
  @override
  final String? code;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentResponse(amount: $amount, cardholderName: $cardholderName, itk: $itk, atk: $atk, authorizationDateTime: $authorizationDateTime, brand: $brand, orderId: $orderId, authorizationCode: $authorizationCode, installmentCount: $installmentCount, pan: $pan, type: $type, entryMode: $entryMode, accountId: $accountId, customerWalletProviderId: $customerWalletProviderId, code: $code, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentResponse'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('cardholderName', cardholderName))
      ..add(DiagnosticsProperty('itk', itk))
      ..add(DiagnosticsProperty('atk', atk))
      ..add(DiagnosticsProperty('authorizationDateTime', authorizationDateTime))
      ..add(DiagnosticsProperty('brand', brand))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('authorizationCode', authorizationCode))
      ..add(DiagnosticsProperty('installmentCount', installmentCount))
      ..add(DiagnosticsProperty('pan', pan))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('entryMode', entryMode))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty(
          'customerWalletProviderId', customerWalletProviderId))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentResponse &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cardholderName, cardholderName) ||
                other.cardholderName == cardholderName) &&
            (identical(other.itk, itk) || other.itk == itk) &&
            (identical(other.atk, atk) || other.atk == atk) &&
            (identical(other.authorizationDateTime, authorizationDateTime) ||
                other.authorizationDateTime == authorizationDateTime) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode) &&
            (identical(other.installmentCount, installmentCount) ||
                other.installmentCount == installmentCount) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.entryMode, entryMode) ||
                other.entryMode == entryMode) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(
                    other.customerWalletProviderId, customerWalletProviderId) ||
                other.customerWalletProviderId == customerWalletProviderId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      cardholderName,
      itk,
      atk,
      authorizationDateTime,
      brand,
      orderId,
      authorizationCode,
      installmentCount,
      pan,
      type,
      entryMode,
      accountId,
      customerWalletProviderId,
      code,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentResponseCopyWith<_$_PaymentResponse> get copyWith =>
      __$$_PaymentResponseCopyWithImpl<_$_PaymentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentResponseToJson(
      this,
    );
  }
}

abstract class _PaymentResponse implements PaymentResponse {
  const factory _PaymentResponse(
      {final int? amount,
      final String? cardholderName,
      final String? itk,
      final String? atk,
      final String? authorizationDateTime,
      final String? brand,
      final String? orderId,
      final String? authorizationCode,
      final int? installmentCount,
      final String? pan,
      final TransactionType? type,
      final String? entryMode,
      final String? accountId,
      final String? customerWalletProviderId,
      final String? code,
      final String? message}) = _$_PaymentResponse;

  factory _PaymentResponse.fromJson(Map<String, dynamic> json) =
      _$_PaymentResponse.fromJson;

  @override
  int? get amount;
  @override
  String? get cardholderName;
  @override
  String? get itk;
  @override
  String? get atk;
  @override
  String? get authorizationDateTime;
  @override
  String? get brand;
  @override
  String? get orderId;
  @override
  String? get authorizationCode;
  @override
  int? get installmentCount;
  @override
  String? get pan;
  @override
  TransactionType? get type;
  @override
  String? get entryMode;
  @override
  String? get accountId;
  @override
  String? get customerWalletProviderId;
  @override
  String? get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentResponseCopyWith<_$_PaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
