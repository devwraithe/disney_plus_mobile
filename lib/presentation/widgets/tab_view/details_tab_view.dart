import 'package:disney_plus/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsTabView extends StatefulWidget {
  final String title, overview, year;
  final List genre;
  final int budget, revenue, runtime;

  const DetailsTabView({
    super.key,
    required this.title,
    required this.overview,
    required this.year,
    required this.genre,
    required this.budget,
    required this.revenue,
    required this.runtime,
  });
  @override
  State<DetailsTabView> createState() => _DetailsTabViewState();
}

class _DetailsTabViewState extends State<DetailsTabView> {
  @override
  Widget build(BuildContext context) {
    final genres = widget.genre
        .toString()
        .substring(1, widget.genre.toString().length - 1);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 23,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppTextTheme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 11),
          Text(
            widget.overview,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          detailItem("Release Year",
              DateFormat('y').format(DateTime.parse(widget.year))),
          const SizedBox(height: 15),
          detailItem("Genre", genres),
          const SizedBox(height: 15),
          detailItem("Creator", "Michael Waldron"),
          const SizedBox(height: 15),
          detailItem(
              "Budget", "\$${currency.format(widget.budget).toString()}"),
          const SizedBox(height: 15),
          detailItem(
              "Revenue", "\$${currency.format(widget.revenue).toString()}"),
          const SizedBox(height: 15),
          detailItem("Runtime", "${widget.runtime.toString()} Minutes"),
        ],
      ),
    );
  }

  final currency = NumberFormat.decimalPattern();

  Widget detailItem(String title, dynamic value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: AppColors.grey,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
