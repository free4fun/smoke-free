import 'package:flutter/material.dart';

import 'package:no_more_smoke/common/text_providers/text_provider_en.dart';
import 'package:no_more_smoke/common/widgets/top_bar.dart';
import 'package:no_more_smoke/common/widgets/texts_item.dart';

class DetailsProgressScreen extends StatelessWidget {
  const DetailsProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsProgress(),
    );
  }
}

class DetailsProgress extends StatefulWidget {
  const DetailsProgress({super.key});

  @override
  State<DetailsProgress> createState() => DetailsProgressStatefull();
}

class DetailsProgressStatefull extends State<DetailsProgress> {
  final datetimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  text: TextProvider.moreDetailsInYourProgress,
                  textsize: 22,
                  textweight: FontWeight.normal,
                  onClick: () {},
                ),
                const SizedBox(height: 25),
              ])))
    ]));
  }
}
