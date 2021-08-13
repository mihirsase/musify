import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:musify/models/song.dart';

class APIRequester {
  static final APIRequester instance = APIRequester._();

  late Dio _dio;

  APIRequester._() {
    _dio = Dio();
  }

  Future<List<Song?>?> getSongListFromAlbum({required String albumName}) async {
    try {
      final Response response = await _dio.post(
          'https://itunes.apple.com/search?term=${albumName.replaceAll(' ', '+')}&media=music&entity=song&country=US&attribute=albumTerm');
      return Song.listFromJson(json.decode(response.data)['results']);
    } catch (e) {
      return [];
    }
  }
}
