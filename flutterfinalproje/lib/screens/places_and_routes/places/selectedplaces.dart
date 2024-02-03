// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class SelectedPlaces extends StatelessWidget {
  // static const Color backgroundColor = Color.fromRGBO(242, 224, 183, 1);
  const SelectedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: "Seçilen Mekanlar"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(50),
                        ), // Kenarların ovalleşme miktarını belirleyin
                        child: Image.asset(
                          'assets/images/placesImages/ortakoy.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10, // İkinci resmin yükseklik konumu
                      right: 30, // İkinci resmin yatay konumu
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/placesImages/ortakoy.jpeg', // İkinci resmin dosya yolu
                            fit: BoxFit.cover,
                            width: 100, // İkinci resmin genişliği
                            height: 90, // İkinci resmin yüksekliği
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120, 
                      right: 30, 
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/placesImages/ortakoy.jpeg', // İkinci resmin dosya yolu
                            fit: BoxFit.cover,
                            width: 100, 
                            height: 90, 
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240, 
                      right: 30, 
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/placesImages/ortakoy.jpeg', // İkinci resmin dosya yolu
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
              Padding(
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
                      "Ortaköy, Boğaziçi'nin Avrupa yakasında, Beşiktaş ilçesine bağlı mahalle ve semt. Ortaköy ve Mecidiye mahallelerinden oluşan Ortaköy semti, sahile açılan vadi boyunca yamaçlara kurulmuş bir yerleşmedir.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
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
                            SizedBox(
                              width: 3,
                            ),
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
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Yorumlar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
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
                      SizedBox(height: 5),
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
                          SizedBox(
                            width: 7,
                          ),
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
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
