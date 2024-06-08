// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../desktopScreens/user/profile/desktopcomments.dart';
import '../../../tabletscreens.dart/user/profile/tabletusercomments.dart';
import '../../../widgets/appbarwithsearchicon.dart';

void main() {
  runApp(const UserComments());
}

class UserComments extends StatefulWidget {
  const UserComments({Key? key}) : super(key: key);

  @override
  _UserCommentsState createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> {
  Screen device = Screen.mobile;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    // Sayfa yüklendiğinde 0.5 saniye sonra görünürlüğü değiştir
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  drawScreen() {
    switch (device) {
      case Screen.mobile:
        return yorumSayfa();
      case Screen.tablet:
        return tabletUserCommentsScreen();
      case Screen.desktop:
        return desktopUserCommentsScreen();
    }
  }

  drawAppBar() {
    return AppBarWithSearchIcon(
      title: AppLocalizations.of(context).getTranslate("Comments"),
      icon: const Icon(Icons.search),
      onSearchChanged: (isSearching) {
        setState(() {
          // Handle search state changes here
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        appBar: drawAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isVisible ? 0.0 : 1.0, // Silik hali
                ),
                const Gap(10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                  child:
                      yorumSayfa(), // Doğrudan yorumSayfa metodu kullanılıyor
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column yorumSayfa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Gap(10),
        BuildColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          title: 'Hüseyin Çakal',
          date: '4 yıl önce',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Beşiktaş',
        ),
        const Gap(10),
        BuildColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          title: 'Hüseyin Çakal',
          date: '3 ay önce',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Kız Kulesi',
        ),
        const Gap(10),
        BuildColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          title: 'Hüseyin Çakal',
          date: '1 yıl önce',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Sarıyer',
        ),
        const Gap(10),
        BuildColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          title: 'Hüseyin Çakal',
          date: '1 ay önce',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Kadıköy',
        ),
        const Gap(10),
        BuildColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          title: 'Hüseyin Çakal',
          date: '1 gün önce',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Galata Kulesi',
        ),
        const Gap(10),
        BuildColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          title: 'Hüseyin Çakal',
          date: '1 saat önce',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'İstinye',
        ),
        const Gap(10),
      ],
    );
  }
}

class BuildColoredBox extends StatefulWidget {
  final String title;
  final String location;
  final Color color;
  final String content;
  final String date;

  const BuildColoredBox({
    required this.title,
    required this.location,
    required this.color,
    required this.content,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  State<BuildColoredBox> createState() => BuildColoredBoxState();
}

class BuildColoredBoxState extends State<BuildColoredBox> {
  bool isVisible = false;
  late TextEditingController _controller;
  // Güncellenmiş içeriği tutmak için bir değişken ekleyin
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);
    // Başlangıçta içeriği güncellenmiş içeriğe eşitleyin
    // Sayfa yüklendiğinde 0.5 saniye sonra görünürlüğü değiştir
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Denetleyiciyi temizleyin
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 0.0 : 1.0, // Silik hali
            child: const Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 1.0 : 0.0, // Görünür hali
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                      15.0), // İçeriğin kenarlardan uzaklığı
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_circle,
                          ),
                          const Gap(5),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8),
                          const Icon(Icons.circle, size: 5),
                          const Gap(2),
                          Text(
                            widget.date,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Gap(5),
                      Text(
                        widget.content,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.location,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
