// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/localizations.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:go_router/go_router.dart';
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
        return vipGezginSayfa();
      case (Screen.tablet):
        return TabletVipGezginInfoScreen();
      case (Screen.desktop):
        return DesktopVipGezginInfoScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("vıp_traveler"),
          icon: Icon(Icons.search),
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
     Screen device = Screen.mobile;
  }

  

  

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: drawAppar(),
        body: SafeArea(
            child: drawScreen()),
        //bottomNavigationBar: drawBottom(),
      ),
    );
  }
}

class vipGezginSayfa extends StatelessWidget {
  const vipGezginSayfa({
    super.key,
  });

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).secondaryHeaderColor
        ),
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
            child: Text(AppLocalizations.of(context).getTranslate("favorite_vıp_traveler_advantages"),
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
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/AddCard");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            child: Text(
              "ödeme",
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