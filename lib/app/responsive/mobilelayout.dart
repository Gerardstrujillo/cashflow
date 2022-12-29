// DART
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// PUBLIC
import 'package:cashflow/core/colors.dart';

// WIDGETS SCREENS
import 'package:cashflow/utils/items.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

// WIDGET
class _MobileLayoutState extends State<MobileLayout> {
  // COME ON
  int iPage = 0;

  // STRING
  late PageController pageController;

  // PAGE VIEW
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  // CURRENT
  @override
  void dispose() {
    super.dispose();
    pageController.dispose;
  }

  // INTERACTIVE LABELS
  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  // ROUTING
  void onPageChanged(int page) {
    setState(() {
      iPage = page;
    });
  }

  // APP
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      body: PageView(
        controller: pageController,
        // SCROLL PAGE
        onPageChanged: onPageChanged,
        // WIDGETS SCREENS
        children: itemsHome,
      ),
      // FOOTER APP
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Center(
          child: CupertinoTabBar(
            backgroundColor: footer,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: Column(
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: iPage == 0 ? blue : secondary,
                        size: 23,
                      ),
                      Text(
                        'Principal',
                        style: TextStyle(
                          color: iPage == 0 ? blue : secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: Column(
                    children: [
                      Icon(
                        Icons.search,
                        color: iPage == 1 ? blue : secondary,
                        size: 23,
                      ),
                      Text(
                        'Explorar',
                        style: TextStyle(
                          color: iPage == 1 ? blue : secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: Column(
                    children: [
                      Icon(
                        Icons.settings ,
                        color: iPage == 2 ? blue : secondary,
                        size: 23,
                      ),
                      Text(
                        'Ajustes',
                        style: TextStyle(
                          color: iPage == 2 ? blue : secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person_outline_outlined,
                        color: iPage == 3 ? blue : secondary,
                        size: 24,
                      ),
                      Text(
                        'Perfil',
                        style: TextStyle(
                          color: iPage == 3 ? blue : secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
            ],
            onTap: navigationTapped,
          ),
        ),
      ),
    );
  }
}
