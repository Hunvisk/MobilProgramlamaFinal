// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/selectedplaces.dart';
import 'package:flutterfinalproje/screens/user/profile/userblogs.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:flutterfinalproje/widgets/routescontainerdesign.dart';

import '../../../core/responsive.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return    routesSayfa(isSearching: isSearching, searchController: searchController);
      case (Screen.tablet):
       return   selectedPlac();
      case (Screen.desktop):
       return  blogsScr();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "ROTALAR",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "ROTALAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "ROTALAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}
drawBottom(){
     switch (device) {
      case (Screen.mobile):
       return  MyBottomNavBar();
      case (Screen.tablet):
       return MyBottomNavBar();
      case (Screen.desktop):
       return ;
     }
   }

  @override
  Widget build(BuildContext context) {
    // final ScreenOrientation = MediaQuery.of(context).orientation;
      setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return Scaffold(
      appBar: drawAppar(),
      bottomNavigationBar: drawBottom(),
      body: SingleChildScrollView(
        child: drawScreen(),
      ),
    );
  }
}

class routesSayfa extends StatelessWidget {
  const routesSayfa({
    super.key,
    required this.isSearching,
    required this.searchController,
  });

  final bool isSearching;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
