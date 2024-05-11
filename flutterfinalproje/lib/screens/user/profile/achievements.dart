// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/localizations.dart';
import 'package:flutterfinalproje/desktopScreens/user/profile/desktopachievements.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/user/profile/tabletachievements.dart';
import '../../../widgets/myappbar.dart';

class Achievemets extends StatefulWidget {
  const Achievemets({Key? key}) : super(key: key);

  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievemets> {
  Screen device = Screen.mobile;

  set isSearching(bool isSearching) {}

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return basarimlarSayfa();
      case (Screen.tablet):
        return TabletAchievemetsScreen();
      case (Screen.desktop):
        return DesktopAchievemetsScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("Achievemets"),
        );
      case (Screen.tablet):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("Achievemets"),
        );
      case (Screen.desktop):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("Achievemets"),
        );
    }
  }
//drawBottom(){
//     switch (device) {
//      case (Screen.mobile):
//       return  MyBottomNavBar();
//      case (Screen.tablet):
//       return MyBottomNavBar();
//      case (Screen.desktop):
//       return ;
//     }
//   }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Container(
        child: Scaffold(
      appBar: drawAppar(),
      body: SafeArea(
        child: drawScreen(),
      ),
      //bottomNavigationBar: drawBottom(),
    ));
  }
}

class basarimlarSayfa extends StatelessWidget {
  const basarimlarSayfa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("my_first_trip"),
                    description: AppLocalizations.of(context).getTranslate(
                        "you_completed_your_first_location_visit"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("travel_Intern"),
                    description: AppLocalizations.of(context)
                        .getTranslate("completed_venue_visits"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("senior_traveler"),
                    description: AppLocalizations.of(context)
                        .getTranslate("completed_venue"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("expert_traveler"),
                      description: AppLocalizations.of(context)
                          .getTranslate("completed_visits")),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("travel_explorer"),
                    description:
                        AppLocalizations.of(context).getTranslate("venue_tour"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("this_my_may"),
                    description: AppLocalizations.of(context)
                        .getTranslate("you_created_your_first_route"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("do_you_need_advice"),
                    description: AppLocalizations.of(context)
                        .getTranslate("you_wrote_your_first_blog_post"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("blog_editor"),
                      description: AppLocalizations.of(context)
                          .getTranslate("you_wrote_a_blog_post")),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("beloved_blog_author"),
                      description: AppLocalizations.of(context)
                          .getTranslate("write_a_blog")),
                  Gap(15),
                  AchievementsBox1(
                      title:
                          AppLocalizations.of(context).getTranslate("traveler"),
                      description: AppLocalizations.of(context)
                          .getTranslate("membership")),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("need_help"),
                      description: AppLocalizations.of(context)
                          .getTranslate("chatbot_communication")),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("half_of_the_journey_is_to_desire"),
                      description: AppLocalizations.of(context).getTranslate(
                          "saved_to_the_list_of_places_to_visit")),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("achievement_hunter"),
                      description: AppLocalizations.of(context)
                          .getTranslate("you_completed_all_achievements")),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context).getTranslate("think"),
                      description: AppLocalizations.of(context)
                          .getTranslate("place_or_route_comment")),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("from_my_perspective"),
                      description: AppLocalizations.of(context)
                          .getTranslate("you_uploaded_a_photo")),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("traveler_album"),
                    description: AppLocalizations.of(context)
                        .getTranslate("you_uploaded_photos"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                      title: AppLocalizations.of(context)
                          .getTranslate("a_little_bit_of_every_kind"),
                      description: AppLocalizations.of(context).getTranslate(
                          "at_least_one_place_from_each_category")),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("versatile_travel"),
                    description: AppLocalizations.of(context)
                        .getTranslate("different_category"),
                  ),
                  Gap(15),
                  AchievementsBox1(
                    title: AppLocalizations.of(context)
                        .getTranslate("the_istanbul_wanderer"),
                    description: AppLocalizations.of(context).getTranslate(
                        "a_place_from_every_district_of_istanbul"),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AchievementsBox1 extends StatefulWidget {
  final String title;
  final String description;

  const AchievementsBox1({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  State<AchievementsBox1> createState() => _AchievementsBox1State();
}

class _AchievementsBox1State extends State<AchievementsBox1> {
  bool isVisible = false;

@override
void initState() {
  super.initState();
  // Sayfa yüklendiğinde 0.5 saniye sonra görünürlüğü değiştir
  Future.delayed(const Duration(milliseconds: 500), () {
    setState(() {
      isVisible = true;
    });
  });
}

@override
Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 125,
    decoration: BoxDecoration(
      color: Theme.of(context).secondaryHeaderColor,
      border: Border.all(
        width: 1,
        color: Theme.of(context).secondaryHeaderColor,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        // Silik konteyner
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isVisible ? 0.0 : 1.0, // Silik hali
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // Resim ve metin
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isVisible ? 1.0 : 0.0, // Görünür hali
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      bottom: 5.0,
                      left: 5.0,
                      right: 8.0,
                    ),
                    child: Image.asset("assets/images/achievements/rozet.jpeg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        Gap(5),
                        Text(
                          widget.description,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}