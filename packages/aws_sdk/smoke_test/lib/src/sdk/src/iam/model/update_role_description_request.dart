// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.iam.model.update_role_description_request; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

part 'update_role_description_request.g.dart';

abstract class UpdateRoleDescriptionRequest
    with
        _i1.HttpInput<UpdateRoleDescriptionRequest>,
        _i2.AWSEquatable<UpdateRoleDescriptionRequest>
    implements
        Built<UpdateRoleDescriptionRequest,
            UpdateRoleDescriptionRequestBuilder> {
  factory UpdateRoleDescriptionRequest({
    required String roleName,
    required String description,
  }) {
    return _$UpdateRoleDescriptionRequest._(
      roleName: roleName,
      description: description,
    );
  }

  factory UpdateRoleDescriptionRequest.build(
          [void Function(UpdateRoleDescriptionRequestBuilder) updates]) =
      _$UpdateRoleDescriptionRequest;

  const UpdateRoleDescriptionRequest._();

  factory UpdateRoleDescriptionRequest.fromRequest(
    UpdateRoleDescriptionRequest payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      payload;

  static const List<_i1.SmithySerializer> serializers = [
    UpdateRoleDescriptionRequestAwsQuerySerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UpdateRoleDescriptionRequestBuilder b) {}

  /// The name of the role that you want to modify.
  String get roleName;

  /// The new description that you want to apply to the specified role.
  String get description;
  @override
  UpdateRoleDescriptionRequest getPayload() => this;
  @override
  List<Object?> get props => [
        roleName,
        description,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('UpdateRoleDescriptionRequest');
    helper.add(
      'roleName',
      roleName,
    );
    helper.add(
      'description',
      description,
    );
    return helper.toString();
  }
}

class UpdateRoleDescriptionRequestAwsQuerySerializer
    extends _i1.StructuredSmithySerializer<UpdateRoleDescriptionRequest> {
  const UpdateRoleDescriptionRequestAwsQuerySerializer()
      : super('UpdateRoleDescriptionRequest');

  @override
  Iterable<Type> get types => const [
        UpdateRoleDescriptionRequest,
        _$UpdateRoleDescriptionRequest,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ];
  @override
  UpdateRoleDescriptionRequest deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateRoleDescriptionRequestBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current;
      iterator.moveNext();
      final value = iterator.current;
      switch (key as String) {
        case 'RoleName':
          result.roleName = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'Description':
          result.description = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = (object as UpdateRoleDescriptionRequest);
    final result = <Object?>[
      const _i1.XmlElementName(
        'UpdateRoleDescriptionRequestResponse',
        _i1.XmlNamespace('https://iam.amazonaws.com/doc/2010-05-08/'),
      )
    ];
    result
      ..add(const _i1.XmlElementName('RoleName'))
      ..add(serializers.serialize(
        payload.roleName,
        specifiedType: const FullType(String),
      ));
    result
      ..add(const _i1.XmlElementName('Description'))
      ..add(serializers.serialize(
        payload.description,
        specifiedType: const FullType(String),
      ));
    return result;
  }
}