import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';
import 'package:bayteq_test/app/modules/home/home_controller.dart';

class SelectionBar extends StatelessWidget {
  const SelectionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0.025 * Constants.size.height
        ),
        child: Obx(() => ToggleSwitch(
          initialLabelIndex: 0,
          minWidth: 0.3 * Constants.size.width,
          minHeight: 0.05 * Constants.size.height,
          totalSwitches: 3,
          inactiveBgColor: HexColor('89c2d9'),
          activeBgColor: [HexColor('0077b6')],
          customTextStyles: [AppTextThemes.textItem],
          labels: [
            _.capitalize(_.data['results'][0]['name']),
            _.capitalize(_.data['results'][1]['name']),
            _.capitalize(_.data['results'][2]['name']),
          ],
          onToggle: (index) {
            _.onPokemonSelected(index!);
          },
        )),
      ),
    );
  }
}
