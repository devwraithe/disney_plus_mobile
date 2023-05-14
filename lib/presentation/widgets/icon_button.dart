import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';

class DIconButton extends StatelessWidget {
  final String icon;
  const DIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: AppColors.white,
          width: 1.8,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          "assets/vectors/$icon.svg",
          color: AppColors.white,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
