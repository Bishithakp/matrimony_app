import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/user_view_model.dart';
import '../widgets/user_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewmodel>(builder: (_, mod, __) {
      return Scaffold(
    body:GridView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      2, // number of items in each row
                                  mainAxisSpacing: 12.0, // spacing between rows
                                  crossAxisSpacing:
                                      8.0, // spacing between columns
                                ),
                                itemCount: mod.favorite.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return UserCard(
                                    usermodel: mod.favorite[index], 
                                    favoriteTap:()=> mod.setfavoriteTap(userModel: mod.favorite[index]),
                                  );
                                })
    );
  });
}}