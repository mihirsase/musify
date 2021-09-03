import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musify/bloc/player/player_bloc.dart';
import 'package:musify/bloc/player/player_event.dart';
import 'package:musify/bloc/player/player_state.dart';
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
  late PlayerBloc _playerBloc;

  @override
  void initState() {
    _playerBloc = PlayerBloc(song: widget.song);
    _playerBloc.add(LoadPlayer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerBloc>(
      create: (final BuildContext _) {
        return _playerBloc;
      },
      child: BlocBuilder<PlayerBloc, AudioPlayerState>(
        builder: (
          final BuildContext _,
          final AudioPlayerState state,
        ) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: NeumorphicTheme.baseColor(context),
              body: WillPopScope(
                  onWillPop: () async {
                    _playerBloc.add(Reload());
                    return true;
                  },
                  child: _body(state)),
            ),
          );
        },
      ),
    );
  }

  Widget _body(final AudioPlayerState state) {
    if (state is PlayerLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: NeumorphicTheme.isUsingDark(context)
              ? Pallete.lightBackground
              : Pallete.darkBackground,
        ),
      );
    }
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
                    textAlign: TextAlign.center,
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
                            _playerBloc.getFormattedDuration(_playerBloc.songPosition),
                            style: TextStyle(
                              color: NeumorphicTheme.isUsingDark(context)
                                  ? Pallete.secondaryTextDark
                                  : Pallete.secondaryTextLight,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _playerBloc.getFormattedDuration(_playerBloc.songDuration),
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
                        percent: _playerBloc.progressPercentage,
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
                      onPressed: () {
                        if (_playerBloc.audioPlayer.playing) {
                          _playerBloc.add(Pause());
                        } else {
                          _playerBloc.add(Play());
                        }
                      },
                      icon: Icon(
                        _playerBloc.audioPlayer.playing ? Icons.pause : Icons.play_arrow,
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
