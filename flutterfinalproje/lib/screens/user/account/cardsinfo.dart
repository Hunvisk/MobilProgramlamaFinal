// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
void main() {
  runApp(CardsInfo());
}

class CardsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: MyAppBar(title: "KAYITLI KART"),
          body: CardPage(),
          bottomNavigationBar: MyBottomNavBar(),
        ),
      ),
    );
  }
}

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Add your onTap functionality here
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 8),
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
              SizedBox(height: 8),
            ],
          ),
        ),
        buildCard('assets/images/cards/akbank.png', '5555 **** **** 5555'),
        buildCard('assets/images/cards/kredi.png', '9999 **** **** 5555'),
        buildCard('assets/images/cards/visa.png', '8888 **** **** 5555'),
      ],
    );
  }

  Widget buildCard(String imagePath, String cardNumber) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Add your onTap functionality here
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
            ),
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
              SizedBox(height: 8),
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
                  SizedBox(width: 16),
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