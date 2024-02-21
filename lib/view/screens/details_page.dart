import 'package:flutter/material.dart';
import 'package:matrimony_app/constants.dart';
import 'package:matrimony_app/model/user_model.dart';

class DeatilsPage extends StatelessWidget {
  final UserModel userModel;
  const DeatilsPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            coverPic(context),
            backBotton(context),
            location(),
            profilePic()
          ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    userModel.fullName,
                    style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'About',
                    style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userModel.bio,
                  ),
                  Headings(label: 'Interests'),
                  Wrap(
                    spacing: 8, // space between items
                    children: userModel.interests
                        .map((e) => userInterestCard(e))
                        .toList(),
                  ),
                  Headings(label: 'Hobbies'),
                  Wrap(
                      spacing: 8,
                      children: userModel.hobbies
                          .map((e) => userInterestCard(e))
                          .toList()),
                  Headings(label: 'Languages'),
                  Wrap(
                      spacing: 8,
                      children: userModel.languages
                          .map((e) => userInterestCard(e))
                          .toList()),
                  userDetails(heading: 'Education', value: userModel.education!),
                  userDetails(heading: 'Relationship Status', value: userModel.relationshipStatus),
                  userDetails(heading: 'Gender', value: userModel.gender.toString()),
                  userDetails(heading: 'Work', value: userModel.work!)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row userDetails({required String heading,required String value }) {
    return Row(
                  children: [
                    Headings(label: heading + ':'),
                    Text(
                      value,
                      style: TextStyle(color: appmainColorlight),
                    )
                  ],
                );
  }

  Text Headings({required String label}) {
    return Text(
      label,
      style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Container userInterestCard(String e) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: appmainColorlight,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        e,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Positioned location() {
    return Positioned(
      top: 20,
      right: 20,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(20)),
        child: Text(
          userModel.location,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Positioned backBotton(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  Container coverPic(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(bottom: 60),
      child: Container(
          decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(userModel.coverPhoto)),
      )),
    );
  }

  Positioned profilePic() {
    return Positioned(
      bottom: -20,
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Container(
            height: 150,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(userModel.profilePic))),
          )),
    );
  }
}
