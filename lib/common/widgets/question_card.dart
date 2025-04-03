/*
 <SOS Vida Aplicación móvil para prevención de conductas suicidas>
    Copyright (C) 2022  Mauricio Sosa Giri <free4fun@riseup.net>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
import 'package:no_more_smoke/common/colors.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.text,
    this.textsize = 30.0,
    this.textcolor = CustomColors.black,
    this.textalign = TextAlign.center,
    this.textweight = FontWeight.normal,
  }) : super(key: key);

  final String text;
  final double textsize;
  final TextAlign textalign;
  final FontWeight textweight;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: _getBoxDecoration(),
      child: CustomText(
          text: text,
          textsize: textsize,
          textalign: textalign,
          textcolor: textcolor,
          textweight: textweight,
          onClick: () {}),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: CustomColors.primary,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
