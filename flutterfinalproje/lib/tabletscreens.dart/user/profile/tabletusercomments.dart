
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../widgets/myappbar.dart';

class TabletUserComments extends StatelessWidget {
  const TabletUserComments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          appBar: MyAppBar(
    title: 'YORUMLAR',
          ),
          body: Text("YORUMLAR SAYFASI"),
        );
  }
}

Column tabletUserCommentsScreen() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Gap(10),
      buildColoredBox(
        const Color.fromARGB(255, 255, 229, 170),
        'Eda Aydın',
        'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
        'Beşiktaş',
        '12/02/2023',
      ),
      const Gap(10),
      buildColoredBox(
        const Color.fromARGB(255, 255, 229, 170),
        'Eda Aydın',
        'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
        'Kız Kulesi',
        '11/04/2023',
      ),
      const Gap(10),
      buildColoredBox(
        const Color.fromARGB(255, 255, 229, 170),
        'Eda Aydın',
        'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
        'Sarıyer',
        '09/09/2023',
      ),
      const Gap(10),
      buildColoredBox(
        const Color.fromARGB(255, 255, 229, 170),
        'Eda Aydın',
        'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
        'Kadıköy',
        '14/08/2023',
      ),
      const Gap(10),
      buildColoredBox(
        const Color.fromARGB(255, 255, 229, 170),
        'Eda Aydın',
        'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
        'Galata Kulesi',
        '14/06/2023',
      ),
      const Gap(10),
      buildColoredBox(
        const Color.fromARGB(255, 255, 229, 170),
        'Eda Aydın',
        'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
        'İstinye',
        '12/05/2023',
      ),
      const Gap(10),
    ],
  );
}

Widget buildColoredBox(
  Color color,
  String title,
  String content,
  String location,
  String date,
) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    padding: const EdgeInsets.all(20.0), // İçeriğin kenarlardan uzaklığı artırıldı
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(15),
    ),
    width: double.infinity, // Genişlik boyutunu maksimuma ayarlar
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.account_circle),
                const Gap(15),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18), // Başlık font boyutu artırıldı
                ),
              ],
            ),
          ],
        ),
        const Gap(15),
        Text(
          content,
          style: const TextStyle(fontSize: 16), // İçerik font boyutu artırıldı
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              location,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16, // Konum font boyutu artırıldı
              ),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 14), // Tarih font boyutu artırıldı
            ),
          ],
        ),
      ],
    ),
  );
}
