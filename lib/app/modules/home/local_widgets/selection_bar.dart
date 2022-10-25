import 'package:bayteq_test/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';
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
        child: ToggleSwitch(
          initialLabelIndex: 4,
          minWidth: 0.3 * Constants.size.width,
          minHeight: 0.05 * Constants.size.height,
          totalSwitches: 3,
          inactiveBgColor: HexColor('89c2d9'),
          activeBgColor: [HexColor('0077b6')],
          customTextStyles: [AppTextThemes.textItem],
          labels: ['America', 'Canada', 'Mexico'],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
      ),
    );
  }
}
