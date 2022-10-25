import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/modules/home/home_controller.dart';

class SkillPicker extends StatelessWidget {
  const SkillPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 0.03 * Constants.size.width
        ),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0.06 * Constants.size.width,
              mainAxisExtent: 0.16 * Constants.size.width,
            ),
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.center,
                child: Obx(() => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _.selectedSkills[index]
                          ? HexColor('013a63')
                          : HexColor('2a6f97')
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 0.014 * Constants.size.height,
                  ),
                  width: 0.3 * Constants.size.width,
                  child: GestureDetector(
                    onTap: () { _.onSkillSelected(index); },
                    child: Text(
                      _.skills[index],
                      textAlign: TextAlign.center,
                      style: AppTextThemes.textButton,
                    ),
                  ),
                )),
              );
            }
        ),
      )
    );
  }
}
