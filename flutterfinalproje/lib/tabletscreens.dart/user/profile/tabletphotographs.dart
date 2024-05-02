import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TabletPhotographs extends StatelessWidget {
  const TabletPhotographs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'FOTOĞRAFLAR',
      ),
      body: const Text("FOTOĞRAFLAR SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class TabletPhotographsScreen extends StatelessWidget {
  const TabletPhotographsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 3),
        const FilterWidget(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              photoItem("Kamera", "1.151",
                  "assets/images/photographs/anlatan_meydanı.jpeg", context),
              photoItem("Kolaj", "2.345",
                  "assets/images/photographs/yalvac.jpg", context),
              photoItem("Çiçekler", "3.789",
                  "assets/images/photographs/isparta.jpg", context),
              photoItem("Hayvanlar", "1.151",
                  "assets/images/photographs/yalvac.jpg", context)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              photoItem("Aile", "2.345",
                  "assets/images/photographs/isparta.jpg", context),
              photoItem("Facebook", "3.789",
                  "assets/images/photographs/cinaralti.jpeg", context),
              photoItem("WhatsApp", "1.151",
                  "assets/images/photographs/pisidia.jpeg", context),
              photoItem("Snapchat", "2.345",
                  "assets/images/photographs/yalvac.jpg", context),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              photoItem("Instagram", "3.789",
                  "assets/images/photographs/isparta.jpg", context),
              photoItem("ScreenShootlar", "1.151",
                  "assets/images/photographs/isparta.jpg", context),
              photoItem("Snapchat", "2.345",
                  "assets/images/photographs/cinaralti.jpeg", context),
              photoItem("Instagram", "3.789",
                  "assets/images/photographs/yalvac.jpg", context),
            ],
          ),
        ),
      ],
    );
  }

  Widget photoItem(
      String title, String count, String photo, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(15),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineMedium!.color,
              fontWeight:
                  Theme.of(context).textTheme.headlineMedium!.fontWeight,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    _showSortPopup(
                        context); // Burada _showSortPopup kullanımı düzeltilmiştir.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Albümler',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ), // Arama ikonu
                      onPressed: () {
                        // Arama ikonuna tıklandığında yapılacak işlemler
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _showSortPopup(BuildContext context) {
    // _showSortPopup fonksiyonu static olarak değiştirildi.
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Albüm',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Yıla Göre (En Eski)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Yıla Göre (En Yeni)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Aya Göre (En Eski)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Aya Göre (En Yeni)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Güne Göre (En Eski)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Güne Göre (En Yeni)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
