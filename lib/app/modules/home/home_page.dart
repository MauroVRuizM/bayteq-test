import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:bayteq_test/app/modules/home/local_widgets/pokemon_info.dart';
import 'package:bayteq_test/app/modules/home/local_widgets/selection_bar.dart';
import 'package:bayteq_test/app/modules/home/local_widgets/skills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bayteq_test/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Picachu',
            style: AppTextThemes.title,
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: _.onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SelectionBar(),
                Skills(),
                PokemonInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
