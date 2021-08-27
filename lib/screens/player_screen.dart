import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musify/components/atoms/icon_button_atom.dart';
import 'package:musify/models/song.dart';
import 'package:musify/themer/pallete.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;
  final String albumArt;

  const PlayerScreen({
    required this.song,
    required this.albumArt,
  });

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _appBar,
        SizedBox(
          height: 28,
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(125)),
                depth: NeumorphicTheme.isUsingDark(context) ? 10 : 20,
                intensity: 1,
                border: NeumorphicBorder(
                  color:
                      NeumorphicTheme.isUsingDark(context) ? Color(0xff131315) : Color(0xffc2d0e0),
                  width: 4,
                ),
                lightSource: LightSource.topLeft,
                color: NeumorphicTheme.baseColor(context),
              ),
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.albumArt,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.song.name ?? '',
                    style: TextStyle(
                      color: NeumorphicTheme.isUsingDark(context)
                          ? Pallete.primaryTextDark
                          : Pallete.primaryTextLight,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.song.artist ?? '',
                    style: TextStyle(
                      color: NeumorphicTheme.isUsingDark(context)
                          ? Pallete.secondaryTextDark
                          : Pallete.secondaryTextLight,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1:21',
                            style: TextStyle(
                              color: NeumorphicTheme.isUsingDark(context)
                                  ? Pallete.secondaryTextDark
                                  : Pallete.secondaryTextLight,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '3:41',
                            style: TextStyle(
                              color: NeumorphicTheme.isUsingDark(context)
                                  ? Pallete.secondaryTextDark
                                  : Pallete.secondaryTextLight,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      NeumorphicProgress(
                        percent: 0.5,
                        style: ProgressStyle(
                          depth: 3,
                          accent: NeumorphicTheme.isUsingDark(context)
                              ? Pallete.darkAccent
                              : Pallete.lightAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButtonAtom(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        size: 30,
                      ),
                      padding: 6,
                    ),
                    IconButtonAtom(
                      onPressed: () {},
                      icon: Icon(
                        Icons.pause,
                        color: Pallete.white,
                        size: 30,
                      ),
                      padding: 6,
                      color: NeumorphicTheme.isUsingDark(context)
                          ? Pallete.darkAccent
                          : Pallete.lightAccent,
                    ),
                    IconButtonAtom(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next,
                        size: 30,
                      ),
                      padding: 6,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _appBar {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(
        'PLAYING NOW',
        style: TextStyle(
          color: NeumorphicTheme.isUsingDark(context)
              ? Pallete.primaryTextDark.withOpacity(0.6)
              : Pallete.primaryTextLight.withOpacity(0.6),
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
