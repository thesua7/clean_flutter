import 'package:clean_flutter/generated/json/base/json_field.dart';
import 'package:clean_flutter/generated/json/dummy_d_t_o_entity.g.dart';
import 'dart:convert';
export 'package:clean_flutter/generated/json/dummy_d_t_o_entity.g.dart';

@JsonSerializable()
class DummyDTOEntity {
	int? userId;
	int? id;
	String? title;
	bool? completed;

	DummyDTOEntity();

	factory DummyDTOEntity.fromJson(Map<String, dynamic> json) => $DummyDTOEntityFromJson(json);

	Map<String, dynamic> toJson() => $DummyDTOEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}