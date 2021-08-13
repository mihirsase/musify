import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/bloc/album/album_event.dart';
import 'package:musify/bloc/album/album_state.dart';
import 'package:musify/models/song.dart';
import 'package:musify/services/api_reqester.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumLoading());
  List<Song?> songs = [];

  @override
  Stream<AlbumState> mapEventToState(
    final AlbumEvent event,
  ) async* {
    if (event is LoadAlbums) {
      List<Song?>? list = await APIRequester.instance.getSongListFromAlbum(
        albumName: event.albumName,
      );
      if (list != null) {
        songs = list;
      }
      yield AlbumLoaded();
    }
  }
}
