import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/app_theme.dart';

class MacroShimmerLoading extends StatelessWidget {
  const MacroShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey40,
        highlightColor: AppColors.grey50,
        child: Container(
          width: double.infinity,
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
