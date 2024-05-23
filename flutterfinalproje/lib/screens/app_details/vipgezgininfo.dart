// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../core/localizations.dart';
import '../../core/responsive.dart';
import '../../desktopScreens/app_details/desktopvipgezgininfo.dart';
import '../../tabletscreens.dart/app_details/tabletvipgezgininfo.dart';
import '../../widgets/myappbar.dart';

class VipGezginInfo extends StatefulWidget {
  const VipGezginInfo({Key? key}) : super(key: key);

  @override
  _VipGezginInfoState createState() => _VipGezginInfoState();
}

class _VipGezginInfoState extends State<VipGezginInfo> {
  Screen device = Screen.mobile;
  bool isSearching = false;
  late TextEditingController searchController;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return const VipGezginSayfa();
      case (Screen.tablet):
        return const TabletVipGezginInfoScreen();
      case (Screen.desktop):
        return DesktopVipGezginInfoScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
        );
      case (Screen.tablet):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
        );
      case (Screen.desktop):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: drawAppar(),
      body: SafeArea(child: drawScreen()),
    );
  }
}

class VipGezginSayfa extends StatelessWidget {
  const VipGezginSayfa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SubscriptionBox(),
          ),
          ContainerOfAllAdvantages(),
        ],
      ),
    );
  }
}

class ContainerOfAllAdvantages extends StatelessWidget {
  const ContainerOfAllAdvantages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            AppLocalizations.of(context)
                .getTranslate("favorite_vıp_traveler_advantages"),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/achievements/rozet.png",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/achievements/rozet.png",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/achievements/rozet.png",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/achievements/rozet.png",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/achievements/rozet.png",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/achievements/rozet.png",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubscriptionBox extends StatelessWidget {
  const SubscriptionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppLocalizations.of(context).getTranslate(
                "more_Features_with_vip_membership_together_with_you"),
          ),
          Column(
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("plans_are_only"),
              ),
              Text(
                AppLocalizations.of(context)
                    .getTranslate("cancel_anytime_you_want"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            child: Text(
              AppLocalizations.of(context).getTranslate("subscribe"),
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteVipGezginAdvantages extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;

  const FavoriteVipGezginAdvantages({
    super.key,
    required this.imagePath,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 180,
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              content,
            ),
          )
        ],
      ),
    );
  }
}
