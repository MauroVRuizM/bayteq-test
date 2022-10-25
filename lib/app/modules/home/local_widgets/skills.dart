import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/modules/home/home_controller.dart';
import 'package:bayteq_test/app/modules/home/local_widgets/skill_info.dart';
import 'package:bayteq_test/app/modules/home/local_widgets/skill_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.03 * Constants.size.width,
              vertical: 0.02 * Constants.size.height
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Habilidades',
                style: AppTextThemes.titleSecondary,
              ),
            ),
          ),
          const SkillPicker(),
          const SkillInfo(),
        ],
      )
    );
  }
}
