// ignore_for_file: constant_identifier_names

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
import 'package:no_more_smoke/screens/splash/splash_screen.dart';
import 'package:no_more_smoke/screens/home/home_screen.dart';
import 'package:no_more_smoke/screens/smoked/add_smoked.dart';
import 'package:no_more_smoke/screens/plan/configure_plan.dart';
import 'package:no_more_smoke/screens/progress/main_progress.dart';
import 'package:no_more_smoke/screens/progress/details_progress.dart';
import 'package:no_more_smoke/screens/settings/general.dart';

class Routes {
  static const SPLASH_SCREEN = 'SPLASH_SCREEN';
  static const HOME_SCREEN = 'HOME_SCREEN';
  static const ADD_SMOKED = 'ADD_SMOKED';
  static const CONFIGURE_PLAN_SCREEN = 'CONFIGURE_PLAN_SCREEN';
  static const MAIN_PROGRESS_SCREEN = 'MAIN_PROGRESS_SCREEN';
  static const GENERAL_SETTINGS_SCREEN = 'GENERAL_SETTINGS_SCREEN';
  static const DETAILS_PROGRESS_SCREEN = 'DETAILS_PROGRESS_SCREEN';

  static Map<String, WidgetBuilder> routes = {
    SPLASH_SCREEN: (context) => const SplashScreen(),
    HOME_SCREEN: (context) => const HomeScreen(),
    ADD_SMOKED: (context) => const AddSmokedScreen(),
    CONFIGURE_PLAN_SCREEN: (context) => const ConfigurePlan(),
    MAIN_PROGRESS_SCREEN: (context) => const MainProgressScreen(),
    GENERAL_SETTINGS_SCREEN: (context) => const GeneralSettingsScreen(),
    DETAILS_PROGRESS_SCREEN: (context) => const DetailsProgressScreen(),
  };
}
