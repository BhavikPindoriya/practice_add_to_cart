class FavoriteModel {
  final int id;
  final String name;
  final int price;
  final String pic;
  FavoriteModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pic,
  });

  FavoriteModel copyWith({
    final int? id,
    final String? name,
    final int? price,
    final String? pic,
  }) {
    return FavoriteModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        pic: pic ?? this.pic);
  }
}
