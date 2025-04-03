import 'package:flutter/material.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';
import 'package:no_more_smoke/common/colors.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        onPressed: () {
          onClick();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: CustomColors.primary,
        child: CustomText(
          text: text,
          onClick: () {},
        ),
      ),
    );
  }
}
