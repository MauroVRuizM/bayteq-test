import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pokemonSelected = 0.obs;
  final selectedSkills = <bool>[].obs;
  final primarySkillInfo = ''.obs;
  final secondarySkillInfo = ''.obs;

  final skills = ['Intimidación','Regeneración','Inmunidad','Potencia','Impasible','Tóxico'];

  @override
  void onInit() {
    initializeSelectedSkills();
    super.onInit();
  }

  void onPokemonSelected(int index) {
    pokemonSelected.value = index;
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

  Future<void> onRefresh() {
    print('Waiting...');
    return Future.delayed(Duration(seconds: 0));
  }
}