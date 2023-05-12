import 'package:disney_plus/core/theme/app_theme.dart';
import 'package:disney_plus/presentation/widgets/channels/channel_card.dart';
import 'package:flutter/material.dart';

class ChannelList extends StatefulWidget {
  final String title;

  const ChannelList({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  State<ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            widget.title,
            style: AppTextTheme.textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 156,
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemBuilder: (context, index) {
              return const ChannelCard();
            },
          ),
        ),
      ],
    );
  }
}
