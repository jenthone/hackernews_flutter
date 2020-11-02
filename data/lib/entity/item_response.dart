import 'package:json_annotation/json_annotation.dart';
part 'item_response.g.dart';

@JsonSerializable()
class ItemResponse {
  final int id;
  final String type;
  final String by;
  final int time;
  final String text;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemResponse(
    this.id,
    this.type,
    this.by,
    this.time,
    this.text,
    this.url,
    this.score,
    this.title,
    this.descendants,
  );

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}
