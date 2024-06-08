// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print, sized_box_for_whitespace

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/localizations.dart';
import 'package:flutterfinalproje/core/responsive.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

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
  String size = "";
  MemoryImage? currentAvatar;
  String? currentCoverPhoto;

  profileIfYouLoad() async {
    final Directory appCacheDir = await getApplicationCacheDirectory();
    final avatarDir = Directory("${appCacheDir.path}/avatar");
    if (avatarDir.existsSync()) {
      final files = avatarDir.listSync();
      if (files.isNotEmpty) {
        File f = File(files.first.path);
        var bytes = f.readAsBytesSync();
        setState(() {
          currentAvatar = MemoryImage(bytes);
        });
      }
    }
  }

  coverPhotoLoad() async {
    final Directory appCacheDir = await getApplicationCacheDirectory();
    final coverPhotoDir = Directory("${appCacheDir.path}/coverphoto");
    if (coverPhotoDir.existsSync()) {
      final files = coverPhotoDir.listSync();
      if (files.isNotEmpty) {
        // File f = File(files.first.path);
        // var bytes = f.readAsBytesSync();
        setState(() {
          currentCoverPhoto = files.first.path;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    profileIfYouLoad();
    coverPhotoLoad();
  }

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
        return const TabletProfileScreen();
      case Screen.desktop:
        return const DesktopProfileScreen();
    }
  }

  Future<void> profilePhotoUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? selectedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (selectedFile == null) {
        setState(() {
          file = null;
        });
        return;
      }

      var fileFormat = selectedFile.name.split(".").last;

      bool makeSmall = false;

      switch (fileFormat.toLowerCase()) {
        case ("jpg"):
        case ("jpeg"):
        case ("png"):
        case ("bmp"):
        case ("tiff"):
        case ("ico"):
        case ("gif"):
          makeSmall = true;
      }

      if (!makeSmall) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Türü"),
            content: Text(
              "Seçtiğiniz dosya, dosya türünü desteklemiyor!!",
            ),
          ),
        );
        return;
      }

      img.Image? temp;
      if (fileFormat.toLowerCase() == "jpg" ||
          fileFormat.toLowerCase() == "jpeg") {
        temp = img.decodeJpg(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "png") {
        temp = img.decodePng(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "bmp") {
        temp = img.decodeBmp(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "tiff") {
        temp = img.decodeTiff(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "ico") {
        temp = img.decodeIco(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "gif") {
        temp = img.decodeGif(File(selectedFile.path).readAsBytesSync());
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Formati"),
            content: Text(
              "Dosya Formati JPG, BMP, GIF, PNG, TIFF olabilir.",
            ),
          ),
        );
        return;
      }

      if (temp!.width < 500 || temp.height < 500) {
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Boyutu"),
            content: Text(
              "Seçtiğiniz dosya boyutları çok küçük. En az 500px yükseklik ve genişlik gerekmektedir.",
            ),
          ),
        );
        return;
      }

      img.Image thumbnail;
      if (temp.width >= temp.height) {
        thumbnail = img.copyResize(temp, width: 500);
      } else {
        thumbnail = img.copyResize(temp, height: 500);
      }

      final resizedFileData = img.encodeJpg(thumbnail, quality: 85);

      final Directory appCacheDir = await getApplicationCacheDirectory();

      final avatarDir = Directory("${appCacheDir.path}/avatar");
      if (avatarDir.existsSync()) {
        final files = avatarDir.listSync();
        if (files.isNotEmpty) {
          for (var element in files) {
            File(element.path).deleteSync();
          }
        }
      } else {
        avatarDir.createSync();
      }

      File newFile =
          File("${appCacheDir.path}/avatar/avatar.${fileFormat.toLowerCase()}");
      newFile.writeAsBytesSync(resizedFileData);

      setState(() {
        file = newFile;
        currentAvatar = MemoryImage(resizedFileData);
        size = "${temp!.width}x${temp.height}";
      });
    } catch (e) {
      print("Hata Oluştu: $e");
    }
  }

  // Future<void> coverrrPhotoUpdate() async {
  //   try {
  //     ImagePicker picker = ImagePicker();
  //     XFile? selectedCoverPhotoFile =
  //         await picker.pickImage(source: ImageSource.gallery);
  //     if (selectedCoverPhotoFile != null) {
  //       setState(() {
  //         coverPhoto = File(selectedCoverPhotoFile.path);
  //       });
  //     }
  //   } catch (e) {
  //     print("Hata Oluştu: $e");
  //   }
  // }

  Future<void> coverPhotoUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? selectedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (selectedFile == null) {
        setState(() {
          file = null;
        });
        return;
      }

      var fileFormat = selectedFile.name.split(".").last;

      bool makeSmall = false;

      switch (fileFormat.toLowerCase()) {
        case ("jpg"):
        case ("jpeg"):
        case ("png"):
        case ("bmp"):
        case ("tiff"):
        case ("ico"):
        case ("gif"):
          makeSmall = true;
      }

      if (!makeSmall) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Türü"),
            content: Text(
              "Seçtiğiniz dosya, dosya türünü desteklemiyor!!",
            ),
          ),
        );
        return;
      }

      img.Image? temp;

      if (fileFormat.toLowerCase() == "jpg" ||
          fileFormat.toLowerCase() == "jpeg") {
        temp = img.decodeJpg(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "png") {
        temp = img.decodePng(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "bmp") {
        temp = img.decodeBmp(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "tiff") {
        temp = img.decodeTiff(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "ico") {
        temp = img.decodeIco(File(selectedFile.path).readAsBytesSync());
      } else if (fileFormat.toLowerCase() == "gif") {
        temp = img.decodeGif(File(selectedFile.path).readAsBytesSync());
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Formati"),
            content: Text(
              "Dosya Formati JPG, BMP, GIF, PNG, TIFF olabilir.",
            ),
          ),
        );
        return;
      }

      if (temp!.width < 1000 || temp.height < 400) {
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Boyutu"),
            content: Text(
              "Seçtiğiniz dosya boyutları çok küçük. En az 1000px genişlik ve 400px yükseklik gerekmektedir.",
            ),
          ),
        );
        return;
      }

      img.Image thumbnail;
      if (temp.width >= temp.height) {
        thumbnail = img.copyResize(temp, width: 1000);
      } else {
        thumbnail = img.copyResize(temp, height: 400);
      }

      final resizedFileData = img.encodeJpg(thumbnail, quality: 85);

      final Directory appCacheDir = await getApplicationCacheDirectory();

      final coverPhotoDir = Directory("${appCacheDir.path}/coverphoto");
      if (coverPhotoDir.existsSync()) {
        final files = coverPhotoDir.listSync();
        if (files.isNotEmpty) {
          for (var element in files) {
            File(element.path).deleteSync();
          }
        }
      } else {
        coverPhotoDir.createSync();
      }

      var rng = Random();

      final x = 1000 + rng.nextInt(8999);
      File newFile = File(
          "${appCacheDir.path}/coverphoto/cover$x.${fileFormat.toLowerCase()}");
      newFile.writeAsBytesSync(resizedFileData);

      setState(() {
        currentCoverPhoto = null;
      });
      setState(() {
        file = newFile;
        currentCoverPhoto =
            "${appCacheDir.path}/coverphoto/cover$x.${fileFormat.toLowerCase()}";
        size = "${temp!.width}x${temp.height}";
      });
    } catch (e) {
      print("Hata Oluştu: $e");
    }
  }

  void deleteProfilePhoto() async {
    final Directory appCacheDir = await getApplicationCacheDirectory();

    final avatarDir = Directory("${appCacheDir.path}/avatar");
    if (avatarDir.existsSync()) {
      final files = avatarDir.listSync();
      if (files.isNotEmpty) {
        for (var element in files) {
          File(element.path).deleteSync();
        }
      }
    }

    setState(() {
      file = null;
      currentAvatar = null;
      size = ""; // Reset the size variable
    });
  }

  void deleteCoverPhoto() async {
    final Directory appCacheDir = await getApplicationCacheDirectory();

    final avatarDir = Directory("${appCacheDir.path}/coverphoto");
    if (avatarDir.existsSync()) {
      final files = avatarDir.listSync();
      if (files.isNotEmpty) {
        for (var element in files) {
          File(element.path).deleteSync();
        }
      }
    }

    setState(() {
      file = null;
      currentCoverPhoto = null;
      size = ""; // Reset the size variable
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
                const Gap(20),
                GestureDetector(
                  onTap: () async {
                    await profilePhotoUpdate();
                    Navigator.of(context)
                        .pop(); // Close the dialog after the operation
                  },
                  child: ListTile(
                    leading: const Icon(Icons.photo, size: 30),
                    title: Text(AppLocalizations.of(context)
                        .getTranslate("select_a_photo")),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    deleteProfilePhoto();
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading:
                        const Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text(
                      AppLocalizations.of(context)
                          .getTranslate("delete_the_photo"),
                      style: const TextStyle(color: Colors.red),
                    ),
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
                const Gap(20),
                GestureDetector(
                  onTap: () async {
                    coverPhotoUpdate(); // Galeriden fotoğraf seçme işlemi
                    Navigator.of(context).pop(); // Dialogu kapat
                  },
                  child: ListTile(
                    leading: const Icon(Icons.photo, size: 30),
                    title: Text(AppLocalizations.of(context)
                        .getTranslate("select_a_photo")),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    deleteCoverPhoto();
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading:
                        const Icon(Icons.delete, size: 30, color: Colors.red),
                    title: Text(
                      AppLocalizations.of(context)
                          .getTranslate("delete_the_photo"),
                      style: const TextStyle(color: Colors.red),
                    ),
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: currentCoverPhoto != null
                    ? Image.file(
                        File(currentCoverPhoto!),
                        width: double.infinity,
                        height: 300, // Sabit yükseklik
                        fit: BoxFit.cover,
                      )
                    : Container(
                        // color: Colors.grey, // Arka plan rengi
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
                  child: const CircleAvatar(
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
                      backgroundImage: currentAvatar,
                      child: currentAvatar == null
                          ? const Icon(Icons.person,
                              size: 50, color: Colors.white)
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
                    const Text(
                      "Talha Pamukcu",
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
                          context.push('/AddInformations');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.person, color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context)
                                .getTranslate("account_information"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Photographs');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.photo_camera,
                              color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context).getTranslate("photos"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/UserBlogs');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.save, color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context).getTranslate("blog"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/UserComments');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.mode_comment,
                              color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context)
                                .getTranslate("comments"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Saved');
                        },
                        child: ListTile(
                          leading:
                              const Icon(Icons.bookmark, color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context).getTranslate("saved"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey),
                        ),
                      ),
                      const Divider(thickness: 3),
                      InkWell(
                        onTap: () {
                          context.push('/Achievemets');
                        },
                        child: ListTile(
                          leading: const Icon(Icons.military_tech,
                              color: Colors.grey),
                          title: Text(
                            AppLocalizations.of(context)
                                .getTranslate("achievemets"),
                            style: const TextStyle(fontFamily: 'poppions'),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey),
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
