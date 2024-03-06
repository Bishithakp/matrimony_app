
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/widgets/user_card.dart';
import 'package:matrimony_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class SearchPage extends StatelessWidget {
  
  const SearchPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewmodel>(builder: (_, mod, __) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 45,
              width: 360,
              child: TextField(
                style: const TextStyle(
                  color: Color(0xff020202),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                onChanged: (value) {
                  mod.searchRecipe(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xfff1f1f1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for Items",
                  hintStyle: const TextStyle(
                      color: Color(0xffb2b2b2),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      decorationThickness: 6),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
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
                                itemCount: mod.results.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return UserCard(
                                    usermodel: mod.results[index], 
                                    favoriteTap:()=> mod.setfavoriteTap(userModel: mod.favorite[index]),
                                  );
                                })
            )
          ],
        ),
      );
    });
  }
}