import 'package:favorites_app_bloc/models/post.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class FavoriteCardBloc extends BlocBase {
  final _favoritesListController = BehaviorSubject<List<Post>>();
  Observable<List<Post>> get isFavoritesListFlux =>
      _favoritesListController.stream;
  Sink<List<Post>> get isFavoritesListEvent => _favoritesListController.sink;

  final _isFavoriteController = BehaviorSubject<bool>();
  Observable<bool> get isFavoriteFlux => _isFavoriteController.stream;
  Sink<bool> get isFavoriteEvent => _isFavoriteController.sink;

  FavoriteCardBloc(Post post) {
    isFavoritesListFlux
        .map((data) => data.contains(post))
        .listen(isFavoriteEvent.add);
  }

  @override
  void dispose() {
    _isFavoriteController.close();
    _favoritesListController.close();
  }
}
