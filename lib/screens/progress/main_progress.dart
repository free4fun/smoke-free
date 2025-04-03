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
import 'package:intl/intl.dart';
import 'package:no_more_smoke/models/progress.dart';
import 'package:no_more_smoke/routes/routes.dart';
import 'package:no_more_smoke/common/colors.dart';
import 'package:no_more_smoke/common/text_providers/text_provider_en.dart';
import 'package:no_more_smoke/common/widgets/top_bar.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';
import 'package:no_more_smoke/common/widgets/clock.dart';
import 'package:no_more_smoke/common/widgets/level_progress_bar.dart';
import 'package:no_more_smoke/common/widgets/option_item.dart';

class MainProgressScreen extends StatelessWidget {
  const MainProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainProgress(),
    );
  }
}

class MainProgress extends StatefulWidget {
  const MainProgress({super.key});

  @override
  State<MainProgress> createState() => MainProgressStatefull();
}

class MainProgressStatefull extends State<MainProgress> {
  @override
  void initState() {
    super.initState();
  }

  getLastSmoked() {
    DateTime lastSmoked = DateTime.parse("2023-03-18 00:55");
    DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(lastSmoked).toString();
    //     DateTime now = DateTime.now();
    // DateFormat formatter = DateFormat('dd/MM/yyyy');

    // return formatter.format(now);
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    super.dispose();
  }

  int calculateProgressRate() {
    return Progress.calculateProgressRate(
      20,
      0,
      1,
    );
  }

  int calculateAverageSmoked() {
    return Progress.averageSmoked([7, 10, 20, 5].toList());
  }

  @override
  Widget build(BuildContext context) {
    int progressRate = calculateProgressRate();
    int averageSmoked = calculateAverageSmoked();
    String lastSmoked = getLastSmoked();
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                // LOGO
                const TopBar(showBackIcon: true),
                const SizedBox(height: 80),

                // TITLE: SEE YOUR PROGRESS
                CustomText(
                  text: TextProvider.seeYourProgress,
                  textsize: 22,
                  textweight: FontWeight.normal,
                  onClick: () {},
                ),
                const SizedBox(height: 25),

                // TIME FROM LAST CIGARRETTE WITH TICKING CLOCK
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: CustomColors.primary),
                      ),
                    ),
                    child: Row(children: [
                      const Icon(Icons.punch_clock_rounded,
                          color: CustomColors.primary),
                      const SizedBox(width: 10),
                      CountupClock(
                          targetDateTime: DateTime(2021, 12, 31, 23, 59, 59)),
                    ])),

                const Text(
                  TextProvider.sinceTheLastTimeYouSmoked,
                  style: TextStyle(fontSize: 16),
                ),

                // PROGRESS LEVEL
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: CustomColors.primary),
                      ),
                    ),
                    child: Row(children: [
                      const Icon(Icons.auto_graph_rounded,
                          color: CustomColors.primary),
                      const SizedBox(width: 10),
                      const Text(
                        "${TextProvider.progressLevel}:",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: LevelProgressBar(
                          currentLevel: progressRate,
                        ),
                      ),
                    ])),

                // PROGRESS RATE
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: CustomColors.primary),
                      ),
                    ),
                    child: Row(children: [
                      const Icon(Icons.percent_rounded,
                          color: CustomColors.primary),
                      const SizedBox(width: 10),
                      const Text(
                        "${TextProvider.progressRate}:",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        progressRate.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ])),

                // AVERAGE OF CIGARETTES SMOKED PER DAY
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: CustomColors.primary),
                      ),
                    ),
                    child: Row(children: [
                      const Icon(Icons.history_rounded,
                          color: CustomColors.primary),
                      const SizedBox(width: 10),
                      const Text(
                        "${TextProvider.averageSmokedPerDay}:",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        averageSmoked.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ])),

                // HAVENT SMOKE SINCE DATE AND TIME
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: CustomColors.primary),
                      ),
                    ),
                    child: Row(children: [
                      const Icon(Icons.date_range, color: CustomColors.primary),
                      const SizedBox(width: 10),
                      const Text(
                        "${TextProvider.notSmokedSince}: ",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        lastSmoked,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ])),

                // MOST COMMON REASON
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: CustomColors.primary),
                      ),
                    ),
                    child: const Row(children: [
                      Icon(Icons.person_rounded, color: CustomColors.primary),
                      SizedBox(width: 10),
                      Text(
                        "${TextProvider.mostCommonReason}:",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Alcohol",
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                const SizedBox(height: 25),

                // BUTTON MORE DETAILS
                OptionItem(
                  text: TextProvider.moreDetails,
                  onClick: () {
                    Navigator.of(context)
                        .pushNamed(Routes.DETAILS_PROGRESS_SCREEN);
                  },
                ),
              ])))
    ]));
  }
}
