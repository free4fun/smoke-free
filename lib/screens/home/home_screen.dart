/*
 <No More Smoke - Aplicación móvil para dejar el tabaco>
  Copyright (C) 2023  Mauricio Sosa Giri <free4fun@riseup.net>

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
import 'package:no_more_smoke/common/widgets/top_bar.dart';
import 'package:no_more_smoke/routes/routes.dart';
import 'package:no_more_smoke/common/text_providers/text_provider_en.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';
import 'package:no_more_smoke/common/widgets/option_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const TopBar(showBackIcon: true),
            const SizedBox(height: 10),
            CustomText(
              text: TextProvider.normalTextHomeDescription,
              textsize: 24,
              textweight: FontWeight.normal,
              onClick: () {},
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionItem(
                  text: TextProvider.homeAddSmoked,
                  onClick: () {
                    Navigator.of(context).pushNamed(Routes.ADD_SMOKED);
                  },
                ),
                /*const SizedBox(height: 25),
                OptionItem(
                  text: TextProvider.optionItemConfigureYourPlan,
                  onClick: () {
                    Navigator.of(context)
                        .pushNamed(Routes.CONFIGURE_PLAN_SCREEN);
                  },
                ),
                */
                const SizedBox(height: 25),
                OptionItem(
                  text: TextProvider.seeYourProgress,
                  onClick: () {
                    Navigator.of(context)
                        .pushNamed(Routes.MAIN_PROGRESS_SCREEN);
                  },
                ),
                const SizedBox(height: 25),
                OptionItem(
                  text: TextProvider.generalSettings,
                  onClick: () {
                    Navigator.of(context)
                        .pushNamed(Routes.GENERAL_SETTINGS_SCREEN);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
