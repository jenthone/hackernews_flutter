import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_response.g.dart';
part 'item_response.freezed.dart';

@freezed
abstract class ItemResponse with _$ItemResponse {
  factory ItemResponse({
    final int id,
    final String type,
    final String by,
    final int time,
    final String text,
    final String url,
    final int score,
    final String title,
    final int descendants,
  }) = _ItemResponse;

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}
