// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_print, sized_box_for_whitespace
// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class ProfileScreen extends StatelessWidget {
  // static const Color backgroundColor = Color.fromRGBO(242, 224, 183, 1);
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "PROFİL"),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                       AssetImage("assets/images/profile/profile.png"),
                    radius: 60,
                  ),
                  SizedBox(height: 7),
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
            height: 35,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/AboutUsScreen');
                                  // Buraya tıklama işlemlerinizi ekleyin
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.info, color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text(
                                      'Hakkımda', // Burada metni belirle
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                            ],
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/Achievemets');
                              // Buraya tıklama işlemlerinizi ekleyin
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.military_tech,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text(
                                      'Başarımlar', // Burada metni belirle
                                    ),
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
                  SizedBox(height: 25),
                  Container(
                    width: 250,
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
                              Navigator.pushNamed(
                                  context, '/PhotographsScreen');
                              // Buraya tıklama işlemlerinizi ekleyin
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.photo_camera_back,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Fotoğraf"),
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
                              Navigator.pushNamed(context, '/BlogsScreen');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.save_outlined,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Bloglar"),
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
                              Navigator.pushNamed(context, '/CommentsScreen');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.mode_comment,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Yorumlar"),
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
                              Navigator.pushNamed(
                                  context, '/VisitPlacesScreen');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_city,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Gezilmek İstenilenler"),
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
                              Navigator.pushNamed(
                                  context, '/FavoritesScreen');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text("Favoriler"),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
