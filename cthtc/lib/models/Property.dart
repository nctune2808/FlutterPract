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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Property type in your schema. */
@immutable
class Property extends Model {
  static const classType = const _PropertyModelType();
  final String id;
  final PropertyStatus? _status;
  final PropertyType? _type;
  final String? _title;
  final double? _price;
  final bool? _isUrgent;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PropertyModelIdentifier get modelIdentifier {
      return PropertyModelIdentifier(
        id: id
      );
  }
  
  PropertyStatus? get status {
    return _status;
  }
  
  PropertyType? get type {
    return _type;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool? get isUrgent {
    return _isUrgent;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Property._internal({required this.id, status, type, required title, required price, isUrgent, createdAt, updatedAt}): _status = status, _type = type, _title = title, _price = price, _isUrgent = isUrgent, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Property({String? id, PropertyStatus? status, PropertyType? type, required String title, required double price, bool? isUrgent}) {
    return Property._internal(
      id: id == null ? UUID.getUUID() : id,
      status: status,
      type: type,
      title: title,
      price: price,
      isUrgent: isUrgent);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Property &&
      id == other.id &&
      _status == other._status &&
      _type == other._type &&
      _title == other._title &&
      _price == other._price &&
      _isUrgent == other._isUrgent;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Property {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("type=" + (_type != null ? enumToString(_type)! : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("isUrgent=" + (_isUrgent != null ? _isUrgent!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Property copyWith({PropertyStatus? status, PropertyType? type, String? title, double? price, bool? isUrgent}) {
    return Property._internal(
      id: id,
      status: status ?? this.status,
      type: type ?? this.type,
      title: title ?? this.title,
      price: price ?? this.price,
      isUrgent: isUrgent ?? this.isUrgent);
  }
  
  Property.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _status = enumFromString<PropertyStatus>(json['status'], PropertyStatus.values),
      _type = enumFromString<PropertyType>(json['type'], PropertyType.values),
      _title = json['title'],
      _price = (json['price'] as num?)?.toDouble(),
      _isUrgent = json['isUrgent'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'status': enumToString(_status), 'type': enumToString(_type), 'title': _title, 'price': _price, 'isUrgent': _isUrgent, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryModelIdentifier<PropertyModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<PropertyModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField ISURGENT = QueryField(fieldName: "isUrgent");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Property";
    modelSchemaDefinition.pluralName = "Properties";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Property.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Property.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Property.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Property.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Property.ISURGENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PropertyModelType extends ModelType<Property> {
  const _PropertyModelType();
  
  @override
  Property fromJson(Map<String, dynamic> jsonData) {
    return Property.fromJson(jsonData);
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Property] in your schema.
 */
@immutable
class PropertyModelIdentifier implements ModelIdentifier<Property> {
  final String id;

  /** Create an instance of PropertyModelIdentifier using [id] the primary key. */
  const PropertyModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'PropertyModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PropertyModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}