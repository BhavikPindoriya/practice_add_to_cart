import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_add_to_cart/cubit/favorite_cubit.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite List"),
      ),
      body: BlocBuilder<FavoriteCubit, Favoritestate>(
        builder: (context, state) {
          if (state is FavoriteInSuccessState) {
            print("this is the lenth ${state.favoriteproduct.length}");
            return ListView.builder(
              itemCount: state.favoriteproduct.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Stack(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.network(
                          height: 50,
                          width: 50,
                          state.favoriteproduct[index].pic.toString(),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      title: Text(
                        state.favoriteproduct[index].name.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Price :- ${state.favoriteproduct[index].price.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: const Text(
                                  'Click ok button to Remove the favorite'),
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
                                    print('remove..............');
                                    // context
                                    //     .read<FavoriteCubit>()
                                    //     .removeFavoriteList(
                                    //         id: state.product![index].id);
                                    // Navigator.pop(context);
                                  },
                                  child: const SizedBox(
                                    child: Text("okay"),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
