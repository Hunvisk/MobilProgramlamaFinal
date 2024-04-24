// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/user/profile/desktopblogs.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/user/profile/tabletuserblogs.dart';

void main() {
  runApp(UserBlogs());
}
class UserBlogs extends StatefulWidget {
  const UserBlogs({Key? key}) : super(key: key);

  @override
  _UserBlogState createState() => _UserBlogState();
}

class _UserBlogState extends State<UserBlogs> {
  Screen device = Screen.mobile;
  
  set isSearching(bool isSearching) {}

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return   blogsScr();
      case (Screen.tablet):
       return TabletUserBlogsScreen();
      case (Screen.desktop):
       return   DesktopUserBlogsScreen();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(          title: AppLocalizations.of(context).getTranslate("blogs"),

        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon( title: AppLocalizations.of(context).getTranslate("blogs"),icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon( title: AppLocalizations.of(context).getTranslate("blogs"),icon: Icon(Icons.search),
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
    setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return SafeArea(
      child: Scaffold(
        appBar: drawAppar(),
        body: SingleChildScrollView(
          child: drawScreen(),
        ),
        bottomNavigationBar: drawBottom(),
      ),
    );
  }
}

class blogsScr extends StatelessWidget {
  const blogsScr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/routes/ortakoy.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/ortakoy.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/ortakoy.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 240, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/ortakoy.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                        ),
                        Gap(5),
                        Text(
                          "Eda Aydın",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Gap(20),
                    Column(
                      children: [
                        Text(
                            AppLocalizations.of(context)
                        .getTranslate("blogs_text"),
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up,
                                    ),
                                  ),
                                  Text("100"),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.comment,
                                    ),
                                  ),
                                  Text("100"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/routes/sariyer.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/sariyer.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/sariyer.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                        ),
                        Gap(5),
                        Text(
                          "Eda Aydın",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Gap(20),
                    Text(
                                   AppLocalizations.of(context)
                        .getTranslate("blogs_text1"),                      style: TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                              ),
                              Text("100"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.comment,
                                ),
                              ),
                              Text("100"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/routes/eminonu.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 240, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 50, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                        ),
                        Gap(5),
                        Text(
                          "Eda Aydın",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Gap(20),
                    Text(
                           AppLocalizations.of(context)
                        .getTranslate("blogs_text2"),   
                      style: TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                              ),
                              Text("100"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.comment,
                                ),
                              ),
                              Text("100"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
