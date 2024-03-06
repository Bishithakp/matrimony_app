import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            coverPic(context),
            backBotton(context),
           // location(),
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
                    'Alice Christy',
                    style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'About',
                    style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                  'I m an award-winning content writer who has eight years of experience creating compelling articles and short stories I m continuously searching for new topics and stories to capture the attention of new readers. With my knowledge and experience, I can help you fulfill your content creation goals.'
                  ),
                 
                   userDetails(
                          heading: 'Education', value: 'Bsc'),
                  userDetails(
                      heading: 'Relationship Status',
                      value: 'single'),
                  Visibility(
                    child:
                        userDetails(heading: 'Gender', value: 'male'),
                    visible: true,
                  ),
                   Visibility(
                          child: userDetails(
                              heading: 'Work', value:'developer'),
                          visible: true,
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row userDetails({required String heading, required String value}) {
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
          color: appmainColorlight, borderRadius: BorderRadius.circular(10)),
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
          'Kochi',
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
            fit: BoxFit.cover, image: NetworkImage("https://wallpapercave.com/wp/wp5047333.jpg")),
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
                    image: NetworkImage("https://wallpapercave.com/wp/wp5047333.jpg"))),
          )),
    );
  }
}