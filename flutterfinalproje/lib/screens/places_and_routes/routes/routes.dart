// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:flutterfinalproje/widgets/routescontainerdesign.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarWithSearchIcon( 
        title: 'ROTALAR',
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },
      ),
      bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isSearching)
              Container(
                height: 32, // Arama çubuğu yüksekliği
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
                  },
                  onSubmitted: (value) {
                    // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
                  },
                  decoration: InputDecoration(
                    hintText: "Ara...",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4.0), // Dikey iç boşluk
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoutesContainerDesign(
                photo: "assets/images/routes/eminonu.jpeg",
                title: "Eminönü",
                puan: "5.0",
                visualization: "2024",
                comment: "32",
                durak: "9", // Durak sayısı
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoutesContainerDesign(
                photo: "assets/images/routes/ortakoy.jpeg",
                title: "Ortaköy",
                puan: "4.5",
                visualization: "1500",
                comment: "25",
                durak: "6", // Durak sayısı
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoutesContainerDesign(
                photo: "assets/images/routes/sariyer.jpeg",
                title: "Sarıyer",
                puan: "4.7",
                visualization: "1800",
                comment: "28",
                durak: "12", // Durak sayısı
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoutesContainerDesign(
                photo: "assets/images/routes/eminonu.jpeg",
                title: "Eminönü",
                puan: "5.0",
                visualization: "2024",
                comment: "32",
                durak: "9", // Durak sayısı
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoutesContainerDesign(
                photo: "assets/images/routes/camlica.jpeg",
                title: "Çamlıca Tepesi",
                puan: "4.2",
                visualization: "3200",
                comment: "78",
                durak: "15", // Durak sayısı
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoutesContainerDesign(
                photo: "assets/images/routes/kizKulesi.jpeg",
                title: "Kız Kulesi",
                puan: "3.9",
                visualization: "1293",
                comment: "22",
                durak: "3", // Durak sayısı
              ),
            ),
          ],
        ),
      ),
    );
  }
}
