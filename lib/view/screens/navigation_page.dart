import 'package:flutter/material.dart';
import 'package:matrimony_app/view/screens/favorite_page.dart';

  
import 'home_page.dart';
import 'profile_page.dart';

final ValueNotifier<int> indexValueNotifier = ValueNotifier<int>(0);

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      HomePage(),
      FavoritePage(),
      ProfilePage(),
    ];

    return ValueListenableBuilder<int>(
      valueListenable: indexValueNotifier,
      builder: (_, selectedIndex, __) => Scaffold(
        body: Center(
          child: pages.elementAt(selectedIndex),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBottomNavigationBarIcon(
                  icon: Icons.home,
                  index: 0,
                ),
                CustomBottomNavigationBarIcon(
                  icon: Icons.favorite,
                  index: 1,
                ),
                CustomBottomNavigationBarIcon(
                  icon: Icons.person,
                  index: 2,
                )
              ]),
        ),
      ),
    );

    ;
  }
}

class CustomBottomNavigationBarIcon extends StatelessWidget {
  final IconData icon;
  final int index;

  const CustomBottomNavigationBarIcon({
    super.key,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexValueNotifier,
      builder: (_, selectedIndex, __) => GestureDetector(
        onTap: () {
          indexValueNotifier.value = index;
        },
        child: AnimatedContainer(padding: EdgeInsets.all(10),
        duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          
            color: index ==  selectedIndex? Colors.red : Colors.grey,
          ),
          child: Icon(icon,color: Colors.white,),
        ),
      ),
    );
  }
}
