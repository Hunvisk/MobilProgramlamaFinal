// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/responsive.dart';
import '../../../desktopScreens/user/account/desktopCardsİnfo.dart';
import '../../../tabletscreens.dart/user/account/tabletcardsinfo.dart';

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
       return tabletCardsInfo();

      case (Screen.desktop):
       return desktopCardsInfo();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "KAYITLI KARTLARIM",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "KAYITLI KARTLARIM",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "KAYITLI KARTLARIM",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}
//drawBottom(){
//     switch (device) {
//      case (Screen.mobile):
//       return  MyBottomNavBar();
//      case (Screen.tablet):
//      return MyBottomNavBar();
//      case (Screen.desktop):
//       return ;
//     }
//   }


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
                      offset: Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
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
            padding: EdgeInsets.all(16),
            child: Column(
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
                offset: Offset(0, 3), // Gölgenin konumu (x, y)
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bonus Kartım',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              Container(
                height: 1,
                color: Colors.black,
                margin: EdgeInsets.only(bottom: 8),
              ),
              Row(
                children: [
                  Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                  ),
                  Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardNumber,
                        style: TextStyle(
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