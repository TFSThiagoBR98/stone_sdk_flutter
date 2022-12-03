// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequest {
  int? get amount => throw _privateConstructorUsedError;
  TransactionType? get transactionType => throw _privateConstructorUsedError;
  InstallmentType? get installmentType => throw _privateConstructorUsedError;
  int? get installmentCount => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  bool? get editableAmount => throw _privateConstructorUsedError;
  String get returnSchema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestCopyWith<PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCopyWith<$Res> {
  factory $PaymentRequestCopyWith(
          PaymentRequest value, $Res Function(PaymentRequest) then) =
      _$PaymentRequestCopyWithImpl<$Res, PaymentRequest>;
  @useResult
  $Res call(
      {int? amount,
      TransactionType? transactionType,
      InstallmentType? installmentType,
      int? installmentCount,
      String? orderId,
      bool? editableAmount,
      String returnSchema});
}

/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res, $Val extends PaymentRequest>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? installmentType = freezed,
    Object? installmentCount = freezed,
    Object? orderId = freezed,
    Object? editableAmount = freezed,
    Object? returnSchema = null,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      installmentType: freezed == installmentType
          ? _value.installmentType
          : installmentType // ignore: cast_nullable_to_non_nullable
              as InstallmentType?,
      installmentCount: freezed == installmentCount
          ? _value.installmentCount
          : installmentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      editableAmount: freezed == editableAmount
          ? _value.editableAmount
          : editableAmount // ignore: cast_nullable_to_non_nullable
              as bool?,
      returnSchema: null == returnSchema
          ? _value.returnSchema
          : returnSchema // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentRequestCopyWith<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  factory _$$_PaymentRequestCopyWith(
          _$_PaymentRequest value, $Res Function(_$_PaymentRequest) then) =
      __$$_PaymentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      TransactionType? transactionType,
      InstallmentType? installmentType,
      int? installmentCount,
      String? orderId,
      bool? editableAmount,
      String returnSchema});
}

/// @nodoc
class __$$_PaymentRequestCopyWithImpl<$Res>
    extends _$PaymentRequestCopyWithImpl<$Res, _$_PaymentRequest>
    implements _$$_PaymentRequestCopyWith<$Res> {
  __$$_PaymentRequestCopyWithImpl(
      _$_PaymentRequest _value, $Res Function(_$_PaymentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? installmentType = freezed,
    Object? installmentCount = freezed,
    Object? orderId = freezed,
    Object? editableAmount = freezed,
    Object? returnSchema = null,
  }) {
    return _then(_$_PaymentRequest(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      installmentType: freezed == installmentType
          ? _value.installmentType
          : installmentType // ignore: cast_nullable_to_non_nullable
              as InstallmentType?,
      installmentCount: freezed == installmentCount
          ? _value.installmentCount
          : installmentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      editableAmount: freezed == editableAmount
          ? _value.editableAmount
          : editableAmount // ignore: cast_nullable_to_non_nullable
              as bool?,
      returnSchema: null == returnSchema
          ? _value.returnSchema
          : returnSchema // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentRequest
    with DiagnosticableTreeMixin
    implements _PaymentRequest {
  const _$_PaymentRequest(
      {this.amount,
      this.transactionType,
      this.installmentType,
      this.installmentCount,
      this.orderId,
      this.editableAmount,
      required this.returnSchema});

  factory _$_PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentRequestFromJson(json);

  @override
  final int? amount;
  @override
  final TransactionType? transactionType;
  @override
  final InstallmentType? installmentType;
  @override
  final int? installmentCount;
  @override
  final String? orderId;
  @override
  final bool? editableAmount;
  @override
  final String returnSchema;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentRequest(amount: $amount, transactionType: $transactionType, installmentType: $installmentType, installmentCount: $installmentCount, orderId: $orderId, editableAmount: $editableAmount, returnSchema: $returnSchema)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentRequest'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('transactionType', transactionType))
      ..add(DiagnosticsProperty('installmentType', installmentType))
      ..add(DiagnosticsProperty('installmentCount', installmentCount))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('editableAmount', editableAmount))
      ..add(DiagnosticsProperty('returnSchema', returnSchema));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentRequest &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.installmentType, installmentType) ||
                other.installmentType == installmentType) &&
            (identical(other.installmentCount, installmentCount) ||
                other.installmentCount == installmentCount) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.editableAmount, editableAmount) ||
                other.editableAmount == editableAmount) &&
            (identical(other.returnSchema, returnSchema) ||
                other.returnSchema == returnSchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, transactionType,
      installmentType, installmentCount, orderId, editableAmount, returnSchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentRequestCopyWith<_$_PaymentRequest> get copyWith =>
      __$$_PaymentRequestCopyWithImpl<_$_PaymentRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentRequestToJson(
      this,
    );
  }
}

abstract class _PaymentRequest implements PaymentRequest {
  const factory _PaymentRequest(
      {final int? amount,
      final TransactionType? transactionType,
      final InstallmentType? installmentType,
      final int? installmentCount,
      final String? orderId,
      final bool? editableAmount,
      required final String returnSchema}) = _$_PaymentRequest;

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$_PaymentRequest.fromJson;

  @override
  int? get amount;
  @override
  TransactionType? get transactionType;
  @override
  InstallmentType? get installmentType;
  @override
  int? get installmentCount;
  @override
  String? get orderId;
  @override
  bool? get editableAmount;
  @override
  String get returnSchema;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentRequestCopyWith<_$_PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
