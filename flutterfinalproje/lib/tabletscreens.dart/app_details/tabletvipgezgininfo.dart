// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../core/localizations.dart';

class TabletVipGezginInfo extends StatelessWidget {
  const TabletVipGezginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title: 'VİP GEZGİN',
      ),
      body: Text("VİP GEZGİN SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}

class TabletVipGezginInfoScreen extends StatelessWidget {
  const TabletVipGezginInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SubscriptionBox(),
            ),
            ContainerOfAllAdvantages(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              //child: ComparisonBox(),
            ),
          ],
        ))),
      ],
    );
  }
}

class ComparisonBox extends StatelessWidget {
  const ComparisonBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).secondaryHeaderColor,
        height: 500,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "abc",
            ),
            Row(
              children: [],
            ),
          ],
        ));
  }
}

class ContainerOfAllAdvantages extends StatelessWidget {
  const ContainerOfAllAdvantages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              AppLocalizations.of(context)
                  .getTranslate("favorite_vıp_traveler_advantages"),
              style: TextStyle(
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
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
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
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
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
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: AppLocalizations.of(context)
                      .getTranslate("feature_title"),
                  content: AppLocalizations.of(context)
                      .getTranslate("feature_content"),
                ),
              ],
            ),
          ),
        ],
      ),
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
              textStyle: TextStyle(
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
          )
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
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300, width: 1),
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
              style: TextStyle(
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
