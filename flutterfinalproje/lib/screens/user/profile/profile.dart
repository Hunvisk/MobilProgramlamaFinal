// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, library_private_types_in_public_api, sized_box_for_whitespace, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/localizations.dart';
import 'package:flutterfinalproje/core/responsive.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../desktopScreens/user/profile/desktopprofile.dart';
import '../../../tabletscreens.dart/user/profile/tabletprofile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Screen device = Screen.mobile;
  File? file;
  File? coverPhoto;
  

  @override
  Widget build(BuildContext context) {
    device = detectScreen(MediaQuery.of(context).size);

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
        return TabletProfileScreen();
      case Screen.desktop:
        return DesktopProfileScreen();
    }
  }

  Future<void> profilePhotoUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? selectedFile = await picker.pickImage(source: ImageSource.gallery);
      if (selectedFile != null) {
        setState(() {
          file = File(selectedFile.path);
        });
      }
    } catch (e) {
      print("Hata Oluştu: $e");
    }
  }

  Future<void> coverPhotoUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? selectedCoverPhotoFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (selectedCoverPhotoFile != null) {
        setState(() {
          coverPhoto = File(selectedCoverPhotoFile.path);
        });
      }
    } catch (e) {
      print("Hata Oluştu: $e");
    }
  }

  void deleteProfilePhoto() {
    setState(() {
      file = null;
    });
  }

  void deleteCoverPhoto() {
  setState(() {
    coverPhoto = null;
  });
}


  void _showImageOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)
              .getTranslate("change_profile_photo")),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                
                Gap(20),
                GestureDetector(
                  onTap: () async {
                    await profilePhotoUpdate();
                    Navigator.of(context)
                        .pop(); // Close the dialog after the operation
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo, size: 30),
                    title: Text(AppLocalizations.of(context)
                        .getTranslate("select_a_photo")),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    deleteProfilePhoto();
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text(
                        AppLocalizations.of(context)
                            .getTranslate("delete_the_photo"),
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
          title: Text(
              AppLocalizations.of(context).getTranslate("change_cover_photo")),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Gap(20),
                GestureDetector(
                  onTap: () async {
                    await coverPhotoUpdate(); // Galeriden fotoğraf seçme işlemi
                    Navigator.of(context).pop(); // Dialogu kapat
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo, size: 30),
                    title: Text(AppLocalizations.of(context)
                        .getTranslate("select_a_photo")),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    deleteCoverPhoto();
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text(
                        AppLocalizations.of(context)
                            .getTranslate("delete_the_photo"),
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
  child: coverPhoto != null
      ? Image.file(
          coverPhoto!,
          width: double.infinity,
          height: 300, // Sabit yükseklik
          fit: BoxFit.cover,
        )
      : Container(
          color: Colors.grey, // Arka plan rengi
          width: double.infinity,
          height: 300, // Sabit yükseklik
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
                      backgroundImage: file != null
                          ? FileImage(file!)
                          : null, 
                      child: file == null
                          ? Icon(Icons.person, size: 50, color: Colors.white)
                          : null,
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
                              fontFamily: 'poppions',
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
                          title: Text(
                              AppLocalizations.of(context).getTranslate("blog"),
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
                          title: Text(
                              AppLocalizations.of(context)
                                  .getTranslate("comments"),
                              style: TextStyle(fontFamily: 'poppions')),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                      Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Saved');
                        },
                        child: ListTile(
                          leading: Icon(Icons.bookmark, color: Colors.grey),
                          title: Text(
                              AppLocalizations.of(context)
                                  .getTranslate("saved"),
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
                          title: Text(
                              AppLocalizations.of(context)
                                  .getTranslate("achievemets"),
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
