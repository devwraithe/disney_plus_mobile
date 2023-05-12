import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChannelCard extends StatefulWidget {
  const ChannelCard({Key? key}) : super(key: key);
  @override
  State<ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<ChannelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.network(
        "https://worldvectorlogo.com/download/national-geographic.svg",
        height: 23,
      ),
    );
  }
}
