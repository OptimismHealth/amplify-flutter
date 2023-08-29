// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

/// A REST XML service that sends XML requests and responses.
library rest_xml_v1.rest_xml_protocol;

export 'package:rest_xml_v1/src/rest_xml_protocol/model/all_query_string_types_input.dart'
    hide AllQueryStringTypesInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/aws_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/body_with_xml_name_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/client_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/complex_error.dart'
    hide ComplexErrorPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/complex_nested_error_data.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/constant_and_variable_query_string_input.dart'
    hide ConstantAndVariableQueryStringInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/constant_query_string_input.dart'
    hide ConstantQueryStringInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/datetime_offsets_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/empty_input_and_empty_output_input.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/empty_input_and_empty_output_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/environment_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/file_config_settings.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/flattened_xml_map_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/flattened_xml_map_with_xml_name_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/flattened_xml_map_with_xml_namespace_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/foo_enum.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/fractional_seconds_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/greeting_struct.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/greeting_with_errors_output.dart'
    hide GreetingWithErrorsOutputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/host_label_header_input.dart'
    hide HostLabelHeaderInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/host_label_input.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_traits_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_traits_with_media_type_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_with_member_xml_name_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_with_structure_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_with_xml_name_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_with_xml_namespace_and_prefix_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_payload_with_xml_namespace_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_prefix_headers_input_output.dart'
    hide HttpPrefixHeadersInputOutputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_request_with_float_labels_input.dart'
    hide HttpRequestWithFloatLabelsInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_request_with_greedy_label_in_path_input.dart'
    hide HttpRequestWithGreedyLabelInPathInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_request_with_labels_and_timestamp_format_input.dart'
    hide HttpRequestWithLabelsAndTimestampFormatInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_request_with_labels_input.dart'
    hide HttpRequestWithLabelsInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/http_response_code_output.dart'
    hide HttpResponseCodeOutputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/ignore_query_params_in_response_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/input_and_output_with_headers_io.dart'
    hide InputAndOutputWithHeadersIoPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/invalid_greeting.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/nested_payload.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/nested_xml_maps_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/no_input_and_output_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/null_and_empty_headers_io.dart'
    hide NullAndEmptyHeadersIoPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/omits_null_serializes_empty_string_input.dart'
    hide OmitsNullSerializesEmptyStringInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/operation_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/payload_with_xml_name.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/payload_with_xml_namespace.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/payload_with_xml_namespace_and_prefix.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/put_with_content_encoding_input.dart'
    hide PutWithContentEncodingInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/query_idempotency_token_auto_fill_input.dart'
    hide QueryIdempotencyTokenAutoFillInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/query_params_as_string_list_map_input.dart'
    hide QueryParamsAsStringListMapInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/query_precedence_input.dart'
    hide QueryPrecedenceInputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/recursive_shapes_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/recursive_shapes_input_output_nested1.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/recursive_shapes_input_output_nested2.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/retry_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/retry_mode.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/s3_addressing_style.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/s3_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/scoped_config.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/simple_scalar_properties_input_output.dart'
    hide SimpleScalarPropertiesInputOutputPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/structure_list_member.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/timestamp_format_headers_io.dart'
    hide TimestampFormatHeadersIoPayload;
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_attributes_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_attributes_on_payload_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_blobs_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_empty_strings_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_enums_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_int_enums_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_lists_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_maps_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_maps_xml_name_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_namespace_nested.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_namespaces_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_nested_union_struct.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_timestamps_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_union_shape.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/model/xml_unions_input_output.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/rest_xml_protocol_client.dart';
export 'package:rest_xml_v1/src/rest_xml_protocol/rest_xml_protocol_server.dart';
