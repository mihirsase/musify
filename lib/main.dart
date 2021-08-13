import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musify/screens/home_screen.dart';
import 'package:musify/themer/pallete.dart';

void main() {
  runApp(Musify());
}

class Musify extends StatefulWidget {
  const Musify({Key? key}) : super(key: key);

  @override
  _MusifyState createState() => _MusifyState();
}

class _MusifyState extends State<Musify> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Musify',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Pallete.lightBackground,
        lightSource: LightSource.topLeft,
        shadowLightColor: Pallete.shadowLightLight,
        shadowDarkColor: Pallete.shadowLightDark,
        buttonStyle: NeumorphicStyle(
          color: Pallete.buttonLight,
          intensity: 0.99,
        ),
        iconTheme: IconThemeData(color: Pallete.iconLight),
        depth: 5,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Pallete.darkBackground,
        lightSource: LightSource.topLeft,
        shadowLightColor: Pallete.shadowDarkLight,
        shadowDarkColor: Pallete.shadowDarkDark,
        buttonStyle: NeumorphicStyle(
          color: Pallete.buttonDark,
          intensity: 0.99,
        ),
        iconTheme: IconThemeData(color: Pallete.iconDark),
        depth: 20,
      ),
      home: HomeScreen(),
    );
  }
}
