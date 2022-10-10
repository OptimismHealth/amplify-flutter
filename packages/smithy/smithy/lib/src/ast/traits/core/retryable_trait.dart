// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:json_annotation/json_annotation.dart';
import 'package:smithy/ast.dart';

part 'retryable_trait.g.dart';

/// Marks an error structure as retryable.
@ShapeIdConverter()
@JsonSerializable()
class RetryableTrait implements Trait<RetryableTrait> {
  const RetryableTrait({
    this.throttling = false,
  });

  factory RetryableTrait.fromJson(Object? json) =>
      _$RetryableTraitFromJson((json as Map).cast<String, Object?>());

  static const id = ShapeId.core('retryable');

  final bool throttling;

  @override
  bool get isSynthetic => false;

  @override
  List<Object?> get props => [throttling];

  @override
  ShapeId get shapeId => id;

  @override
  Map<String, Object?> toJson() => _$RetryableTraitToJson(this);

  @override
  RetryableTrait get value => this;
}