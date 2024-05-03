// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/localizations.dart';
import 'package:flutterfinalproje/core/responsive.dart';
//import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../desktopScreens/user/profile/desktopprofile.dart';
import '../../../tabletscreens.dart/user/profile/tabletprofile.dart';

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
        //bottomNavigationBar: drawBottom(),
      ),
    );
  }

  MyAppBar drawAppBar() {
    return MyAppBar(
      title: AppLocalizations.of(context).getTranslate("Profile"),
    );
  }

  Widget drawScreen() {
    switch (device) {
      case Screen.mobile:
        return profileMenu(context);
      case Screen.tablet:
        return TabletProfileScreen();
      case Screen.desktop:
        return DesktopProfileScreen();
    }
  }

  //Widget drawBottom() {
  //  switch (device) {
  //    case Screen.mobile:
  //      return MyBottomNavBar();
  //    case Screen.tablet:
  //      return MyBottomNavBar();
  //    case Screen.desktop:
  //      return Container();
  //  }
  //}

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
          title: Text(AppLocalizations.of(context).getTranslate("change_profile_photo")),
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
                    title: Text(AppLocalizations.of(context).getTranslate("take_a_photo")),
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
                    title: Text(AppLocalizations.of(context).getTranslate("select_a_photo")),
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
                    title: Text(AppLocalizations.of(context).getTranslate("delete_the_photo"),
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
          title: Text(AppLocalizations.of(context).getTranslate("change_cover_photo")),
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
                    title: Text(AppLocalizations.of(context).getTranslate("take_a_photo")),
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
                    title: Text(AppLocalizations.of(context).getTranslate("select_a_photo"),),
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
                    title: Text(AppLocalizations.of(context).getTranslate("delete_the_photo"),
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
                      AppLocalizations.of(context)
                          .getTranslate("ultra_pro_traveler"),
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
                          title: Text(
                            AppLocalizations.of(context).getTranslate("photos"),
                            style: TextStyle(
                              fontFamily:'poppions', // Her iki yerde de aynı yazı tipini kullanmak için 'poppions' kullanıldı
                              
                            ),
                          ),
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
                          title: Text(AppLocalizations.of(context).getTranslate("blog"),
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
                          title: Text(AppLocalizations.of(context).getTranslate("comments"),
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
                            AppLocalizations.of(context).getTranslate("place_to_visit"),
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
                          title: Text(AppLocalizations.of(context).getTranslate("favorites"),
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
                          title: Text(AppLocalizations.of(context).getTranslate("achievemets"),
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