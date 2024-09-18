import 'package:clean_flutter/generated/json/base/json_convert_content.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_d_t_o_entity.dart';

DummyDTOEntity $DummyDTOEntityFromJson(Map<String, dynamic> json) {
  final DummyDTOEntity dummyDTOEntity = DummyDTOEntity();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    dummyDTOEntity.userId = userId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dummyDTOEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    dummyDTOEntity.title = title;
  }
  final bool? completed = jsonConvert.convert<bool>(json['completed']);
  if (completed != null) {
    dummyDTOEntity.completed = completed;
  }
  return dummyDTOEntity;
}

Map<String, dynamic> $DummyDTOEntityToJson(DummyDTOEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['completed'] = entity.completed;
  return data;
}

extension DummyDTOEntityExtension on DummyDTOEntity {
  DummyDTOEntity copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return DummyDTOEntity()
      ..userId = userId ?? this.userId
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..completed = completed ?? this.completed;
  }
}