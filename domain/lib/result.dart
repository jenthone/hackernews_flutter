import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;

  const factory Result.error(Exception exception) = Error<T>;
}

class UnhandledException implements Exception {
  final dynamic cause;

  UnhandledException(this.cause);
}

Result<T> runCatching<T>(T Function() block) {
  try {
    return Result.success(block());
  } on Exception catch (e) {
    return Result.error(e);
  } on dynamic catch (e) {
    return Result.error(UnhandledException(e));
  }
}

Future<Result<T>> runCatchingAsync<T>(Future<T> Function() block) async {
  try {
    return Result.success(await block());
  } on Exception catch (e) {
    return Result.error(e);
  } on dynamic catch (e) {
    return Result.error(UnhandledException(e));
  }
}
