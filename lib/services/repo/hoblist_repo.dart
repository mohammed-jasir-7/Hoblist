import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:geeks/services/endpoints.dart';
import 'package:geeks/services/hoblist_api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../models/hobs api model/hob_movie/hob_movie.dart';

@LazySingleton(as: HobslistServices)
class HobListRepo extends HobslistServices {
  @override
  Future<dynamic> fetchData() async {
    try {
      final result = await http.post(Uri.parse(hobsList), body: {
        "category": "movies",
        "language": "english",
        "genre": "all",
        "sort": "voting"
      });

      final hobMovies = HobMovie.fromJson(jsonDecode(result.body));
      log(result.body);
      return hobMovies.result;
    } on SocketException catch (_) {
      return "No network";
    }
  }
}
