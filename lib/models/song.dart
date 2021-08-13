class Song {
  String? name;
  String? artist;
  String? album;
  String? songUrl;

  Song({
    this.name,
    this.artist,
    this.album,
    this.songUrl,
  });

  static Song? fromJson(final Map<String, dynamic>? json){
    if (json == null) {
      return null;
    } else {
      return Song(
        name: json['trackName'],
        artist: json['artistName'],
        album: json['collectionName'],
        songUrl: json['previewUrl'],
      );
    }
  }

  static List<Song?> listFromJson(final List<dynamic>? jsons) {
    if (jsons == null) {
      return <Song?>[];
    } else {
      return jsons.map<Song?>((final dynamic json) {
        return Song.fromJson(json);
      }).toList();
    }
  }

}