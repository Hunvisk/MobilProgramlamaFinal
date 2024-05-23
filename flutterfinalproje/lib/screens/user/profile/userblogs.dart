
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../desktopScreens/user/profile/desktopblogs.dart';
import '../../../tabletscreens.dart/user/profile/tabletuserblogs.dart';
import '../../../widgets/myappbar.dart';

void main() {
  runApp(const UserBlogs());
}

class UserBlogs extends StatefulWidget {
  const UserBlogs({Key? key}) : super(key: key);

  @override
  _UserBlogState createState() => _UserBlogState();
}

class _UserBlogState extends State<UserBlogs> {
  Screen device = Screen.mobile;

  set isSearching(bool isSearching) {}

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return const BlogsScr();
      case (Screen.tablet):
        return const TabletUserBlogsScreen();
      case (Screen.desktop):
        return DesktopUserBlogsScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("blogs"),
        );
      case (Screen.tablet):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("blogs"),
        );
      case (Screen.desktop):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("blogs"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: drawAppar(),
        body: SingleChildScrollView(
          child: drawScreen(),
        ),
      ),
    );
  }
}

class BlogsScr extends StatelessWidget {
  const BlogsScr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/routes/ortakoy.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).secondaryHeaderColor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/ortakoy.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).secondaryHeaderColor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/ortakoy.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 240, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/ortakoy.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).secondaryHeaderColor, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: const Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 25,
                            ),
                            Gap(5),
                            Text(
                              "Hüseyin Çakal",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Düzenleme işlemi için bir diyalog göster
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Düzenle"),
                                  content: TextField(
                                    controller:
                                        TextEditingController(), // Metni kontrol etmek için bir TextEditingController kullanılıyor
                                    maxLines:
                                        null, // TextField'in birden fazla satıra otomatik olarak genişlemesini sağlar
                                    decoration: const InputDecoration(
                                      hintText: "Blog Yazınızı Buraya Girin",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Diyalogu kapat
                                      },
                                      child: const Text("İptal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Düzenleme işlemlerini burada gerçekleştir
                                        Navigator.of(context)
                                            .pop(); // Diyalogu kapat
                                      },
                                      child: const Text("Tamam"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const Gap(20),
                    Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)
                              .getTranslate("blogs_text"),
                          style: const TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.thumb_up,
                                    ),
                                  ),
                                  const Text("100"),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.comment,
                                    ),
                                  ),
                                  const Text("100"),
                                ],
                              ),
                            ],
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
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/routes/sariyer.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/sariyer.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/sariyer.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).secondaryHeaderColor, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: const Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 25,
                            ),
                            Gap(5),
                            Text(
                              "Hüseyin Çakal",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Düzenleme işlemi için bir diyalog göster
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Düzenle"),
                                  content: TextField(
                                    controller:
                                        TextEditingController(), // Metni kontrol etmek için bir TextEditingController kullanılıyor
                                    maxLines:
                                        null, // TextField'in birden fazla satıra otomatik olarak genişlemesini sağlar
                                    decoration: const InputDecoration(
                                      hintText: "Blog Yazınızı Buraya Girin",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Diyalogu kapat
                                      },
                                      child: const Text("İptal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Düzenleme işlemlerini burada gerçekleştir
                                        Navigator.of(context)
                                            .pop(); // Diyalogu kapat
                                      },
                                      child: const Text("Tamam"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      AppLocalizations.of(context).getTranslate("blogs_text1"),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.thumb_up,
                                ),
                              ),
                              const Text("100"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.comment,
                                ),
                              ),
                              const Text("100"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/routes/eminonu.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 70, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 240, // İkinci resmin yükseklik konumu
                  right: 30, // İkinci resmin yatay konumu
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg', // İkinci resmin dosya yolu
                        fit: BoxFit.cover,
                        width: 100, // İkinci resmin genişliği
                        height: 50, // İkinci resmin yüksekliği
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).secondaryHeaderColor, // Gölge rengi
                      spreadRadius: 3, // Gölgenin yayılma yarıçapı
                      blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                      offset: const Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 25,
                            ),
                            Gap(5),
                            Text(
                              "Hüseyin Çakal",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Düzenleme işlemi için bir diyalog göster
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Düzenle"),
                                  content: TextField(
                                    controller:
                                        TextEditingController(), // Metni kontrol etmek için bir TextEditingController kullanılıyor
                                    maxLines:
                                        null, // TextField'in birden fazla satıra otomatik olarak genişlemesini sağlar
                                    decoration: const InputDecoration(
                                      hintText: "Blog Yazınızı Buraya Girin",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Diyalogu kapat
                                      },
                                      child: const Text("İptal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Düzenleme işlemlerini burada gerçekleştir
                                        Navigator.of(context)
                                            .pop(); // Diyalogu kapat
                                      },
                                      child: const Text("Tamam"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      AppLocalizations.of(context).getTranslate("blogs_text2"),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.thumb_up,
                                ),
                              ),
                              const Text("100"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.comment,
                                ),
                              ),
                              const Text("100"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
