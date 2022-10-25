import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/data/models/pokemon.dart';
import 'package:bayteq_test/app/data/repositories/remote/remote_pokemon_repository.dart';

class HomeController extends GetxController {

  final RemotePokemonRepository _pokemonRepository = Get.find();

  final loading = false.obs;
  final loadingPokemon = false.obs;

  final selectedSkills = <bool>[].obs;
  final primarySkillInfo = ''.obs;
  final secondarySkillInfo = ''.obs;

  final title = 'Pokemon'.obs;
  final data = <String, dynamic>{}.obs;
  final pokemon = Pokemon(sprites: Sprites(other: Other(officialArtwork: OfficialArtwork(frontDefault: ''))), stats: []).obs;

  final skills = ['Intimidación','Regeneración','Inmunidad','Potencia','Impasible','Tóxico'];

  @override
  void onInit() {
    initializeSelectedSkills();
    loadData();
    super.onInit();
  }

  void onPokemonSelected(int index) {
    title.value = capitalize(data['results'][index]['name']);
    var id = splitId(data['results'][index]['url']);
    loadPokemon(id);
  }

  void onSkillSelected(int index) {
    int maxSkills = verifyMaxSelectedSkills();
    if(!selectedSkills[index] && maxSkills < 2) {
      selectedSkills[index] = true;
      setSkillInfo(maxSkills, index);
    } else {
      if(selectedSkills[index]) {
        selectedSkills[index] = false;
        setSkillInfo(maxSkills, -1);
      } else {
        Get.snackbar(
          'Oppss!',
          'No puedes seleccionar más habilidades',
          backgroundColor: Colors.white
        );
      }
    }
  }

  void setSkillInfo(int maxSkills, int index) {
    maxSkills == 1
        ? primarySkillInfo.value = selectedSkillInfo(index)
        : secondarySkillInfo.value = selectedSkillInfo(index);
  }

  String selectedSkillInfo(int index) {
    switch(index) {
      case 0: {
        return Constants.INTIMIDATION;
      }
      case 1: {
        return Constants.REGENERATION;
      }
      case 2: {
        return Constants.IMMUNITY;
      }
      case 3: {
        return Constants.POWER;
      }
      case 4: {
        return Constants.IMPASIBLE;
      }
      case 5: {
        return Constants.TOXIC;
      }
      default: {
        return '';
      }
    }
  }

  void initializeSelectedSkills() {
    selectedSkills.value = List.generate(6, (index) => false);
  }

  int verifyMaxSelectedSkills() {
    int count = 0;
    for (int i = 0; i < selectedSkills.length; i++) {
      if(selectedSkills[i]) {
        count++;
      }
    }
    return count;
  }

  Future<void> onRefresh() async{
    loadData(path: data['next']);
    initializeSelectedSkills();
    primarySkillInfo.value = '';
    secondarySkillInfo.value = '';
  }

  void loadData({String? path = 'https://pokeapi.co/api/v2/pokemon/?limit=3'}) async{
    try {
      loading.value = true;
      data.value = await _pokemonRepository.getPokemons(path: path);
      title.value = capitalize(data['results'][0]['name']);
      var id = splitId(data['results'][0]['url']);
      loadPokemon(id);
    }catch(e) {
      print('Error $e');
    }finally {
      loading.value = false;
    }
  }

  void loadPokemon(int id) async{
    try {
      loadingPokemon.value = true;
      pokemon.value = await _pokemonRepository.retrievePokemon(id);
    }catch(e) {
      print('Error $e');
    }finally {
      loadingPokemon.value = false;
    }
  }

  String capitalize(String str) => str[0].toUpperCase() + str.substring(1);

  int splitId(String path) {
    int id = 1;
    List<String> split = path.split('/');
    id = int.parse(split[6]);
    return id;
  }

  int calculatePercent(int stat) {
    int value = pokemon.value.stats[stat].baseStat;
    for (int i = 0; i < selectedSkills.length; i++) {
      if(selectedSkills[i]) {
        /*Intimidacion*/
        if(i == 0) {
          switch(stat) {
            case 0: {
              /*hp*/
              return value - 5;
            }
            case 1: {
              /*attack*/
              return value + 10;
            }
            case 2: {
              /*defense*/
              return value - 10;
            }
            case 5: {
              /*speed*/
              return value + 15;
            }
          }
        }
        /*Regeneracion*/
        if(i == 1) {
          switch(stat) {
            case 0: {
              /*hp*/
              return value + 10;
            }
            case 1: {
              /*attack*/
              return value - 20;
            }
            case 2: {
              /*defense*/
              return value + 5;
            }
            case 5: {
              /*speed*/
              return value + 5;
            }
          }
        }
        /*Inmunidad*/
        if(i == 2) {
          switch(stat) {
            case 0: {
              /*hp*/
              return value + 10;
            }
            case 1: {
              /*attack*/
              return value - 20;
            }
            case 2: {
              /*defense*/
              return value + 20;
            }
            case 5: {
              /*speed*/
              return value - 10;
            }
          }
        }
        /*Potencia*/
        if(i == 3) {
          switch(stat) {
            case 0: {
              /*hp*/
              return value - 20;
            }
            case 1: {
              /*attack*/
              return value + 15;
            }
            case 2: {
              /*defense*/
              return value - 10;
            }
            case 5: {
              /*speed*/
              return value + 15;
            }
          }
        }
        /*Impasible*/
        if(i == 4) {
          switch(stat) {
            case 0: {
              /*hp*/
              return value - 10;
            }
            case 1: {
              /*attack*/
              return value - 3;
            }
            case 2: {
              /*defense*/
              return value - 10;
            }
            case 5: {
              /*speed*/
              return value + 30;
            }
          }
        }
        /*Toxico*/
        if(i == 5) {
          switch(stat) {
            case 0: {
              /*hp*/
              return value - 15;
            }
            case 1: {
              /*attack*/
              return value - 0;
            }
            case 2: {
              /*defense*/
              return value + 20;
            }
            case 5: {
              /*speed*/
              return value - 3;
            }
          }
        }
      }
    }
    return value;
  }

}