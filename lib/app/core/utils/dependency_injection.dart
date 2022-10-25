import 'package:get/get.dart';
import 'package:bayteq_test/app/data/repositories/remote/remote_pokemon_repository.dart';
import 'package:bayteq_test/app/data/providers/remote/remote_pokemon_provider.dart';

class DependencyInjection {
  static void init() {
    //Providers
    Get.put(RemotePokemonProvider());
    //Repositories
    Get.put(RemotePokemonRepository());
  }
}