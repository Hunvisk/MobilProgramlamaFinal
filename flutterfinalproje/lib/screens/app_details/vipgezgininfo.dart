
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/localizations.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import '../../core/responsive.dart';
import '../../desktopScreens/app_details/desktopvipgezgininfo.dart';
import '../../tabletscreens.dart/app_details/tabletvipgezgininfo.dart';

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
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
    }
  }

//  drawBottom() {
//    switch (device) {
//      case (Screen.mobile):
//        return MyBottomNavBar();
//      case (Screen.tablet):
//        return MyBottomNavBar();
//      case (Screen.desktop):
//        return;
//    }
//  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  

  

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: drawAppar(),
      body: SafeArea(
          child: drawScreen()),
      //bottomNavigationBar: drawBottom(),
    );
  }
}

class VipGezginSayfa extends StatelessWidget {
  const VipGezginSayfa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
          children: [
    Expanded(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SubscriptionBox(),
        ),
        ContainerOfAllAdvantages(),
        Padding(
          padding: EdgeInsets.all(10.0),
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).secondaryHeaderColor
        ),
        height: 500,
        width: double.infinity,
        child: const Column(
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(AppLocalizations.of(context).getTranslate("favorite_vıp_traveler_advantages"),
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
                imagePath: "assets/images/carouselslider/image8.jpeg",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
                    
              ),
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/carouselslider/image8.jpeg",
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
                imagePath: "assets/images/carouselslider/image8.jpeg",
                title: AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                   AppLocalizations.of(context).getTranslate("feature_content"),
              ),
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/carouselslider/image8.jpeg",
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
                imagePath: "assets/images/carouselslider/image8.jpeg",
                title:AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),
              ),
              FavoriteVipGezginAdvantages(
                imagePath: "assets/images/carouselslider/image8.jpeg",
                title:AppLocalizations.of(context).getTranslate("feature_title"),
                content:
                    AppLocalizations.of(context).getTranslate("feature_content"),)
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
          borderRadius: BorderRadius.circular(10)
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppLocalizations.of(context).getTranslate("more_Features_with_vip_membership_together_with_you"),
          ),
          Column(
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("plans_are_only"),
              ),
              Text(
                AppLocalizations.of(context).getTranslate("cancel_anytime_you_want"),
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