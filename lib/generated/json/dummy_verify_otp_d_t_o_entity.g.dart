import 'package:clean_flutter/generated/json/base/json_convert_content.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_verify_otp_d_t_o_entity.dart';

DummyVerifyOtpDTOEntity $DummyVerifyOtpDTOEntityFromJson(
    Map<String, dynamic> json) {
  final DummyVerifyOtpDTOEntity dummyVerifyOtpDTOEntity = DummyVerifyOtpDTOEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    dummyVerifyOtpDTOEntity.message = message;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    dummyVerifyOtpDTOEntity.token = token;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    dummyVerifyOtpDTOEntity.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    dummyVerifyOtpDTOEntity.lastName = lastName;
  }
  return dummyVerifyOtpDTOEntity;
}

Map<String, dynamic> $DummyVerifyOtpDTOEntityToJson(
    DummyVerifyOtpDTOEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  data['token'] = entity.token;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  return data;
}

extension DummyVerifyOtpDTOEntityExtension on DummyVerifyOtpDTOEntity {
  DummyVerifyOtpDTOEntity copyWith({
    String? message,
    String? token,
    String? firstName,
    String? lastName,
  }) {
    return DummyVerifyOtpDTOEntity()
      ..message = message ?? this.message
      ..token = token ?? this.token
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName;
  }
}