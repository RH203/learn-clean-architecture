import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel {
  @JsonKey(name: 'id')
  final String? sourceId;

  @JsonKey(name: 'name')
  final String? sourceName;

  SourceModel(this.sourceId, this.sourceName);

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
