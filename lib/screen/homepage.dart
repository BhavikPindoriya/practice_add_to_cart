import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_add_to_cart/cubit/favorite_cubit.dart';
import 'package:practice_add_to_cart/data/repository/product_list.dart';
import 'package:practice_add_to_cart/screen/favoriteScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteList()),
              );
            },
            child: const Icon(Icons.favorite),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Const.product.length,
              itemBuilder: (context, index) {
                final product = Const.product[index];
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: Stack(
                        children: [
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  product.pic.toString(),
                                ),
                              ),
                            ),
                            title: Text(
                              product.name.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Price :- ${product.price}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BlocBuilder<FavoritesCubit, FavoritesState>(
                                  builder: (context, state) {
                                    final isFavorite = state.favoriteProducts
                                        .any((favProduct) =>
                                            favProduct.id == product.id);

                                    return IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: const Text(
                                                'Click ok button to add the favorite'),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancel"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  if (isFavorite) {
                                                    context
                                                        .read<FavoritesCubit>()
                                                        .removeFavorite(
                                                            product);
                                                  } else {
                                                    context
                                                        .read<FavoritesCubit>()
                                                        .addFavorite(product);
                                                  }
                                                },
                                                child: const Text("Okay"),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border_sharp,
                                        color: isFavorite
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
