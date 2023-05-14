import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/app_theme.dart';

class MovieInfoImageShimmer extends StatelessWidget {
  const MovieInfoImageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey40,
        highlightColor: AppColors.grey50,
        child: const SizedBox(
          height: 340,
          width: double.infinity,
        ),
      ),
    );
  }
}
