import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'story_service.g.dart';

@injectable
@RestApi()
abstract class StoryService {
  @factoryMethod
  factory StoryService(Dio dio) = _StoryService;

  @GET('{{type}}stories.json')
  Future<List<int>> fetchStories(@Path('type') String type);
}
