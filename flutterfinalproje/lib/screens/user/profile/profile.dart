// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/responsive.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/selectedplaces.dart';
import 'package:flutterfinalproje/screens/user/profile/userblogs.dart';
//import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //String _aboutText = ''; // Başlangıç metni
  //TextEditingController _textEditingController = TextEditingController();

  Screen device = Screen.mobile;

  set isSearching(bool isSearching) {}

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        appBar: drawAppBar(),
        body: drawScreen(),
        bottomNavigationBar: drawBottom(),
      ),
    );
  }

  MyAppBar drawAppBar() {
    return MyAppBar(
      title: "PROFİL",
    );
  }

  Widget drawScreen() {
    switch (device) {
      case Screen.mobile:
        return profileMenu(context);
      case Screen.tablet:
        return blogsScr();
      case Screen.desktop:
        return selectedPlac();
    }
  }

  Widget drawBottom() {
    switch (device) {
      case Screen.mobile:
        return MyBottomNavBar();
      case Screen.tablet:
        return MyBottomNavBar();
      case Screen.desktop:
        return Container();
    }
  }

  // void _showEditDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Hakkımda Düzenle'),
  //         content: TextField(
  //           controller: _textEditingController,
  //           maxLength: 100,
  //           maxLines: null,
  //           decoration: const InputDecoration(
  //             hintText: 'Hakkımda...',
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               GoRouter.of(context).pop();
  //             },
  //             child: Text('İptal'),
  //           ),
  //           // TextButton(
  //           //   onPressed: () {
  //           //     setState(() {
  //           //       _aboutText = _textEditingController.text;
  //           //     });
  //           //     GoRouter.of(context).pop();
  //           //   },
  //           //   child: Text('Kaydet'),
  //           // ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
                  child: ListTile(
                    leading: Icon(Icons.camera_alt, size: 30),
                    title: Text('Fotoğraf Çek'),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo, size: 30),
                    title: Text('Fotoğraf Seç'),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text('Fotoğraf Sil',
                        style: TextStyle(color: Colors.red)),
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
                  child: ListTile(
                    leading: Icon(Icons.camera_alt, size: 30),
                    title: Text('Fotoğraf Çek'),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo, size: 30),
                    title: Text('Fotoğraf Seç'),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    // Kapak fotoğrafını silme işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text('Fotoğraf Sil',
                        style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
              Positioned(
                bottom: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    _showCoverPhotoOptionsDialog();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.6),
                    radius: 20,
                    child: Icon(Icons.add_a_photo, color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.45,
                  child: GestureDetector(
                    onTap: () {
                      _showImageOptionsDialog();
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage:
                          AssetImage("assets/images/profile/profile.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                 top: MediaQuery.of(context).size.height * 0.17,
        left: MediaQuery.of(context).size.width * 0.33,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Container(
                //     width: 400,
                //     height: 165,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(11),
                //       border: Border.all(
                //           width: 1, color: const Color.fromARGB(42, 0, 0, 0)),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Hakkımda...',
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 16,
                //                   fontFamily: 'poppions',
                //                 ),
                //               ),
                //               IconButton(
                //                 onPressed: _showEditDialog,
                //                 icon: Icon(Icons.edit, color: Colors.grey),
                //               ),
                //             ],
                //           ),
                //           Divider(thickness: 2),
                //           Text(
                //             _aboutText,
                //             style: TextStyle(
                //               color: Colors.grey,
                //               fontSize: 14,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                Gap(18),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.push('/Photographs');
                        },
                        child: ListTile(
                          leading: Icon(Icons.photo_camera, color: Colors.grey),
                          title: Text("Fotoğraflar",
                              style: TextStyle(fontFamily: 'poppions')),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/UserBlogs');
                        },
                        child: ListTile(
                          leading: Icon(Icons.save, color: Colors.grey),
                          title: Text("Bloglar",
                              style: TextStyle(fontFamily: 'poppions')),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/UserComments');
                        },
                        child: ListTile(
                          leading: Icon(Icons.mode_comment, color: Colors.grey),
                          title: Text("Yorumlar",
                              style: TextStyle(fontFamily: 'poppions')),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/PlaceToVisit');
                        },
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          leading:
                              Icon(Icons.location_city, color: Colors.grey),
                          title: Text(
                            "Gezilmek İstenilen Yerler",
                            style: TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Favorites');
                        },
                        child: ListTile(
                          leading: Icon(Icons.favorite, color: Colors.grey),
                          title: Text("Favoriler",
                              style: TextStyle(fontFamily: 'poppions')),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Achievemets');
                        },
                        child: ListTile(
                          leading:
                              Icon(Icons.military_tech, color: Colors.grey),
                          title: Text("Başarımlar",
                              style: TextStyle(fontFamily: 'poppions')),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                    ],
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
