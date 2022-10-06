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


/** This is an auto generated class representing the Address type in your schema. */
@immutable
class Address {
  final String? _line1;
  final String? _line2;
  final String? _postcode;
  final String? _town;

  String? get line1 {
    return _line1;
  }
  
  String? get line2 {
    return _line2;
  }
  
  String get postcode {
    try {
      return _postcode!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get town {
    return _town;
  }
  
  const Address._internal({line1, line2, required postcode, town}): _line1 = line1, _line2 = line2, _postcode = postcode, _town = town;
  
  factory Address({String? line1, String? line2, required String postcode, String? town}) {
    return Address._internal(
      line1: line1,
      line2: line2,
      postcode: postcode,
      town: town);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
      _line1 == other._line1 &&
      _line2 == other._line2 &&
      _postcode == other._postcode &&
      _town == other._town;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Address {");
    buffer.write("line1=" + "$_line1" + ", ");
    buffer.write("line2=" + "$_line2" + ", ");
    buffer.write("postcode=" + "$_postcode" + ", ");
    buffer.write("town=" + "$_town");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Address copyWith({String? line1, String? line2, String? postcode, String? town}) {
    return Address._internal(
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      postcode: postcode ?? this.postcode,
      town: town ?? this.town);
  }
  
  Address.fromJson(Map<String, dynamic> json)  
    : _line1 = json['line1'],
      _line2 = json['line2'],
      _postcode = json['postcode'],
      _town = json['town'];
  
  Map<String, dynamic> toJson() => {
    'line1': _line1, 'line2': _line2, 'postcode': _postcode, 'town': _town
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Address";
    modelSchemaDefinition.pluralName = "Addresses";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'line1',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'line2',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'postcode',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'town',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}