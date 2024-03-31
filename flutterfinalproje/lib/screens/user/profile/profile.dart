// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, library_private_types_in_public_api, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/responsive.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/selectedplaces.dart';
import 'package:flutterfinalproje/screens/user/profile/userblogs.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';

import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _aboutText = ' '; // Başlangıç metni
  TextEditingController _textEditingController = TextEditingController();

Screen device = Screen.mobile;

  set isSearching(bool isSearching) {}

drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return profileMenu(context);
      case (Screen.tablet):
        return blogsScr();
      case (Screen.desktop):
        return selectedPlac();
    }
  }
drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "PROFİL",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "PROFİL",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "PROFİL",icon: Icon(Icons.search),
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
  void _showEditDialog() {
    // Pop-up'ı gösteren fonksiyon
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hakkımda Düzenle'), // Pop-up başlığı
          content: TextField(
            controller: _textEditingController,
            maxLength: 100, // Metnin maksimum uzunluğu
            maxLines: null, // Birden fazla satır girişine izin verilir
            decoration: InputDecoration(
              hintText: 'Hakkımda...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop(); // İptal butonu, pop-up'ı kapatır
              },
              child: Text('İptal'), // İptal butonunun metni
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _aboutText = _textEditingController.text; // Metni güncelle
                });
                GoRouter.of(context).pop(); // Kaydet butonu, pop-up'ı kapatır
              },
              child: Text('Kaydet'), // Kaydet butonunun metni
            ),
          ],
        );
      },
    );
  }

  void _showImageOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profil Fotoğrafını Değiştir'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    // Kamera açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fotoğraf Çek'),
                      Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fotoğraf Seç'),
                      Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fotoğraf Sil',
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCoverPhotoOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kapak Fotoğrafını Değiştir'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    // Kamera açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fotoğraf Çek'),
                      Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fotoğraf Seç'),
                      Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Kapak fotoğrafını silme işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fotoğraf Sil',
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return SafeArea(
      child: Scaffold(
        appBar: drawAppar(),
        body: drawScreen(),
        bottomNavigationBar:drawBottom(),
      ),
    );
  }

  Column profileMenu(BuildContext context) {
    return Column(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/profile/travell.jpeg",
                    width: double.infinity,
                    height: 300, // Sabit yükseklik
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showCoverPhotoOptionsDialog(); // Resmi değiştirme fonksiyonu çağrılıyor
                  },
                  child: Stack(
                    alignment: Alignment
                        .bottomRight, // İkonun sağ alt köşede olmasını sağlar
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              _showImageOptionsDialog(); // Resmi değiştirme fonksiyonu çağrılıyor
                            },
                            child: Stack(
                              alignment: Alignment
                                  .bottomRight, // İkonun sağ alt köşede olmasını sağlar
                              children: [
                                CircleAvatar(
                                  radius: 45,
                                  backgroundImage: AssetImage(
                                      "assets/images/profile/profile.png"),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(7),
                      Column(
                        children: [
                          Text(
                            "İlknur Kavaklı",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Ultra Pro Gezgin",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                          width: 1, color: const Color.fromARGB(42, 0, 0, 0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Hakkımda...',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'poppions',
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: _showEditDialog,
                                          icon: Icon(Icons.edit,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Text(
                                      _aboutText,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                          width: 1, color: Color.fromARGB(42, 0, 0, 0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context.push('/Photographs');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.photo_camera_back,
                                        color: Colors.grey),
                                    Gap(5),
                                    Text("Fotoğraf",
                                        style:
                                            TextStyle(fontFamily: 'poppions')),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              context.push('/UserBlogs');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.save_outlined,
                                        color: Colors.grey),
                                    Gap(5),
                                    Text("Bloglar",
                                        style:
                                            TextStyle(fontFamily: 'poppions')),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              context.push('/UserComments');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.mode_comment,
                                        color: Colors.grey),
                                    Gap(5),
                                    Text("Yorumlar",
                                        style:
                                            TextStyle(fontFamily: 'poppions')),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              context.push('/PlaceToVisit');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_city,
                                        color: Colors.grey),
                                    Gap(5),
                                    Text("Gezilmek İstenilenler",
                                        style:
                                            TextStyle(fontFamily: 'poppions')),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              context.push('/Favorites');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border,
                                        color: Colors.grey),
                                    Gap(5),
                                    Text("Favoriler",
                                        style:
                                            TextStyle(fontFamily: 'poppions')),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              context.push('/Achievemets');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.military_tech,
                                        color: Colors.grey),
                                    Gap(5),
                                    Text("Başarımlar",
                                        style:
                                            TextStyle(fontFamily: 'poppions')),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
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
