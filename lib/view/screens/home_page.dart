import 'package:flutter/material.dart';
import 'package:matrimony_app/constants.dart';
import 'package:provider/provider.dart';

import '../../view_model/user_view_model.dart';
import '../widgets/app_loading.dart';
import '../widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewmodel>(builder: (_, mod, __) {
      return DefaultTabController(
        length: 1,
        child: SafeArea(
          child: Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          'hello,jason',
                          style: appTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: appMaincolor,
                              size: 20,
                            ),
                            Text(
                              'bali',
                              style:
                                  appTextStyle.copyWith(color: appBlackcolor),
                            ),
                            Text(
                              'Indonesia',
                              style:
                                  appTextStyle.copyWith(color: appBlackcolor),
                            )
                          ],
                        )
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 200,
                    ),
                    Stack(children: [
                      const Icon(
                        Icons.notifications_none,
                        size: 35,
                      ),
                      Positioned(
                          top: 9,
                          right: 6,
                          child: Container(
                            height: 6,
                            width: 13,
                            decoration: const BoxDecoration(
                                color: appMaincolor, shape: BoxShape.circle),
                          ))
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TabBar(
                  labelColor: const Color.fromRGBO(255, 255, 255, 1),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.pink,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Near You',
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                mod.loading
                    ? const Apploading()
                    : mod.userError.code != 0
                        ? Text(mod.userError.message)
                        : Expanded(
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
                                itemCount: mod.usersList.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return UserCard(
                                    usermodel: mod.usersList[index], 
                                    favoriteTap:()=> mod.setfavoriteTap(userModel: mod.usersList[index]),
                                  );
                                }),
                          ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
