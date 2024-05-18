
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../desktopScreens/user/profile/desktopphotographs.dart';
import '../../../tabletscreens.dart/user/profile/tabletphotographs.dart';
import '../../../widgets/myappbar.dart';

class Photographs extends StatefulWidget {
  const Photographs({Key? key}) : super(key: key);

  @override
  State<Photographs> createState() => PhotographsState();
}

class PhotographsState extends State<Photographs> {
  bool isSearching = false;
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
      case (Screen.mobile):
        return fotografSayfa();
      case (Screen.tablet):
        return const TabletPhotographsScreen();
      case (Screen.desktop):
        return DesktopPhotographsScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("fotos"),
        );
      case (Screen.tablet):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("fotos"),
        );
      case (Screen.desktop):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("fotos"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: drawAppar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: drawScreen(),
        ),
      ),
    );
  }

  Column fotografSayfa() {
    return Column(
      children: [
        const Divider(thickness: 3),
        // ignore: prefer_const_constructors
        FilterWidget(),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isVisible ? 1.0 : 0.0, // Görünür hali
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // İlk sütun
                Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("camera"),
                        "1.151",
                        "assets/images/photographs/anlatan_meydanı.jpeg",
                      ),
                    ),
                    const Gap(10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("collage"),
                        "2.345",
                        "assets/images/photographs/yalvac.jpg",
                      ),
                    ),
                    const Gap(10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("flowers"),
                        "3.789",
                        "assets/images/photographs/isparta.jpg",
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                // İkinci sütun
                Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("animals"),
                        "1.151",
                        "assets/images/photographs/yalvac.jpg",
                      ),
                    ),
                    const Gap(10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("family"),
                        "2.345",
                        "assets/images/photographs/isparta.jpg",
                      ),
                    ),
                    const Gap(10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("facebook"),
                        "3.789",
                        "assets/images/photographs/cinaralti.jpeg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10), // Boşluk ekleyebilirsiniz
                // Üçüncü sütun
                Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("whatsApp"),
                        "1.151",
                        "assets/images/photographs/pisidia.jpeg",
                      ),
                    ),
                    const Gap(10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("snapchat"),
                        "2.345",
                        "assets/images/photographs/yalvac.jpg",
                      ),
                    ),
                    const Gap(10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                      child: photoItem(
                        AppLocalizations.of(context).getTranslate("instagram"),
                        "3.789",
                        "assets/images/photographs/isparta.jpg",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget photoItem(String title, String count, String photo) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          FutureBuilder(
            future: Future.delayed(
                const Duration(milliseconds: 500)), // 0.5 saniye bekleyecek
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              } else {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 8),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 1.0 : 0.0, // Görünür hali
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineMedium!.color,
                fontWeight:
                    Theme.of(context).textTheme.headlineMedium!.fontWeight,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 1.0 : 0.0, // Görünür hali
            child: Text(
              count,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    _showSortPopup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).getTranslate("albums"),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSortPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate("albums"),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_year_(oldest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_year_(newest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_month_(oldest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_month_(newest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_day_(oldest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_day_(newest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
