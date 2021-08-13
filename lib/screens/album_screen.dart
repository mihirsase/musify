import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musify/bloc/album/album_bloc.dart';
import 'package:musify/bloc/album/album_event.dart';
import 'package:musify/bloc/album/album_state.dart';
import 'package:musify/components/atoms/icon_button_atom.dart';
import 'package:musify/models/album.dart';
import 'package:musify/models/song.dart';
import 'package:musify/themer/pallete.dart';

class AlbumScreen extends StatefulWidget {
  final Album album;

  AlbumScreen({
    required this.album,
  });

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late AlbumBloc _albumBloc;

  @override
  void initState() {
    _albumBloc = AlbumBloc();
    _albumBloc.add(LoadAlbums(albumName: widget.album.name ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlbumBloc>(
      create: (final BuildContext _) {
        return _albumBloc;
      },
      child: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (
          final BuildContext _,
          final AlbumState state,
        ) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: NeumorphicTheme.baseColor(context),
              body: _body(state),
            ),
          );
        },
      ),
    );
  }

  Widget _body(AlbumState state) {
    if (state is AlbumLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: NeumorphicTheme.isUsingDark(context)
              ? Pallete.lightBackground
              : Pallete.darkBackground,
        ),
      );
    }
    return ListView(
      children: [
        _appBar,
        SizedBox(
          height: 14,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButtonAtom(
                onPressed: () {
                  NeumorphicTheme.of(context)!.themeMode =
                      NeumorphicTheme.isUsingDark(context) ? ThemeMode.light : ThemeMode.dark;
                },
                icon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite,
                    size: 24,
                  ),
                ),
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(78)),
                  depth: NeumorphicTheme.isUsingDark(context) ? 10 : 15,
                  intensity: 1,
                  border: NeumorphicBorder(
                    color: NeumorphicTheme.isUsingDark(context)
                        ? Color(0xff131315)
                        : Color(0xffc2d0e0),
                    width: 4,
                  ),
                  lightSource: LightSource.topLeft,
                  color: NeumorphicTheme.baseColor(context),
                ),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.album.albumArt!,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              IconButtonAtom(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.share,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        ..._albumBloc.songs.map((final Song? song) {
          if (song != null) {
            return _songTile(song: song);
          } else {
            return SizedBox.shrink();
          }
        }).toList(),
      ],
    );
  }

  Widget get _appBar {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(
        '${widget.album.name} | ${widget.album.artist}',
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

  Widget _songTile({required Song song}) {
    return ListTile(
      title: Text(
        song.name ?? '',
        style: TextStyle(
          color: NeumorphicTheme.isUsingDark(context)
              ? Pallete.primaryTextDark
              : Pallete.primaryTextLight,
        ),
      ),
      subtitle: Text(
        song.artist ?? '',
        style: TextStyle(
          color: NeumorphicTheme.isUsingDark(context)
              ? Pallete.secondaryTextDark
              : Pallete.secondaryTextLight,
        ),
      ),
      trailing: IconButtonAtom(
        onPressed: () {},
        icon: Icon(
          Icons.play_arrow,
          size: 20,
          color: NeumorphicTheme.isUsingDark(context) ? Pallete.iconDark : Pallete.iconLight,
        ),
      ),
    );
  }
}
