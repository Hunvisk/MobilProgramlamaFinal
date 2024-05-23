
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../widgets/myappbar.dart';

class TabletUserBlogs extends StatelessWidget {
  const TabletUserBlogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("blogs"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabletUserBlogsScreen(),
          ],
        ),
      ),
    );
  }
}

class TabletUserBlogsScreen extends StatelessWidget {
  const TabletUserBlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBlogCard(),
        const Divider(),
        _buildBlogCard1(),
        const Divider(),
        _buildBlogCard2(),
      ],
    );
  }

  Widget _buildBlogCard() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                    top: 10,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/routes/ortakoy.jpeg',
                          fit: BoxFit.cover,
                          width: 70,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/routes/ortakoy.jpeg',
                          fit: BoxFit.cover,
                          width: 70,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    //color: Colors.grey[300]!,
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 25,
                      ),
                      Gap(15),
                      Text(
                        "Eda Aydın",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const Gap(15),
                  const Text(
                    'Camiinin mimari açıdan en önemli özelliklerinden biri 18. yüzyıldan sonra özellikle Fransa ve İtalya saraylarında karşımıza çıkan Barok mimari tarzının kullanılması...',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Gap(15),
                  Row(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildBlogCard1() {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
                  top: 10,
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/sariyer.jpeg',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/sariyer.jpeg',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(15),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  //color: Colors.grey[300]!,
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 25,
                    ),
                    Gap(15),
                    Text(
                      "Eda Aydın",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Gap(15),
                const Text(
                  'Sarıyer, İstanbul"un kuzeyinde yer alan güzide ilçelerimizden birisidir. Belgrad Ormanı ve Atatürk Arboretumu gibi huzurlu yemyeşil alanların yanı sıra, Emirgan Korusu ve Rumeli Hisarı gibi turistik merkezleriyle de burası İstanbulluların en sevdiği ilçeler arasında yer alıyor.',
                  style: TextStyle(fontSize: 16),
                ),
                const Gap(15),
                Row(
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
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildBlogCard2() {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
                  top: 10,
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/routes/eminonu.jpeg',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(15),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 25,
                    ),
                    Gap(15),
                    Text(
                      "Eda Aydın",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Gap(15),
                const Text(
                  'Eminönü vapur iskelesinde ya da Eminönü tramvay durağında indiniz. Sırtınızı denize verip karşıya baktığınızda kalabalık bir meydan göreceksiniz. İşte burası Eminönü’ne giriş noktanız. ',
                  style: TextStyle(fontSize: 16),
                ),
                const Gap(15),
                Row(
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
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
