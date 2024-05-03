import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';

class TabletProfile extends StatelessWidget {
  const TabletProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'PROFİL',
      ),
      body: const Center(
        child: Text("PROFİL SAYFASI"),
      ),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class TabletProfileScreen extends StatelessWidget {
  const TabletProfileScreen({super.key});

  void _showImageOptionsDialog(BuildContext context) {
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

  void _showCoverPhotoOptionsDialog(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileMenu(context),
    );
  }

  Column profileMenu(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 350, // Yükseklik artırıldı
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
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    _showCoverPhotoOptionsDialog(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.6),
                    radius: 20,
                    child: const Icon(Icons.add_a_photo, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.25, // Yukarıya kaydırıldı
                left: MediaQuery.of(context).size.width * 0.45,
                child: GestureDetector(
                  onTap: () {
                    _showImageOptionsDialog(context);
                  },
                  child: const CircleAvatar(
                    radius: 70, // Daha büyük hale getirildi
                    backgroundImage:
                        AssetImage("assets/images/profile/profile.png"),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.35, // Yukarıya kaydırıldı
                left: MediaQuery.of(context).size.width * 0.33,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Yatayda ortala
                  children: [
                    const Text(
                      "İlknur Kavaklı",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24, // Yazı boyutu artırıldı
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)
                          .getTranslate("ultra_pro_traveler"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14, // Yazı boyutu artırıldı
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
                          context.push('/PlaceToVisit');
                        },
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          leading:
                              const Icon(Icons.location_city, color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context).getTranslate("place_to_visit"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Favorites');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.favorite, color: Colors.grey),
                          title: Text(AppLocalizations.of(context).getTranslate("favorites"),
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