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
            // BoardingItem(
            //   image: AssetImage('assets/images/boardingImages/boarding-1.jpg'), // AssetImage olarak güncellendi
            //   title: "Zekat Nedir ?",
            //   description: "Zekat, İslam dininde mal varlığına sahip olanların belirli bir yüzdesini ihtiyaç sahiplerine vermeyi öngören bir ibadet ve sosyal yardımlaşma sistemidir.",
            // ),
            // BoardingItem(
            //   image: AssetImage('assets/images/boardingImages/boarding-2.png'), // AssetImage olarak güncellendi
            //   title: "Zekatın Önemi",
            //   description: "Zekat, inananlar için maddi varlıklarını paylaşma, yardımlaşma ve toplumsal dayanışmanın bir ifadesidir. İslam'ın beş şartından biridir ve inananlar için büyük bir öneme sahiptir."


            // ),
            // BoardingItem(
            //   image: AssetImage('assets/images/boardingImages/boarding-3.jpg'), // AssetImage olarak güncellendi
            //   title: "Zekat Kimlere Verilir ?",
            //   description: "Zekat, ihtiyaç sahiplerine, yoksullara, yetimlere, dul kadınlara, borçlulara ve diğer zor durumda olanlara verilir. Bu kişilerin yardıma muhtaç olmaları zekatın verilme şartıdır.",
            // ),
            
            // BoardingItem(
            //   image: AssetImage('assets/images/boardingImages/boarding-4.png'), // AssetImage olarak güncellendi
            //   title: "Zekat Nasıl Hesaplanır?",
            //   description: "Zekat genellikle mal varlığının belirli bir yüzdesi olarak hesaplanır. Altın, gümüş, para, ticari mallar gibi çeşitli varlıkların değerleri üzerinden hesaplanır ve belirli bir oranda zekat verilir.",
            // ),
            
            // BoardingItem(
            //   image: AssetImage('assets/images/boardingImages/boarding-5.jpg'), // AssetImage olarak güncellendi
            //   title: "Zekatın Verilme Zamanı",
            //   description: "Zekat, İslam takvimine göre belirli zamanlarda verilir. Genellikle Ramazan ayı boyunca veya yılın herhangi bir zamanında zekat verilmesi uygundur.",
            // ),
            
            // BoardingItem(
            //   image: AssetImage('assets/images/boardingImages/boarding-6.png'), // AssetImage olarak güncellendi
            //   title: "Zekatın Faziletleri",
            //   description: "Zekat vermek, inananlar için bir ibadet olarak kabul edilir ve manevi bir rızık olarak değerlendirilir. Zekatın verilmesi, bireylerin manevi gelişimine katkı sağlar ve toplumsal dayanışmayı güçlendirir.",
            // ),
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
                  Icon(page == 0 ? CupertinoIcons.circle_filled : CupertinoIcons.circle),
                  Icon(page == 1 ? CupertinoIcons.circle_filled : CupertinoIcons.circle),
                  Icon(page == 2 ? CupertinoIcons.circle_filled : CupertinoIcons.circle),
                  Icon(page == 3 ? CupertinoIcons.circle_filled : CupertinoIcons.circle),
                  Icon(page == 4 ? CupertinoIcons.circle_filled : CupertinoIcons.circle),
                  Icon(page == 5 ? CupertinoIcons.circle_filled : CupertinoIcons.circle),
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
                  child: Text(page == 5 ? "Bitir" : "Geç"),
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
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
