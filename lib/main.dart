import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
        baseColor: Color(0xFFe5eefd),
        lightSource: LightSource.topLeft,
        shadowDarkColor: Color(0xffc1cddc),
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF1f2225),
        lightSource: LightSource.topLeft,
        shadowDarkColor: Color(0xff000000),
        shadowLightColor: Color(0xff22272b),
        depth: 6,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            NeumorphicButton(
              style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  color:  NeumorphicTheme.isUsingDark(context) ? Color(0xFF1d2123) : Color(0xFFe4edfc),
                  depth: 5,
                  intensity: 1,
                  shape: NeumorphicShape.convex,
                  border: NeumorphicBorder(
                      width: 0.5,
                      color: NeumorphicTheme.isUsingDark(context) ? Color(0x991c2022) : Color(0x11d5dde8),
                  )
              ),
              child: Icon(
                Icons.skip_previous,
                size: 32,
                color: Color(0xFFa0afc8),
              ),
              onPressed: () {
                NeumorphicTheme.of(context)!.themeMode =
                NeumorphicTheme.isUsingDark(context) ? ThemeMode.light : ThemeMode.dark;
              },
            ),
          ],
        ),
      ),
    );
  }
}
