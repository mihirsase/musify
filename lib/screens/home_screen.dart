import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musify/components/atoms/icon_button_atom.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButtonAtom(
              onPressed: () {
                NeumorphicTheme.of(context)!.themeMode =
                    NeumorphicTheme.isUsingDark(context) ? ThemeMode.light : ThemeMode.dark;
              },
              icon: Icon(
                Icons.skip_previous,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
