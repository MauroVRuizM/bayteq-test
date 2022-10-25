import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/data/models/pokemon.dart';

class RemotePokemonProvider {
  Future<Map<String,dynamic>> getPokemons({String? path}) async{
    final url = Uri.parse(path!);
    final response = await http.get(url);
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  Future<Pokemon> retrievePokemon(int id) async{
    final url = Uri.parse('${Constants.URL}/$id');
    final response = await http.get(url);
    final Map<String, dynamic> data = json.decode(response.body);
    final pokemon = Pokemon.fromJson(data);
    return pokemon;
  }
}