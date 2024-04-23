// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DesktopProfile extends StatelessWidget {
  const DesktopProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'PROFİL',
      ),
      body: Center(
        child: Text("PROFİL SAYFASI"),
      ),
     
    );
  }
}

class DesktopProfileScreen extends StatelessWidget {
  void _showImageOptionsDialog(BuildContext context) {
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

  void _showCoverPhotoOptionsDialog(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileMenu(context),
    );
  }

  Column profileMenu(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 350, // Yükseklik artırıldı
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
                    child: Icon(Icons.add_a_photo, color: Colors.white),
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
                  child: CircleAvatar(
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
                    Text(
                      "İlknur Kavaklı",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24, // Yazı boyutu artırıldı
                      ),
                    ),
                    Text(
                      "Ultra Pro Gezgin",
                      style: TextStyle(
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
