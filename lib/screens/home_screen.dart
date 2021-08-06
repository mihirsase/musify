import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musify/components/atoms/icon_button_atom.dart';
import 'package:musify/models/album.dart';
import 'package:musify/themer/pallete.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: _body,
      ),
    );
  }

  Widget get _body {
    return ListView(
      children: [
        _appbar,
        Container(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Listen to your',
                      style: TextStyle(
                        color: NeumorphicTheme.isUsingDark(context)
                            ? Pallete.secondaryTextDark
                            : Pallete.secondaryTextLight,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Favourite songs',
                      style: TextStyle(
                        color: NeumorphicTheme.isUsingDark(context)
                            ? Pallete.primaryTextDark
                            : Pallete.primaryTextLight,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
                  lightSource: LightSource.topLeft,
                  color: NeumorphicTheme.isUsingDark(context)
                      ? Pallete.darkBackground
                      : Pallete.lightBackground,
                  shadowLightColor:
                      NeumorphicTheme.isUsingDark(context) ? Color(0xff1a1d1f) : Color(0xffc0c8d6),
                  shadowDarkColor:
                      NeumorphicTheme.isUsingDark(context) ? Color(0xff24272b) : Color(0xffffffff),
                  depth: -2,
                  intensity: 1,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _recommendation,
      ],
    );
  }

  Widget get _appbar {
    return Container(
      padding: EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.shrink(),
          IconButtonAtom(
            onPressed: () {
              NeumorphicTheme.of(context)!.themeMode =
                  NeumorphicTheme.isUsingDark(context) ? ThemeMode.light : ThemeMode.dark;
            },
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.brightness_6,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _recommendation {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      primary: false,
      childAspectRatio: 0.76,
      crossAxisSpacing: 14,
      mainAxisSpacing: 18,
      padding: EdgeInsets.all(18),
      children: [
        ...recommendations.map(
          (final Album album) => NeumorphicButton(
            padding: EdgeInsets.zero,
            onPressed: (){},
            style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                lightSource: LightSource.topLeft,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: NeumorphicTheme.isUsingDark(context)
                    ? Pallete.darkBackground
                    : Pallete.lightBackground,
                depth: 5,
                intensity: 0.8),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      album.albumArt!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          album.name!,
                          style: TextStyle(
                            color: NeumorphicTheme.isUsingDark(context)
                                ? Pallete.primaryTextDark
                                : Pallete.primaryTextLight,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          album.artist!,
                          style: TextStyle(
                            color: NeumorphicTheme.isUsingDark(context)
                                ? Pallete.secondaryTextDark
                                : Pallete.secondaryTextLight,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
