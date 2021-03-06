import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_movie/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = '4c7cff005d753510ef323f1462ca865f';
  String _url = 'api.themoviedb.org';
  String _lenguage = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _lenguage});
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }
}
