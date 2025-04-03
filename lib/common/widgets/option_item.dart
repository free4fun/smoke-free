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
import 'package:flutter/material.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';
import 'package:no_more_smoke/common/colors.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    Key? key,
    required this.text,
    this.textsize = 26.0,
    this.textalign = TextAlign.center,
    this.textcolor = CustomColors.black,
    this.textweight = FontWeight.normal,
    required this.onClick,
  }) : super(key: key);

  final String text;
  final double textsize;
  final TextAlign textalign;
  final Color textcolor;
  final FontWeight textweight;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        onPressed: () {
          onClick();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: CustomColors.primary,
        child: CustomText(
            text: text,
            textsize: textsize,
            textcolor: textcolor,
            textweight: textweight,
            textalign: textalign,
            onClick: () {}),
      ),
    );
  }
}
