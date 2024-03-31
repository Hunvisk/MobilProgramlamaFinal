// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/selectedplaces.dart';
import 'package:flutterfinalproje/screens/user/profile/userblogs.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterfinalproje/widgets/routescontainerdesign.dart';
import '../../../core/responsive.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return favorilerSayfa(isSearching: isSearching, searchController: searchController) ;
      case (Screen.tablet):
       return   blogsScr();
      case (Screen.desktop):
       return  selectedPlac();
     }
   }
drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "FAVORİLER",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "FAVORİLER",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "FAVORİLER",icon: Icon(Icons.search),
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
        body: SingleChildScrollView(
          child:drawScreen(),
        ),
      ),
    );
  }
}

class favorilerSayfa extends StatelessWidget {
  const favorilerSayfa({
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
        FilterWidget(),
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

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  _showSortPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                child: Text(
                  'Sırala',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 4,
            ),
            VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 4,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  // Show the custom sorting popup
                  _showSortPopup2(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                child: Text('Filtrele',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the custom sorting popup
  void _showSortPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sırala',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('A - Z'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Z- A'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('En çok yorum'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('En çok beğeni'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Puanlama (artan)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Puanlama (azalan)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Semte göre (A - Z)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Semte göre (Z - A)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showSortPopup2(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Filtrele',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Z - A'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('A - Z'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
