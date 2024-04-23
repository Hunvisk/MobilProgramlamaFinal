// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';

class DesktopVipGezginInfo extends StatelessWidget {
  const DesktopVipGezginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'VİP GEZGİN',
      ),
      body: Text("VİP GEZGİN SAYFASI"),
      
    ));
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
        color: Colors.grey.shade200,
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
              "Favori Vip Gezgin Avantajları",
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
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
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
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                 FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                 FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
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
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
                ),
                FavoriteVipGezginAdvantages(
                  imagePath: "assets/images/carouselslider/image8.jpeg",
                  title: "Özellik Başlık",
                  content:
                      "Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik. Özellik İçerik.",
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
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "VİP ÜYELİK İLE DAHA FAZLA ÖZELLİK SENİNLE",
          ),
          Column(
            children: [
              Text(
                "Planlar aylık yalnızca 40,00₺",
              ),
              Text(
                "İstediğin zaman iptal et",
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
              "Abone Ol",
              style: TextStyle(
                color: Colors.white,
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
