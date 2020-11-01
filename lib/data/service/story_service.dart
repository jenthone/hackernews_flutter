import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'story_service.g.dart';

@RestApi()
abstract class StoryService {
  factory StoryService(Dio dio, {String baseUrl}) = _StoryService;

  @GET("{type}stories.json")
  Future<List<int>> fetchStories(@Path("type") String type);
}
