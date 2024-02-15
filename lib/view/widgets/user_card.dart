import 'package:flutter/material.dart';

import '../../constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.5,
              blurRadius: 1.5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              //height: 150,
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp')),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'name',
                      style: appTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appBlackcolor),
                    ),
                    Text('age',
                        style: appTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: appBlackcolor))
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
                      'cityname',
                      style: appTextStyle.copyWith(color: appGreycolor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconWidget(
                        icon: Icons.favorite,
                        context: context,
                        backgroundColor: pinkBackgroundcolor,
                        iconColor: appmainColorlight),
                    iconWidget(
                        icon: Icons.waving_hand,
                        context: context,
                        backgroundColor: pinkBackgroundcolor,
                        iconColor: Colors.amber)
                  ],
                )
              ],
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
