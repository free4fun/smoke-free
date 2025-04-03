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
import 'package:no_more_smoke/common/colors.dart';

class CustomFormText extends StatelessWidget {
  const CustomFormText({
    Key? key,
    this.textsize = 26.0,
    this.textalign = TextAlign.center,
    this.textcolor = CustomColors.black,
    this.textweight = FontWeight.normal,
    required this.onClick,
  }) : super(key: key);

  final double textsize;
  final TextAlign textalign;
  final Color textcolor;
  final FontWeight textweight;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontSize: textsize, color: textcolor, fontWeight: textweight),
      textAlign: textalign,
      maxLines: 33,
    );
  }
}
