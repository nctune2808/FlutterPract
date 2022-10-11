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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Festival type in your schema. */
@immutable
class Festival {
  final String id;
  final String? _name;
  final String? _startsAt;
  final String? _endsAt;
  final Venue? _venue;
  final int? _minAgeRestriction;
  final List<String>? _performers;

  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get startsAt {
    return _startsAt;
  }
  
  String? get endsAt {
    return _endsAt;
  }
  
  Venue? get venue {
    return _venue;
  }
  
  int? get minAgeRestriction {
    return _minAgeRestriction;
  }
  
  List<String>? get performers {
    return _performers;
  }
  
  const Festival._internal({required this.id, required name, startsAt, endsAt, venue, minAgeRestriction, performers}): _name = name, _startsAt = startsAt, _endsAt = endsAt, _venue = venue, _minAgeRestriction = minAgeRestriction, _performers = performers;
  
  factory Festival({String? id, required String name, String? startsAt, String? endsAt, Venue? venue, int? minAgeRestriction, List<String>? performers}) {
    return Festival._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      startsAt: startsAt,
      endsAt: endsAt,
      venue: venue,
      minAgeRestriction: minAgeRestriction,
      performers: performers != null ? List<String>.unmodifiable(performers) : performers);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Festival &&
      id == other.id &&
      _name == other._name &&
      _startsAt == other._startsAt &&
      _endsAt == other._endsAt &&
      _venue == other._venue &&
      _minAgeRestriction == other._minAgeRestriction &&
      DeepCollectionEquality().equals(_performers, other._performers);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Festival {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("startsAt=" + "$_startsAt" + ", ");
    buffer.write("endsAt=" + "$_endsAt" + ", ");
    buffer.write("venue=" + (_venue != null ? _venue!.toString() : "null") + ", ");
    buffer.write("minAgeRestriction=" + (_minAgeRestriction != null ? _minAgeRestriction!.toString() : "null") + ", ");
    buffer.write("performers=" + (_performers != null ? _performers!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Festival copyWith({String? id, String? name, String? startsAt, String? endsAt, Venue? venue, int? minAgeRestriction, List<String>? performers}) {
    return Festival._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      venue: venue ?? this.venue,
      minAgeRestriction: minAgeRestriction ?? this.minAgeRestriction,
      performers: performers ?? this.performers);
  }
  
  Festival.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _startsAt = json['startsAt'],
      _endsAt = json['endsAt'],
      _venue = json['venue']?['serializedData'] != null
        ? Venue.fromJson(new Map<String, dynamic>.from(json['venue']['serializedData']))
        : null,
      _minAgeRestriction = (json['minAgeRestriction'] as num?)?.toInt(),
      _performers = json['performers']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'startsAt': _startsAt, 'endsAt': _endsAt, 'venue': _venue?.toJson(), 'minAgeRestriction': _minAgeRestriction, 'performers': _performers
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Festival";
    modelSchemaDefinition.pluralName = "Festivals";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'startsAt',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'endsAt',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'venue',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Venue')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'minAgeRestriction',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'performers',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
  });
}