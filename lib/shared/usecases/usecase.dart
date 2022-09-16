abstract class Usecase<TReturn, TParam> {
  Future<TReturn> call({TParam? param});
}
