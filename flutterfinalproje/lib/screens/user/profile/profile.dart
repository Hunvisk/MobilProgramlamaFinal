// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _aboutText = ' '; // Başlangıç metni
  TextEditingController _textEditingController = TextEditingController();

  void _showEditDialog() {
    // Pop-up'ı gösteren fonksiyon
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hakkımda Düzenle'), // Pop-up başlığı
          content: TextField(
            // TextField, kullanıcının metni düzenlemesini sağlar
            controller: _textEditingController,
            maxLength: 100, // Metnin maksimum uzunluğu
            maxLines: null, // Birden fazla satır girişine izin verilir
            decoration: InputDecoration(
              hintText: 'Hakkımda...', // Boş alan için ipucu metni
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // İptal butonu, pop-up'ı kapatır
              },
              child: Text('İptal'), // İptal butonunun metni
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _aboutText = _textEditingController.text; // Metni güncelle
                });
                Navigator.pop(context); // Kaydet butonu, pop-up'ı kapatır
              },
              child: Text('Kaydet'), // Kaydet butonunun metni
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: "PROFİL"),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/profile/profile.png"),
                      radius: 50,
                    ),
                    SizedBox(width: 7),
                    Column(
                      children: [
                        Text(
                          "İlknur Kavaklı",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Ultra Pro Gezgin",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
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
                  SizedBox(height: 18),
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
                              Navigator.pushNamed(context, '/Photographs');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.photo_camera_back,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Fotoğraf",
                                        style: TextStyle(
                                          fontFamily: 'poppions',
                                        )),
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
                              Navigator.pushNamed(context, '/UserBlogs');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.save_outlined,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text(
                                      "Bloglar",
                                      style: TextStyle(
                                        fontFamily: 'poppions',
                                      ),
                                    ),
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
                              Navigator.pushNamed(context, '/UserComments');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.mode_comment,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Yorumlar",
                                        style: TextStyle(
                                          fontFamily: 'poppions',
                                        )),
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
                              Navigator.pushNamed(context, '/PlaceToVisit');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_city,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Gezilmek İstenilenler",
                                        style: TextStyle(
                                          fontFamily: 'poppions',
                                        )),
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
                              Navigator.pushNamed(context, '/Favorites');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Favoriler",
                                        style: TextStyle(
                                          fontFamily: 'poppions',
                                        )),
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
                              Navigator.pushNamed(context, '/Achievemets');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.military_tech,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Başarımlar",
                                        style: TextStyle(
                                          fontFamily: 'poppions',
                                        )),
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
          ],
        ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
