import 'package:clean_flutter/generated/json/base/json_convert_content.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_get_otp_dto_entity.dart';

DummyGetOtpDtoEntity $DummyGetOtpDtoEntityFromJson(Map<String, dynamic> json) {
  final DummyGetOtpDtoEntity dummyGetOtpDtoEntity = DummyGetOtpDtoEntity();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    dummyGetOtpDtoEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    dummyGetOtpDtoEntity.message = message;
  }
  final DummyGetOtpDtoData? data = jsonConvert.convert<DummyGetOtpDtoData>(
      json['data']);
  if (data != null) {
    dummyGetOtpDtoEntity.data = data;
  }
  return dummyGetOtpDtoEntity;
}

Map<String, dynamic> $DummyGetOtpDtoEntityToJson(DummyGetOtpDtoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension DummyGetOtpDtoEntityExtension on DummyGetOtpDtoEntity {
  DummyGetOtpDtoEntity copyWith({
    String? status,
    String? message,
    DummyGetOtpDtoData? data,
  }) {
    return DummyGetOtpDtoEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

DummyGetOtpDtoData $DummyGetOtpDtoDataFromJson(Map<String, dynamic> json) {
  final DummyGetOtpDtoData dummyGetOtpDtoData = DummyGetOtpDtoData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dummyGetOtpDtoData.id = id;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    dummyGetOtpDtoData.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    dummyGetOtpDtoData.lastName = lastName;
  }
  return dummyGetOtpDtoData;
}

Map<String, dynamic> $DummyGetOtpDtoDataToJson(DummyGetOtpDtoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  return data;
}

extension DummyGetOtpDtoDataExtension on DummyGetOtpDtoData {
  DummyGetOtpDtoData copyWith({
    int? id,
    String? firstName,
    String? lastName,
  }) {
    return DummyGetOtpDtoData()
      ..id = id ?? this.id
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName;
  }
}