// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../core/localizations.dart';

class DesktopVipGezginInfo extends StatelessWidget {
  const DesktopVipGezginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Scaffold());
  }
}

class DesktopVipGezginInfoScreen extends StatelessWidget {
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
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      width: 800,
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
