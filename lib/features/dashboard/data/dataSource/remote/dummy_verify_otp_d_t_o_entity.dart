import 'package:clean_flutter/generated/json/base/json_field.dart';
import 'package:clean_flutter/generated/json/dummy_verify_otp_d_t_o_entity.g.dart';
import 'dart:convert';
export 'package:clean_flutter/generated/json/dummy_verify_otp_d_t_o_entity.g.dart';

@JsonSerializable()
class DummyVerifyOtpDTOEntity {
	String? message = '';
	String? token = '';
	@JSONField(name: "first_name")
	String? firstName = '';
	@JSONField(name: "last_name")
	String? lastName = '';

	DummyVerifyOtpDTOEntity();

	factory DummyVerifyOtpDTOEntity.fromJson(Map<String, dynamic> json) => $DummyVerifyOtpDTOEntityFromJson(json);

	Map<String, dynamic> toJson() => $DummyVerifyOtpDTOEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}