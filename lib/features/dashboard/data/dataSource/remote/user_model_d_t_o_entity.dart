import 'package:clean_flutter/generated/json/base/json_field.dart';
import 'package:clean_flutter/generated/json/user_model_d_t_o_entity.g.dart';
import 'dart:convert';
export 'package:clean_flutter/generated/json/user_model_d_t_o_entity.g.dart';

@JsonSerializable()
class UserModelDTOEntity {
	String? status = '';
	String? message = '';
	UserModelDTOData? data;

	UserModelDTOEntity();

	factory UserModelDTOEntity.fromJson(Map<String, dynamic> json) => $UserModelDTOEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserModelDTOEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserModelDTOData {
	int? id = 0;
	@JSONField(name: "first_name")
	String? firstName = '';
	@JSONField(name: "last_name")
	String? lastName = '';
	String? email = '';
	String? phone = '';
	String? dp = '';

	UserModelDTOData();

	factory UserModelDTOData.fromJson(Map<String, dynamic> json) => $UserModelDTODataFromJson(json);

	Map<String, dynamic> toJson() => $UserModelDTODataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}