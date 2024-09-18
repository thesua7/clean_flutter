import 'package:clean_flutter/generated/json/base/json_field.dart';
import 'package:clean_flutter/generated/json/dummy_get_otp_dto_entity.g.dart';
import 'dart:convert';
export 'package:clean_flutter/generated/json/dummy_get_otp_dto_entity.g.dart';

@JsonSerializable()
class DummyGetOtpDtoEntity {
	String? status = '';
	String? message = '';
	DummyGetOtpDtoData? data;

	DummyGetOtpDtoEntity();

	factory DummyGetOtpDtoEntity.fromJson(Map<String, dynamic> json) => $DummyGetOtpDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $DummyGetOtpDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DummyGetOtpDtoData {
	int? id = 0;
	@JSONField(name: "first_name")
	String? firstName = '';
	@JSONField(name: "last_name")
	String? lastName = '';

	DummyGetOtpDtoData();

	factory DummyGetOtpDtoData.fromJson(Map<String, dynamic> json) => $DummyGetOtpDtoDataFromJson(json);

	Map<String, dynamic> toJson() => $DummyGetOtpDtoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}