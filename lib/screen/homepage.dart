import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_add_to_cart/cubit/favorite_cubit.dart';
import 'package:practice_add_to_cart/data/model/favorite_model.dart';
import 'package:practice_add_to_cart/data/repository/product_list.dart';
import 'package:practice_add_to_cart/screen/favoriteScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool infavoriteList = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoriteList()));
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
                                    Const.product[index].pic.toString()),
                              ),
                            ),
                            title: Text(
                              Const.product[index].name.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Price :- ${Const.product[index].price}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BlocBuilder<FavoriteCubit, Favoritestate>(
                                  builder: (context, state) {
                                    return Container(
                                      child: IconButton(
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
                                                  child: const SizedBox(
                                                    child: Text("Cancel"),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    context
                                                        .read<FavoriteCubit>()
                                                        .addFavoritelist(Const
                                                            .product[index]);
                                                  },
                                                  child: const SizedBox(
                                                    child: Text("okay"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          infavoriteList == true
                                              ? Icons.favorite
                                              : Icons.favorite_border_sharp,
                                          color: infavoriteList == true
                                              ? Colors.amber
                                              : Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // BlocBuilder<CartCubit, CartState>(
                                //   builder: (context, state) {
                                //     bool inWishList = context
                                //         .read<CartCubit>()
                                //         .isProductInCart(
                                //             foundproduct[index].id);
                                //     return Container(
                                //       child: IconButton(
                                //         onPressed: () {
                                //           showDialog(
                                //             context: context,
                                //             builder: (context) => AlertDialog(
                                //               content: const Text(
                                //                   'Click ok button to add the Cart'),
                                //               actions: [
                                //                 ElevatedButton(
                                //                   onPressed: () {
                                //                     Navigator.pop(context);
                                //                   },
                                //                   child: const SizedBox(
                                //                     child: Text("Cancel"),
                                //                   ),
                                //                 ),
                                //                 ElevatedButton(
                                //                   onPressed: () {
                                //                     print(
                                //                         "this is the inwhichList in cart :-$inWishList");
                                //                     Navigator.pop(context);

                                //                     context
                                //                         .read<CartCubit>()
                                //                         .addCartList(
                                //                             product:
                                //                                 foundproduct[
                                //                                     index]);
                                //                   },
                                //                   child: const SizedBox(
                                //                     child: Text("okay"),
                                //                   ),
                                //                 )
                                //               ],
                                //             ),
                                //           );
                                //         },
                                //         icon: Icon(Icons.add_shopping_cart,
                                //             color: inWishList == true
                                //                 ? Colors.amber
                                //                 : Colors.black),
                                //       ),
                                //     );
                                //   },
                                // ),
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
