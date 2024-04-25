// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../core/localizations.dart';
import '../../core/storage.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PreloadPageView(
          preloadPagesCount: 3,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          children:  [
            BoardingItem(
                image: AssetImage(
                    'assets/images/boarding/boarding-1.jpg'), // AssetImage olarak güncellendi
                title: AppLocalizations.of(context).getTranslate("boarding_title-1"),
                description:
                    AppLocalizations.of(context).getTranslate("boarding_description-1")),
            BoardingItem(
                image: AssetImage(
                    'assets/images/boarding/boarding-2.jpg'), // AssetImage olarak güncellendi
                title: AppLocalizations.of(context).getTranslate("boarding_title-2"),
                description:
                    AppLocalizations.of(context).getTranslate("boarding_description-2")),
            BoardingItem(
              image: AssetImage(
                  'assets/images/boarding/boarding-3.jpg'), // AssetImage olarak güncellendi
              title:  AppLocalizations.of(context).getTranslate("boarding_title-3"),
              description: AppLocalizations.of(context).getTranslate("boarding_description-3"),
            ),
            BoardingItem(
              image: AssetImage(
                  'assets/images/boarding/boarding-4.jpg'), // AssetImage olarak güncellendi
              title: AppLocalizations.of(context).getTranslate("boarding_title-4"),
              description:AppLocalizations.of(context).getTranslate("boarding_description-4"),
            ),
            BoardingItem(
                image: AssetImage(
                    'assets/images/logo/GR_Logo.png'), // AssetImage olarak güncellendi
                title: AppLocalizations.of(context).getTranslate("boarding_title-5"),
                description: AppLocalizations.of(context).getTranslate("boarding_description-5")),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(page == 0
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 1
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 2
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 3
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 4
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                ],
              ),
              InkWell(
                onTap: () async {
                  final storage = Storage();
                  await storage.firstLaunched();
                  GoRouter.of(context).replace("/Login");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(page == 4 ? "Bitir" : "Geç"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BoardingItem extends StatelessWidget {
  final AssetImage image; // AssetImage olarak değiştirildi
  final String title;
  final String description;

  const BoardingItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(image: image), // AssetImage kullanıldı
            Column(
              children: [
                const Gap(20),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                Text(description),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
