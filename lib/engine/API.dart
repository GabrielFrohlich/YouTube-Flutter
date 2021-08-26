import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBdiqUxQXCj1SpgBsOO_JQe2OTQYfSbpX8";
const ID_CANAL = "UCuxfOdbKQy0tgGXcm9sjHiw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class API {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        'search'
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);

      List<Video> videos = result['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Error();
    }
  }
}
