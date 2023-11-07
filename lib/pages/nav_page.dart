import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_page.dart';
import 'fav_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class NavigationPage extends ConsumerWidget {
  NavigationPage({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    const HomePage(),
    const SearchPage(),
    const FavPage(),
    const CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexStateProvider);
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          ref.read(navIndexStateProvider.notifier).update((state) => 0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: _screens[currentIndex],
        bottomNavigationBar: Card(
          margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
          color: const Color.fromRGBO(16, 27, 44, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: BottomNavigationBar(
            elevation: 0.0,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blueGrey.shade100,
            onTap: (int index) => ref
                .read(navIndexStateProvider.notifier)
                .update((state) => index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.home_outlined),
                activeIcon: NavButton(icon: Icon(Icons.home)),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CupertinoIcons.search),
                activeIcon: NavButton(icon: Icon(CupertinoIcons.search)),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CupertinoIcons.heart_circle),
                activeIcon:
                    NavButton(icon: Icon(CupertinoIcons.heart_circle_fill)),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CupertinoIcons.cart),
                activeIcon: NavButton(icon: Icon(CupertinoIcons.cart_fill)),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.person_outline_rounded),
                activeIcon: NavButton(icon: Icon(Icons.person)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
