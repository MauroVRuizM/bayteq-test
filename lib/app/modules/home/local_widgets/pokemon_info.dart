import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/modules/home/home_controller.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        children: [
          Obx(() => CachedNetworkImage(
            height: 0.3 * Constants.size.height,
            imageUrl: _.pokemon.value.sprites.other.officialArtwork.frontDefault,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const FaIcon(FontAwesomeIcons.circleExclamation),
          )),
          Divider(
            indent: 0.05 * Constants.size.width,
            endIndent: 0.05 * Constants.size.width,
          ),
          /*Vida*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.solidHeart),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.01 * Constants.size.width
                    )
                  ),
                  Text(
                    'Vida',
                    style: AppTextThemes.titleSecondary,
                  ),
                ],
              ),
              Obx(() => _.pokemon.value.stats.isEmpty
                ? Container()
                : LinearPercentIndicator(
                width: 0.5 * Constants.size.width,
                lineHeight: 0.022 * Constants.size.height,
                percent: _.calculatePercent(0)/250,
                progressColor: HexColor('aacc00'),
                center: Text('${_.calculatePercent(0)}/250'),
              ))
            ],
          ),
          /*Ataque*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.solidHandBackFist),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.01 * Constants.size.width
                      )
                  ),
                  Text(
                    'Ataque',
                    style: AppTextThemes.titleSecondary,
                  ),
                ],
              ),
              Obx(() => _.pokemon.value.stats.isEmpty
                ? Container()
                : LinearPercentIndicator(
                width: 0.5 * Constants.size.width,
                lineHeight: 0.022 * Constants.size.height,
                percent: _.calculatePercent(1)/250,
                progressColor: HexColor('ee6055'),
                center: Text('${_.calculatePercent(1)}/250'),
              ))
            ],
          ),
          /*Defensa*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.shield),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.01 * Constants.size.width
                      )
                  ),
                  Text(
                    'Defensa',
                    style: AppTextThemes.titleSecondary,
                  ),
                ],
              ),
              Obx(() => _.pokemon.value.stats.isEmpty
                ? Container()
                : LinearPercentIndicator(
                width: 0.5 * Constants.size.width,
                lineHeight: 0.022 * Constants.size.height,
                percent: _.calculatePercent(2)/250,
                progressColor: HexColor('3fa7d6'),
                center: Text('${_.calculatePercent(2)}/250'),
              ))
            ],
          ),
          /*Velocidad*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.bolt),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.01 * Constants.size.width
                      )
                  ),
                  Text(
                    'Velocidad',
                    style: AppTextThemes.titleSecondary,
                  ),
                ],
              ),
              Obx(() => _.pokemon.value.stats.isEmpty
                ? Container()
                : LinearPercentIndicator(
                width: 0.5 * Constants.size.width,
                lineHeight: 0.022 * Constants.size.height,
                percent: _.calculatePercent(5)/250,
                progressColor: HexColor('ffc857'),
                center: Text('${_.calculatePercent(5)}/250'),
              ))
            ],
          ),
        ],
      )
    );
  }
}
