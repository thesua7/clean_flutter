import 'package:clean_flutter/generated/json/base/json_convert_content.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/user_model_d_t_o_entity.dart';

UserModelDTOEntity $UserModelDTOEntityFromJson(Map<String, dynamic> json) {
  final UserModelDTOEntity userModelDTOEntity = UserModelDTOEntity();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    userModelDTOEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userModelDTOEntity.message = message;
  }
  final UserModelDTOData? data = jsonConvert.convert<UserModelDTOData>(
      json['data']);
  if (data != null) {
    userModelDTOEntity.data = data;
  }
  return userModelDTOEntity;
}

Map<String, dynamic> $UserModelDTOEntityToJson(UserModelDTOEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension UserModelDTOEntityExtension on UserModelDTOEntity {
  UserModelDTOEntity copyWith({
    String? status,
    String? message,
    UserModelDTOData? data,
  }) {
    return UserModelDTOEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserModelDTOData $UserModelDTODataFromJson(Map<String, dynamic> json) {
  final UserModelDTOData userModelDTOData = UserModelDTOData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userModelDTOData.id = id;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    userModelDTOData.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    userModelDTOData.lastName = lastName;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userModelDTOData.email = email;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    userModelDTOData.phone = phone;
  }
  final String? dp = jsonConvert.convert<String>(json['dp']);
  if (dp != null) {
    userModelDTOData.dp = dp;
  }
  return userModelDTOData;
}

Map<String, dynamic> $UserModelDTODataToJson(UserModelDTOData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['email'] = entity.email;
  data['phone'] = entity.phone;
  data['dp'] = entity.dp;
  return data;
}

extension UserModelDTODataExtension on UserModelDTOData {
  UserModelDTOData copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? dp,
  }) {
    return UserModelDTOData()
      ..id = id ?? this.id
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..email = email ?? this.email
      ..phone = phone ?? this.phone
      ..dp = dp ?? this.dp;
  }
}