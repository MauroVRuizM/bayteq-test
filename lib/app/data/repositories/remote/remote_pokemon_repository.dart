import 'package:get/get.dart';
import 'package:bayteq_test/app/data/models/pokemon.dart';
import 'package:bayteq_test/app/data/providers/remote/remote_pokemon_provider.dart';

class RemotePokemonRepository {
  final RemotePokemonProvider _pokemonProvider =
  Get.find<RemotePokemonProvider>();

  Future<Map<String,dynamic>> getPokemons({String? path}) => _pokemonProvider.getPokemons(path: path);

  Future<Pokemon> retrievePokemon(int id) => _pokemonProvider.retrievePokemon(id);
}