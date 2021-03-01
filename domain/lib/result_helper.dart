import 'package:async/async.dart';

class UnhandledException implements Exception {
  final dynamic cause;

  UnhandledException(this.cause);
}

Result<T> runCatching<T>(T Function() block) {
  try {
    return Result.value(block());
  } on Exception catch (e) {
    return Result.error(e);
  } on dynamic catch (e) {
    return Result.error(UnhandledException(e));
  }
}

Future<Result<T>> runCatchingAsync<T>(Future<T> Function() block) async {
  try {
    return Result.value(await block());
  } on Exception catch (e) {
    return Result.error(e);
  } on dynamic catch (e) {
    return Result.error(UnhandledException(e));
  }
}
