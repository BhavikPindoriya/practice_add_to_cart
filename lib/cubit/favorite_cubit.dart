import 'package:bloc/bloc.dart';
import 'package:practice_add_to_cart/data/model/favorite_model.dart';

class FavoritesState {
  final List<Product> favoriteProducts;

  FavoritesState({required this.favoriteProducts});

  FavoritesState copyWith({List<Product>? favoriteProducts}) {
    return FavoritesState(
        favoriteProducts: favoriteProducts ?? this.favoriteProducts);
  }
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState(favoriteProducts: []));

  void addFavorite(Product product) {
    final updatedFavorites = List<Product>.from(state.favoriteProducts)
      ..add(product);
    emit(state.copyWith(favoriteProducts: updatedFavorites));
  }

  void removeFavorite(Product product) {
    final updatedFavorites = List<Product>.from(state.favoriteProducts)
      ..remove(product);
    emit(state.copyWith(favoriteProducts: updatedFavorites));
  }
}
