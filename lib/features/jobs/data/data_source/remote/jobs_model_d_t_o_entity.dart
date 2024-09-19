import 'package:clean_flutter/generated/json/base/json_field.dart';
import 'package:clean_flutter/generated/json/jobs_model_d_t_o_entity.g.dart';
import 'dart:convert';
export 'package:clean_flutter/generated/json/jobs_model_d_t_o_entity.g.dart';

@JsonSerializable()
class JobsModelDTOEntity {
	List<JobsModelDTOData>? data = [];

	JobsModelDTOEntity();

	factory JobsModelDTOEntity.fromJson(Map<String, dynamic> json) => $JobsModelDTOEntityFromJson(json);

	Map<String, dynamic> toJson() => $JobsModelDTOEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JobsModelDTOData {
	String? code = '';
	String? occupation = '';
	@JSONField(name: "occupation_id")
	int? occupationId = 0;
	String? location = '';
	String? company = '';
	String? logo = '';
	String? workingSector = '';
	@JSONField(name: "working_sector_id")
	String? workingSectorId = '';
	String? type = '';
	@JSONField(name: "type_id")
	int? typeId = 0;
	@JSONField(name: "apply_url")
	String? applyUrl = '';
	@JSONField(name: "save_url")
	String? saveUrl = '';
	@JSONField(name: "remove_from_save_url")
	String? removeFromSaveUrl = '';
	@JSONField(name: "created_at")
	String? createdAt = '';
	String? skillLevel = '';
	@JSONField(name: "skill_level_id")
	int? skillLevelId = 0;
	String? salary = '';
	@JSONField(name: "is_applied")
	int? isApplied = 0;
	@JSONField(name: "is_saved")
	int? isSaved = 0;
	String? description = '';
	int? experience = 0;
	int? vacancies = 0;
	JobsModelDTODataCompanyLogo? companyLogo;
	String? deadline = '';

	JobsModelDTOData();

	factory JobsModelDTOData.fromJson(Map<String, dynamic> json) => $JobsModelDTODataFromJson(json);

	Map<String, dynamic> toJson() => $JobsModelDTODataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JobsModelDTODataCompanyLogo {
	int? id = 0;
	@JSONField(name: "model_type")
	String? modelType = '';
	@JSONField(name: "model_id")
	int? modelId = 0;
	String? uuid = '';
	@JSONField(name: "collection_name")
	String? collectionName = '';
	String? name = '';
	@JSONField(name: "file_name")
	String? fileName = '';
	@JSONField(name: "mime_type")
	String? mimeType = '';
	String? disk = '';
	@JSONField(name: "conversions_disk")
	String? conversionsDisk = '';
	int? size = 0;
	List<dynamic>? manipulations = [];
	@JSONField(name: "custom_properties")
	List<dynamic>? customProperties = [];
	@JSONField(name: "generated_conversions")
	List<dynamic>? generatedConversions = [];
	@JSONField(name: "responsive_images")
	List<dynamic>? responsiveImages = [];
	@JSONField(name: "order_column")
	int? orderColumn = 0;
	@JSONField(name: "created_at")
	String? createdAt = '';
	@JSONField(name: "updated_at")
	String? updatedAt = '';
	@JSONField(name: "original_url")
	String? originalUrl = '';
	@JSONField(name: "preview_url")
	String? previewUrl = '';

	JobsModelDTODataCompanyLogo();

	factory JobsModelDTODataCompanyLogo.fromJson(Map<String, dynamic> json) => $JobsModelDTODataCompanyLogoFromJson(json);

	Map<String, dynamic> toJson() => $JobsModelDTODataCompanyLogoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}