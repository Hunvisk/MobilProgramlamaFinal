
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../desktopScreens/user/profile/desktopprofile.dart';
import '../../../tabletscreens.dart/user/profile/tabletprofile.dart';
import '../../../widgets/myappbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
        return const TabletProfileScreen();
      case Screen.desktop:
        return const DesktopProfileScreen();
    }
  }

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
                    leading: const Icon(Icons.camera_alt, size: 30),
                    title: Text(AppLocalizations.of(context).getTranslate("take_a_photo")),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: const Icon(Icons.photo, size: 30),
                    title: Text(AppLocalizations.of(context).getTranslate("select_a_photo")),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: const Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text(AppLocalizations.of(context).getTranslate("delete_the_photo"),
                        style: const TextStyle(color: Colors.red)),
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
                    leading: const Icon(Icons.camera_alt, size: 30),
                    title: Text(AppLocalizations.of(context).getTranslate("take_a_photo")),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    // Galeri açılacak işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: const Icon(Icons.photo, size: 30),
                    title: Text(AppLocalizations.of(context).getTranslate("select_a_photo"),),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    // Kapak fotoğrafını silme işlemleri buraya ekleyin
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: const Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text(AppLocalizations.of(context).getTranslate("delete_the_photo"),
                        style: const TextStyle(color: Colors.red)),
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
        SizedBox(
          width: double.infinity,
          height: 230,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
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
                    child: const Icon(Icons.add_a_photo, color: Colors.white),
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
                    child: const CircleAvatar(
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
                    const Text(
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
                      style: const TextStyle(
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
                const Gap(18),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.push('/Photographs');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.photo_camera, color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context).getTranslate("photos"),
                            style: const TextStyle(
                              fontFamily:'poppions', // Her iki yerde de aynı yazı tipini kullanmak için 'poppions' kullanıldı
                              
                            ),
                          ),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/UserBlogs');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.save, color: Colors.grey),
                          title: Text(AppLocalizations.of(context).getTranslate("blog"),
                              style: const TextStyle(fontFamily: 'poppions')),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/UserComments');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.mode_comment, color: Colors.grey),
                          title: Text(AppLocalizations.of(context).getTranslate("comments"),
                              style: const TextStyle(fontFamily: 'poppions')),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Saved');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.bookmark, color: Colors.grey),
                          title: Text(AppLocalizations.of(context).getTranslate("saved"),
                              style: const TextStyle(fontFamily: 'poppions')),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Achievemets');
                        },
                        child: ListTile(
                          leading:
                              const Icon(Icons.military_tech, color: Colors.grey),
                          title: Text(AppLocalizations.of(context).getTranslate("achievemets"),
                              style: const TextStyle(fontFamily: 'poppions')),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
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