abstract class AlbumEvent {}

class LoadAlbums extends AlbumEvent {
  final String albumName;

  LoadAlbums({
    required final this.albumName,
  });
}
