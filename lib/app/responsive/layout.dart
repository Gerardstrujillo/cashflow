// DART
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// PUBLIC
import 'package:cashflow/core/dimensions.dart';

// AUTH USERS
import 'package:cashflow/database/providers/user.dart';

class Layout extends StatefulWidget {
  // SCREENS
  final Widget webLayout;
  final Widget mobileLayout;

  const Layout({
    Key? key,
    required this.webLayout,
    required this.mobileLayout
  }) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // PROVIDER METHODS
  @override
  void initState() {
    super.initState();
    addData();
  }

  // VoidCallback API
  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  // WIDGET
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webScreenSize){
          // WEB SCREEN
          return widget.webLayout;
        }
        // MOBILE SCREEN 
        return widget.mobileLayout;
      },
    );
  }
}