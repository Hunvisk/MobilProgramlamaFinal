// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

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
          children: const [
            BoardingItem(
                image: AssetImage(
                    'assets/images/boarding/boarding-1.jpg'), // AssetImage olarak güncellendi
                title: "İstanbul'un Gizemli Sokaklarında Yolculuk",
                description:
                    "Hoş geldiniz İstanbul'un Gizemli Sokaklarına ve Tarih Dolu Mekanlarına! İstanbul'un Kalbini Keşfetmek İçin Hazır Mısınız? Bizimle Bu Büyülü Şehri Adım Adım Gezin ve Unutulmaz Anılar Biriktirin."),
            BoardingItem(
                image: AssetImage(
                    'assets/images/boarding/boarding-2.jpg'), // AssetImage olarak güncellendi
                title: "Pasaportunuzdaki Macera... ",
                description:
                    "Artık Pasaportunuzla Bu Eşsiz Şehri Keşfetmenin Zamanı Geldi. "),
            BoardingItem(
              image: AssetImage(
                  'assets/images/boarding/boarding-3.jpg'), // AssetImage olarak güncellendi
              title: "Harita",
              description: "Burayada Haritayala Alakalı Bir Mesaj Yazılacak ",
            ),
            BoardingItem(
              image: AssetImage(
                  'assets/images/boarding/boarding-4.jpg'), // AssetImage olarak güncellendi
              title: "Galata Kulesi",
              description: "Mekan Mesajı Buraya Yazılacak",
            ),
            BoardingItem(
                image: AssetImage(
                    'assets/images/logo/GR_Logo.png'), // AssetImage olarak güncellendi
                title: "Hoşgeldin",
                description: "Hoşgeldin Mesajı Yazılcak Buraya "),
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
