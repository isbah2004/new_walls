import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_walls/theme/theme_data.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      height: 60,
      width: double.maxFinite,
      decoration: const BoxDecoration(color: AppTheme.textBackground),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const FaIcon(
          size: 40,
          FontAwesomeIcons.xmark,
          color: AppTheme.whiteColor,
        ),
      ),
    );
  }
}
