import 'package:flutter/material.dart';
import 'package:medic_petcare/Config/Network.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class ArticleCardWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isHorizontal;
  const ArticleCardWidget({
    Key? key,
    required this.data,
    this.isHorizontal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: isHorizontal ? defaultMargin : 0,
            top: isHorizontal ? 0 : defaultMargin,
          ),
          width: isHorizontal
              ? MediaQuery.of(context).size.width * .65
              : double.infinity,
          clipBehavior: Clip.hardEdge,
          height: isHorizontal ? 120 : 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: ImageWidget(
            image: "${Network().photoUrl}${data['images']}",
            height: isHorizontal ? 120 : 180,
            width: isHorizontal
                ? MediaQuery.of(context).size.width * .80
                : double.infinity,
          ),
        ),
        Positioned(
          top: isHorizontal ? 0 : defaultMargin,
          left: 0,
          right: isHorizontal ? defaultMargin : 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  blackColor.withOpacity(.9),
                  transparentColor,
                ],
              ),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: SizedBox(
            width: isHorizontal
                ? MediaQuery.of(context).size.width * .65 - 32
                : MediaQuery.of(context).size.width * .85,
            child: TextWidget(
              label: data['title'],
              color: whiteColor,
              maxLines: 2,
              useEllipsis: true,
            ),
          ),
        ),
      ],
    );
  }
}
