import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/modules/home/home_controller.dart';

class SkillInfo extends StatelessWidget {
  const SkillInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                FontAwesomeIcons.circleInfo,
                size: 0.02 * Constants.size.height,
              ),
              Text(
                'Información de las habilidades seleccionadas',
                style: AppTextThemes.subtitle,
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 0.02 * Constants.size.height)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.05 * Constants.size.width,
              vertical: 0.01 * Constants.size.height
            ),
            child: Obx(() => Text(
              _.primarySkillInfo.value,
              textAlign: TextAlign.justify,
              style: AppTextThemes.description,
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.05 * Constants.size.width,
                vertical: 0.01 * Constants.size.height
            ),
            child: Obx(() => Text(
              _.secondarySkillInfo.value,
              textAlign: TextAlign.justify,
              style: AppTextThemes.description,
            )),
          ),
        ],
      )
    );
  }
}
