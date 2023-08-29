// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_auth_cognito_dart.cognito_identity_provider.model.invalid_lambda_response_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'invalid_lambda_response_exception.g.dart';

/// This exception is thrown when Amazon Cognito encounters an invalid Lambda response.
abstract class InvalidLambdaResponseException
    with
        _i1.AWSEquatable<InvalidLambdaResponseException>
    implements
        Built<InvalidLambdaResponseException,
            InvalidLambdaResponseExceptionBuilder>,
        _i2.SmithyHttpException {
  /// This exception is thrown when Amazon Cognito encounters an invalid Lambda response.
  factory InvalidLambdaResponseException({String? message}) {
    return _$InvalidLambdaResponseException._(message: message);
  }

  /// This exception is thrown when Amazon Cognito encounters an invalid Lambda response.
  factory InvalidLambdaResponseException.build(
          [void Function(InvalidLambdaResponseExceptionBuilder) updates]) =
      _$InvalidLambdaResponseException;

  const InvalidLambdaResponseException._();

  /// Constructs a [InvalidLambdaResponseException] from a [payload] and [response].
  factory InvalidLambdaResponseException.fromResponse(
    InvalidLambdaResponseException payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer<InvalidLambdaResponseException>>
      serializers = [InvalidLambdaResponseExceptionAwsJson11Serializer()];

  /// The message returned when Amazon Cognito throws an invalid Lambda response exception.
  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.cognitoidentityprovider',
        shape: 'InvalidLambdaResponseException',
      );
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 400;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('InvalidLambdaResponseException')
      ..add(
        'message',
        message,
      );
    return helper.toString();
  }
}

class InvalidLambdaResponseExceptionAwsJson11Serializer
    extends _i2.StructuredSmithySerializer<InvalidLambdaResponseException> {
  const InvalidLambdaResponseExceptionAwsJson11Serializer()
      : super('InvalidLambdaResponseException');

  @override
  Iterable<Type> get types => const [
        InvalidLambdaResponseException,
        _$InvalidLambdaResponseException,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_1',
        )
      ];
  @override
  InvalidLambdaResponseException deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvalidLambdaResponseExceptionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'message':
          result.message = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    InvalidLambdaResponseException object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final InvalidLambdaResponseException(:message) = object;
    if (message != null) {
      result$
        ..add('message')
        ..add(serializers.serialize(
          message,
          specifiedType: const FullType(String),
        ));
    }
    return result$;
  }
}
