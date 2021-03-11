/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const TodoType();
  final String id;
  final String title;
  final bool isComplete;
  final String userId;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Todo._internal(
      {@required this.id,
      @required this.title,
      @required this.isComplete,
      @required this.userId});

  factory Todo(
      {String id,
      @required String title,
      @required bool isComplete,
      @required String userId}) {
    return Todo._internal(
        id: id == null ? UUID.getUUID() : id,
        title: title,
        isComplete: isComplete,
        userId: userId);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
        id == other.id &&
        title == other.title &&
        isComplete == other.isComplete &&
        userId == other.userId;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$title" + ", ");
    buffer.write("isComplete=" +
        (isComplete != null ? isComplete.toString() : "null") +
        ", ");
    buffer.write("userId=" + "$userId");
    buffer.write("}");

    return buffer.toString();
  }

  Todo copyWith({String id, String title, bool isComplete, String userId}) {
    return Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        isComplete: isComplete ?? this.isComplete,
        userId: userId ?? this.userId);
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        isComplete = json['isComplete'],
        userId = json['userId'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'isComplete': isComplete, 'userId': userId};

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField ISCOMPLETE = QueryField(fieldName: "isComplete");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.TITLE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.ISCOMPLETE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.USERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class TodoType extends ModelType<Todo> {
  const TodoType();

  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}
