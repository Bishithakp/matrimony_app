import 'package:flutter/material.dart';
import 'package:matrimony_app/view/screens/details_page.dart';
import 'package:matrimony_app/view/screens/favorite_page.dart';

import '../../constants.dart';
import '../../model/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel usermodel;
  final Function favoriteTap;
  const UserCard(
      {super.key, required this.usermodel, required this.favoriteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.5,
              blurRadius: 1.5,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DeatilsPage(userModel: usermodel)));
                },
                child: Container(
                  //height: 200,
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(usermodel.profilePic)),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Visibility(
                      visible: usermodel.verifiedStatus,
                      child: Icon(
                        Icons.verified_user_outlined,
                        color: Colors.green,
                      )))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 110,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          usermodel.fullName,
                          style: appTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: appBlackcolor),
                        ),
                      ),
                      //  SizedBox(
                      //   width: MediaQuery.of(context).size.width/5,
                      //    child: Text(usermodel.birthDate.toString(),
                      //    maxLines: 2,
                      //         style: appTextStyle.copyWith(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: appBlackcolor)),
                      //  ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        size: 15,
                        color: appGreycolor,
                      ),
                      Text(
                        usermodel.location,
                        style: appTextStyle.copyWith(color: appGreycolor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(usermodel.birthDate.toString()),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            favoriteTap();
                          },
                          child: iconWidget(
                              icon: Icons.favorite,
                              context: context,
                              backgroundColor: pinkBackgroundcolor,
                              iconColor: usermodel.isFavorite
                                  ? appmainColorlight
                                  : Colors.grey),
                        ),
                        iconWidget(
                            icon: Icons.waving_hand,
                            context: context,
                            backgroundColor: pinkBackgroundcolor,
                            iconColor: Colors.amber)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  Container iconWidget(
      {required IconData icon,
      required BuildContext context,
      required Color backgroundColor,
      required Color iconColor}) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 13,
          color: iconColor,
        ),
      ),
    );
  }
}
