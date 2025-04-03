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
import 'package:no_more_smoke/common/widgets/top_bar.dart';
import 'package:no_more_smoke/common/text_providers/text_provider_en.dart';
import 'package:no_more_smoke/routes/routes.dart';
import 'package:no_more_smoke/common/colors.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';

class AddSmokedScreen extends StatelessWidget {
  const AddSmokedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddSmoked(),
    );
  }
}

class AddSmoked extends StatefulWidget {
  const AddSmoked({super.key});

  @override
  State<AddSmoked> createState() => _AddSmokedState();
}

class _AddSmokedState extends State<AddSmoked> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final circumstanceController = TextEditingController();
  int relevance = 5;
  String selectedValue = '01';

  @override
  void initState() {
    super.initState();
    dateController.text = actualDate;
    timeController.text = actualTime;
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    circumstanceController.dispose();
    super.dispose();
  }

  String get actualDate => DateFormat('dd/MM/yyyy').format(DateTime.now());
  String get actualTime => DateFormat('HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(showBackIcon: true),
              const SizedBox(height: 10),
              CustomText(
                text: TextProvider.optionItemAddSmokedDetails,
                textsize: 14,
                textweight: FontWeight.normal,
                onClick: () {},
              ),
              const SizedBox(height: 20),
              buildInputField(
                  TextProvider.date, dateController, Icons.date_range),
              buildInputField(
                  TextProvider.time, timeController, Icons.access_time_rounded),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextProvider.relevance,
                    style: const TextStyle(
                        fontSize: 16, color: CustomColors.primary),
                  ),
                  const SizedBox(height: 10),
                  buildRelevanceRadioGroup(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextProvider.reason,
                    style: const TextStyle(
                        fontSize: 16, color: CustomColors.primary),
                  ),
                  const SizedBox(height: 10),
                  buildDropdown(),
                ],
              ),
              buildInputField(TextProvider.circumstance, circumstanceController,
                  Icons.app_registration_rounded),
              const SizedBox(height: 20),
              buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
      String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Icon(icon, color: CustomColors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: CustomColors.primary),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRelevanceRadioGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(5, (index) {
        int value = index + 1;
        return Column(
          children: [
            Radio(
              value: value,
              groupValue: relevance,
              onChanged: (int? val) => setState(() => relevance = val!),
              activeColor: CustomColors.primary,
            ),
            Text(value.toString()),
          ],
        );
      }),
    );
  }

  Widget buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: DropdownButton<String>(
        value: selectedValue,
        items: [
          'Alcohol',
          'Anti Depressive',
          'Anxiety',
          'Awakening',
          'Boredom',
          'Concentration',
          'Drugs',
          'Nervousness',
          'Pleasure',
          'Socialization',
          'Stress',
          'Can not sleep'
        ]
            .asMap()
            .entries
            .map((entry) => DropdownMenuItem(
                  value: (entry.key + 1).toString().padLeft(2, '0'),
                  child: Text(entry.value),
                ))
            .toList(),
        onChanged: (String? newValue) =>
            setState(() => selectedValue = newValue!),
        underline: Container(color: CustomColors.primary, height: 2),
      ),
    );
  }

  Widget buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(
            TextProvider.save, CustomColors.primary, CustomColors.black, () {}),
        buildButton(
            TextProvider.cancel, CustomColors.secondary, CustomColors.white,
            () {
          Navigator.of(context).pushNamed(Routes.HOME_SCREEN);
        }),
      ],
    );
  }

  Widget buildButton(
      String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: bgColor,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}
