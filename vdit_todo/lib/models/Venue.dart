/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Venue type in your schema. */
@immutable
class Venue {
  final String id;
  final String? _name;
  final String? _address;
  final int? _maxOccupancy;

  String? get name {
    return _name;
  }
  
  String? get address {
    return _address;
  }
  
  int? get maxOccupancy {
    return _maxOccupancy;
  }
  
  const Venue._internal({required this.id, name, address, maxOccupancy}): _name = name, _address = address, _maxOccupancy = maxOccupancy;
  
  factory Venue({String? id, String? name, String? address, int? maxOccupancy}) {
    return Venue._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      address: address,
      maxOccupancy: maxOccupancy);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Venue &&
      id == other.id &&
      _name == other._name &&
      _address == other._address &&
      _maxOccupancy == other._maxOccupancy;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Venue {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("maxOccupancy=" + (_maxOccupancy != null ? _maxOccupancy!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Venue copyWith({String? id, String? name, String? address, int? maxOccupancy}) {
    return Venue._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      maxOccupancy: maxOccupancy ?? this.maxOccupancy);
  }
  
  Venue.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _address = json['address'],
      _maxOccupancy = (json['maxOccupancy'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'address': _address, 'maxOccupancy': _maxOccupancy
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Venue";
    modelSchemaDefinition.pluralName = "Venues";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'address',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'maxOccupancy',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}