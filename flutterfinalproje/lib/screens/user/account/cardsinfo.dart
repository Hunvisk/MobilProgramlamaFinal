
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/responsive.dart';
import '../../../desktopScreens/user/account/desktopCardsİnfo.dart';
import '../../../tabletscreens.dart/user/account/tabletcardsinfo.dart';
import '../../../widgets/appbarwithsearchicon.dart';

class CardsInfo extends StatefulWidget {
  const CardsInfo({Key? key}) : super(key: key);

  @override
  _CardsInfoState createState() => _CardsInfoState();
}

class _CardsInfoState extends State<CardsInfo> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return   kayitliKartSayfa(context);
      case (Screen.tablet):
       return const tabletCardsInfo();

      case (Screen.desktop):
       return const desktopCardsInfo();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "KAYITLI KARTLARIM",
        icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "KAYITLI KARTLARIM",icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "KAYITLI KARTLARIM",icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}

  @override
  Widget build(BuildContext context) {
      setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return SafeArea(
      child: Scaffold(
        appBar: drawAppar(),
        body:drawScreen(),
      ),
    );
  }

  Column kayitliKartSayfa(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Yeni kart ekle sayfasına geçiş yapılıyor
                context.push('/AddCard');
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: const Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(8),
                          Text(
                            'Yeni Kart Ekle',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kredi / Banka Kartlarım',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(8),
              ],
            ),
          ),
          buildCard('assets/images/cards/akbank.png', '5555 ** ** 5555'),
          buildCard('assets/images/cards/kredi.png', '9999 ** ** 5555'),
          buildCard('assets/images/cards/visa.png', '8888 ** ** 5555'),
        ],
      );
  }

  Widget buildCard(String imagePath, String cardNumber) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Kart bilgileri görüntüleme işlevi buraya eklenebilir
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!, // Gölge rengi
                spreadRadius: 3, // Gölgenin yayılma yarıçapı
                blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                offset: const Offset(0, 3), // Gölgenin konumu (x, y)
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bonus Kartım',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Container(
                height: 1,
                color: Colors.black,
                margin: const EdgeInsets.only(bottom: 8),
              ),
              Row(
                children: [
                  Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardNumber,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}