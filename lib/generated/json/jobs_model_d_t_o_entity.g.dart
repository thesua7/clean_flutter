import 'package:clean_flutter/generated/json/base/json_convert_content.dart';
import 'package:clean_flutter/features/jobs/data/data_source/remote/jobs_model_d_t_o_entity.dart';

JobsModelDTOEntity $JobsModelDTOEntityFromJson(Map<String, dynamic> json) {
  final JobsModelDTOEntity jobsModelDTOEntity = JobsModelDTOEntity();
  final List<JobsModelDTOData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<JobsModelDTOData>(e) as JobsModelDTOData)
      .toList();
  if (data != null) {
    jobsModelDTOEntity.data = data;
  }
  return jobsModelDTOEntity;
}

Map<String, dynamic> $JobsModelDTOEntityToJson(JobsModelDTOEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension JobsModelDTOEntityExtension on JobsModelDTOEntity {
  JobsModelDTOEntity copyWith({
    List<JobsModelDTOData>? data,
  }) {
    return JobsModelDTOEntity()
      ..data = data ?? this.data;
  }
}

JobsModelDTOData $JobsModelDTODataFromJson(Map<String, dynamic> json) {
  final JobsModelDTOData jobsModelDTOData = JobsModelDTOData();
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    jobsModelDTOData.code = code;
  }
  final String? occupation = jsonConvert.convert<String>(json['occupation']);
  if (occupation != null) {
    jobsModelDTOData.occupation = occupation;
  }
  final int? occupationId = jsonConvert.convert<int>(json['occupation_id']);
  if (occupationId != null) {
    jobsModelDTOData.occupationId = occupationId;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    jobsModelDTOData.location = location;
  }
  final String? company = jsonConvert.convert<String>(json['company']);
  if (company != null) {
    jobsModelDTOData.company = company;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    jobsModelDTOData.logo = logo;
  }
  final String? workingSector = jsonConvert.convert<String>(
      json['workingSector']);
  if (workingSector != null) {
    jobsModelDTOData.workingSector = workingSector;
  }
  final String? workingSectorId = jsonConvert.convert<String>(
      json['working_sector_id']);
  if (workingSectorId != null) {
    jobsModelDTOData.workingSectorId = workingSectorId;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    jobsModelDTOData.type = type;
  }
  final int? typeId = jsonConvert.convert<int>(json['type_id']);
  if (typeId != null) {
    jobsModelDTOData.typeId = typeId;
  }
  final String? applyUrl = jsonConvert.convert<String>(json['apply_url']);
  if (applyUrl != null) {
    jobsModelDTOData.applyUrl = applyUrl;
  }
  final String? saveUrl = jsonConvert.convert<String>(json['save_url']);
  if (saveUrl != null) {
    jobsModelDTOData.saveUrl = saveUrl;
  }
  final String? removeFromSaveUrl = jsonConvert.convert<String>(
      json['remove_from_save_url']);
  if (removeFromSaveUrl != null) {
    jobsModelDTOData.removeFromSaveUrl = removeFromSaveUrl;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    jobsModelDTOData.createdAt = createdAt;
  }
  final String? skillLevel = jsonConvert.convert<String>(json['skillLevel']);
  if (skillLevel != null) {
    jobsModelDTOData.skillLevel = skillLevel;
  }
  final int? skillLevelId = jsonConvert.convert<int>(json['skill_level_id']);
  if (skillLevelId != null) {
    jobsModelDTOData.skillLevelId = skillLevelId;
  }
  final String? salary = jsonConvert.convert<String>(json['salary']);
  if (salary != null) {
    jobsModelDTOData.salary = salary;
  }
  final int? isApplied = jsonConvert.convert<int>(json['is_applied']);
  if (isApplied != null) {
    jobsModelDTOData.isApplied = isApplied;
  }
  final int? isSaved = jsonConvert.convert<int>(json['is_saved']);
  if (isSaved != null) {
    jobsModelDTOData.isSaved = isSaved;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    jobsModelDTOData.description = description;
  }
  final int? experience = jsonConvert.convert<int>(json['experience']);
  if (experience != null) {
    jobsModelDTOData.experience = experience;
  }
  final int? vacancies = jsonConvert.convert<int>(json['vacancies']);
  if (vacancies != null) {
    jobsModelDTOData.vacancies = vacancies;
  }
  final JobsModelDTODataCompanyLogo? companyLogo = jsonConvert.convert<
      JobsModelDTODataCompanyLogo>(json['companyLogo']);
  if (companyLogo != null) {
    jobsModelDTOData.companyLogo = companyLogo;
  }
  final String? deadline = jsonConvert.convert<String>(json['deadline']);
  if (deadline != null) {
    jobsModelDTOData.deadline = deadline;
  }
  return jobsModelDTOData;
}

Map<String, dynamic> $JobsModelDTODataToJson(JobsModelDTOData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['occupation'] = entity.occupation;
  data['occupation_id'] = entity.occupationId;
  data['location'] = entity.location;
  data['company'] = entity.company;
  data['logo'] = entity.logo;
  data['workingSector'] = entity.workingSector;
  data['working_sector_id'] = entity.workingSectorId;
  data['type'] = entity.type;
  data['type_id'] = entity.typeId;
  data['apply_url'] = entity.applyUrl;
  data['save_url'] = entity.saveUrl;
  data['remove_from_save_url'] = entity.removeFromSaveUrl;
  data['created_at'] = entity.createdAt;
  data['skillLevel'] = entity.skillLevel;
  data['skill_level_id'] = entity.skillLevelId;
  data['salary'] = entity.salary;
  data['is_applied'] = entity.isApplied;
  data['is_saved'] = entity.isSaved;
  data['description'] = entity.description;
  data['experience'] = entity.experience;
  data['vacancies'] = entity.vacancies;
  data['companyLogo'] = entity.companyLogo?.toJson();
  data['deadline'] = entity.deadline;
  return data;
}

extension JobsModelDTODataExtension on JobsModelDTOData {
  JobsModelDTOData copyWith({
    String? code,
    String? occupation,
    int? occupationId,
    String? location,
    String? company,
    String? logo,
    String? workingSector,
    String? workingSectorId,
    String? type,
    int? typeId,
    String? applyUrl,
    String? saveUrl,
    String? removeFromSaveUrl,
    String? createdAt,
    String? skillLevel,
    int? skillLevelId,
    String? salary,
    int? isApplied,
    int? isSaved,
    String? description,
    int? experience,
    int? vacancies,
    JobsModelDTODataCompanyLogo? companyLogo,
    String? deadline,
  }) {
    return JobsModelDTOData()
      ..code = code ?? this.code
      ..occupation = occupation ?? this.occupation
      ..occupationId = occupationId ?? this.occupationId
      ..location = location ?? this.location
      ..company = company ?? this.company
      ..logo = logo ?? this.logo
      ..workingSector = workingSector ?? this.workingSector
      ..workingSectorId = workingSectorId ?? this.workingSectorId
      ..type = type ?? this.type
      ..typeId = typeId ?? this.typeId
      ..applyUrl = applyUrl ?? this.applyUrl
      ..saveUrl = saveUrl ?? this.saveUrl
      ..removeFromSaveUrl = removeFromSaveUrl ?? this.removeFromSaveUrl
      ..createdAt = createdAt ?? this.createdAt
      ..skillLevel = skillLevel ?? this.skillLevel
      ..skillLevelId = skillLevelId ?? this.skillLevelId
      ..salary = salary ?? this.salary
      ..isApplied = isApplied ?? this.isApplied
      ..isSaved = isSaved ?? this.isSaved
      ..description = description ?? this.description
      ..experience = experience ?? this.experience
      ..vacancies = vacancies ?? this.vacancies
      ..companyLogo = companyLogo ?? this.companyLogo
      ..deadline = deadline ?? this.deadline;
  }
}

JobsModelDTODataCompanyLogo $JobsModelDTODataCompanyLogoFromJson(
    Map<String, dynamic> json) {
  final JobsModelDTODataCompanyLogo jobsModelDTODataCompanyLogo = JobsModelDTODataCompanyLogo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    jobsModelDTODataCompanyLogo.id = id;
  }
  final String? modelType = jsonConvert.convert<String>(json['model_type']);
  if (modelType != null) {
    jobsModelDTODataCompanyLogo.modelType = modelType;
  }
  final int? modelId = jsonConvert.convert<int>(json['model_id']);
  if (modelId != null) {
    jobsModelDTODataCompanyLogo.modelId = modelId;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    jobsModelDTODataCompanyLogo.uuid = uuid;
  }
  final String? collectionName = jsonConvert.convert<String>(
      json['collection_name']);
  if (collectionName != null) {
    jobsModelDTODataCompanyLogo.collectionName = collectionName;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    jobsModelDTODataCompanyLogo.name = name;
  }
  final String? fileName = jsonConvert.convert<String>(json['file_name']);
  if (fileName != null) {
    jobsModelDTODataCompanyLogo.fileName = fileName;
  }
  final String? mimeType = jsonConvert.convert<String>(json['mime_type']);
  if (mimeType != null) {
    jobsModelDTODataCompanyLogo.mimeType = mimeType;
  }
  final String? disk = jsonConvert.convert<String>(json['disk']);
  if (disk != null) {
    jobsModelDTODataCompanyLogo.disk = disk;
  }
  final String? conversionsDisk = jsonConvert.convert<String>(
      json['conversions_disk']);
  if (conversionsDisk != null) {
    jobsModelDTODataCompanyLogo.conversionsDisk = conversionsDisk;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    jobsModelDTODataCompanyLogo.size = size;
  }
  final List<dynamic>? manipulations = (json['manipulations'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (manipulations != null) {
    jobsModelDTODataCompanyLogo.manipulations = manipulations;
  }
  final List<dynamic>? customProperties = (json['custom_properties'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (customProperties != null) {
    jobsModelDTODataCompanyLogo.customProperties = customProperties;
  }
  final List<
      dynamic>? generatedConversions = (json['generated_conversions'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (generatedConversions != null) {
    jobsModelDTODataCompanyLogo.generatedConversions = generatedConversions;
  }
  final List<dynamic>? responsiveImages = (json['responsive_images'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (responsiveImages != null) {
    jobsModelDTODataCompanyLogo.responsiveImages = responsiveImages;
  }
  final int? orderColumn = jsonConvert.convert<int>(json['order_column']);
  if (orderColumn != null) {
    jobsModelDTODataCompanyLogo.orderColumn = orderColumn;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    jobsModelDTODataCompanyLogo.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    jobsModelDTODataCompanyLogo.updatedAt = updatedAt;
  }
  final String? originalUrl = jsonConvert.convert<String>(json['original_url']);
  if (originalUrl != null) {
    jobsModelDTODataCompanyLogo.originalUrl = originalUrl;
  }
  final String? previewUrl = jsonConvert.convert<String>(json['preview_url']);
  if (previewUrl != null) {
    jobsModelDTODataCompanyLogo.previewUrl = previewUrl;
  }
  return jobsModelDTODataCompanyLogo;
}

Map<String, dynamic> $JobsModelDTODataCompanyLogoToJson(
    JobsModelDTODataCompanyLogo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['model_type'] = entity.modelType;
  data['model_id'] = entity.modelId;
  data['uuid'] = entity.uuid;
  data['collection_name'] = entity.collectionName;
  data['name'] = entity.name;
  data['file_name'] = entity.fileName;
  data['mime_type'] = entity.mimeType;
  data['disk'] = entity.disk;
  data['conversions_disk'] = entity.conversionsDisk;
  data['size'] = entity.size;
  data['manipulations'] = entity.manipulations;
  data['custom_properties'] = entity.customProperties;
  data['generated_conversions'] = entity.generatedConversions;
  data['responsive_images'] = entity.responsiveImages;
  data['order_column'] = entity.orderColumn;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['original_url'] = entity.originalUrl;
  data['preview_url'] = entity.previewUrl;
  return data;
}

extension JobsModelDTODataCompanyLogoExtension on JobsModelDTODataCompanyLogo {
  JobsModelDTODataCompanyLogo copyWith({
    int? id,
    String? modelType,
    int? modelId,
    String? uuid,
    String? collectionName,
    String? name,
    String? fileName,
    String? mimeType,
    String? disk,
    String? conversionsDisk,
    int? size,
    List<dynamic>? manipulations,
    List<dynamic>? customProperties,
    List<dynamic>? generatedConversions,
    List<dynamic>? responsiveImages,
    int? orderColumn,
    String? createdAt,
    String? updatedAt,
    String? originalUrl,
    String? previewUrl,
  }) {
    return JobsModelDTODataCompanyLogo()
      ..id = id ?? this.id
      ..modelType = modelType ?? this.modelType
      ..modelId = modelId ?? this.modelId
      ..uuid = uuid ?? this.uuid
      ..collectionName = collectionName ?? this.collectionName
      ..name = name ?? this.name
      ..fileName = fileName ?? this.fileName
      ..mimeType = mimeType ?? this.mimeType
      ..disk = disk ?? this.disk
      ..conversionsDisk = conversionsDisk ?? this.conversionsDisk
      ..size = size ?? this.size
      ..manipulations = manipulations ?? this.manipulations
      ..customProperties = customProperties ?? this.customProperties
      ..generatedConversions = generatedConversions ?? this.generatedConversions
      ..responsiveImages = responsiveImages ?? this.responsiveImages
      ..orderColumn = orderColumn ?? this.orderColumn
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..originalUrl = originalUrl ?? this.originalUrl
      ..previewUrl = previewUrl ?? this.previewUrl;
  }
}