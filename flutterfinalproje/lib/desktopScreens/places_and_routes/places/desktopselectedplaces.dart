// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DesktopSelectedPlaces extends StatelessWidget {
  const DesktopSelectedPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(20),
            Text("SEÇİLEN MEKANLAR SAYFASI", textAlign: TextAlign.center),
            Gap(20),
            DesktopSelectedPlacesScreen(),
          ],
        ),
      ),
     
    );
  }
}

class DesktopSelectedPlacesScreen extends StatelessWidget {
  const DesktopSelectedPlacesScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/images/places/galata.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 350,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/places/galata.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/places/galata.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 220,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/places/galata.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Açıklama",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "İstanbul’un biriciği Galata Kulesi; bazıları insan hayal gücünün eseri, bazıları da tarihi belgelerle kanıtlamış hikayeleriyle pek meşhur. İstanbul silüetine gizemli bir hava katan Galata Kulesi’nin hikayelerine, İhsan Oktay Anar’ın Puslu Kıtalar Atlası kitabından bir örnekle başlayalım. Kitapta, İstanbul’a ilk kez gelen denizci Cenevizlilere, ak martının karanlıkta yol gösterdiği anlatılır. İnançlarının bir tezahürü olarak martıyı Hz İsa ile özdeşleştiren Cenevizliler, onu yuvasına kadar takip ettikten sonra yakalar, pişirir ve yerler. Yuvasının bulunduğu yere de onun hatırası için Galata Kulesini inşa ederler.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppions',
                    fontSize: 13,
                  ),
                ),
                Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mekan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Beşiktaş",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 15,
                        ),
                        Gap(3),
                        Text(
                          "5.600",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppions',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppions',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(20),
                Text(
                  "Yorumlar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppions',
                    fontSize: 20,
                  ),
                ),
                Gap(6),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 22,
                            ),
                            Text(
                              "İlknur Kavaklı",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppions',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            Text(
                              "Muhteşem yer mutlaka gitmelisiniz",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppions',
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "50",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppions',
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.mode_comment,
                              size: 18,
                            ),
                            Gap(7),
                            Text(
                              "50",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppions',
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              size: 18,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
