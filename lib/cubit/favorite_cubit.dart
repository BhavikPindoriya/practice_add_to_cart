// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:practice_add_to_cart/data/model/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_add_to_cart/data/model/product_model.dart';

abstract class Favoritestate {}

class FavoriteInitState extends Favoritestate {}

class FavoriteInProgressState extends Favoritestate {}

class FavoriteInSuccessState extends Favoritestate {
  List<FavoriteModel> favoriteproduct;
  FavoriteInSuccessState({
    required this.favoriteproduct,
  });
}

class FavoriteInErrorState extends Favoritestate {
  String error;
  FavoriteInErrorState({
    required this.error,
  });
}

class FavoriteCubit extends Cubit<Favoritestate> {
  FavoriteCubit() : super(FavoriteInitState());

  void addFavoritelist(ProductModel product) {
    try {
      List<FavoriteModel> favoriteproduct = [];

      favoriteproduct.add(
        FavoriteModel(
            id: product.id,
            name: product.name,
            price: product.price,
            pic: product.pic),
      );
      emit(FavoriteInSuccessState(favoriteproduct: favoriteproduct));
      print("add the favorite list$favoriteproduct");
    } catch (e) {
      emit(FavoriteInErrorState(error: e.toString()));
    }
  }
}
