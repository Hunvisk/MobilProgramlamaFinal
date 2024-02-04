// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

void main() {
  runApp(UserBlogs());
}

class UserBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: "BLOGLAR"),
        body: SingleChildScrollView(
          child: Column(
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
                            border: Border.all(color: Colors.white, width: 2),
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
                      Positioned(
                        top: 120, // İkinci resmin yükseklik konumu
                        right: 30, // İkinci resmin yatay konumu
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
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
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!, // Gölge rengi
                            spreadRadius: 3, // Gölgenin yayılma yarıçapı
                            blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                            offset: Offset(0, 3), // Gölgenin konumu (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 25,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Eda Aydın",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Text(
                                'Camiinin mimari açıdan en önemli özelliklerinden biri 18. yüzyıldan sonra özellikle Fransa ve İtalya saraylarında karşımıza çıkan Barok mimari tarzının kullanılması. Bu mimari tarzın bir özelliği olarak camiinin dış cephesi, muhteşem güzellikte taşlarla yapılmış oyma ve kabartma süslemeleriyle dikkat çekiyor. 19. yüzyıl camiilerinin genel özelliğinde olduğu gibi camii de ana ibadet bölümünün yanı sıra padişahların namaz kılması ve dinlenmesi için yapılan hünkâr kasrı bölümü de bulunur. Camii, geniş ve yüksek pencerelere sahiptir. Camii"nin iç duvarları kırmızı ve beyaz parlak çizgili, pembe renkli sıvalarla yapılmış, minberin mermer yapısıysa pembe renkli taşlarla süsleniyor.',
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.thumb_up,
                                          ),
                                        ),
                                        Text("100"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.comment,
                                          ),
                                        ),
                                        Text("100"),
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
              Divider(),
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
                            border: Border.all(color: Colors.white, width: 2),
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
                            border: Border.all(color: Colors.white, width: 2),
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
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!, // Gölge rengi
                            spreadRadius: 3, // Gölgenin yayılma yarıçapı
                            blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                            offset: Offset(0, 3), // Gölgenin konumu (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 25,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Eda Aydın",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Sarıyer, İstanbul"un kuzeyinde yer alan güzide ilçelerimizden birisidir. Belgrad Ormanı ve Atatürk Arboretumu gibi huzurlu yemyeşil alanların yanı sıra, Emirgan Korusu ve Rumeli Hisarı gibi turistik merkezleriyle de burası İstanbulluların en sevdiği ilçeler arasında yer alıyor. Sarıyer, ayrıca kahvaltı yapılabilecek ve yemek yenebilecek mekanlarıyla da gurmelere hitap eden, her yönüyle gezip görülmesi gereken yemyeşil bir semt',
                            style: TextStyle(fontSize: 16),
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
                                      icon: Icon(
                                        Icons.thumb_up,
                                      ),
                                    ),
                                    Text("100"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.comment,
                                      ),
                                    ),
                                    Text("100"),
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
                            border: Border.all(color: Colors.white, width: 2),
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
                            border: Border.all(color: Colors.white, width: 2),
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
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!, // Gölge rengi
                            spreadRadius: 3, // Gölgenin yayılma yarıçapı
                            blurRadius: 5, // Gölgenin bulanıklık yarıçapı
                            offset: Offset(0, 3), // Gölgenin konumu (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 25,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Eda Aydın",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Eminönü vapur iskelesinde ya da Eminönü tramvay durağında indiniz. Sırtınızı denize verip karşıya baktığınızda kalabalık bir meydan göreceksiniz. İşte burası Eminönü’ne giriş noktanız. Eminönü meydan neredeyse günün her saatinde iğne atsan yere düşmeyecek bir yer. Yani İstanbul"un özeti gibi',
                            style: TextStyle(fontSize: 16),
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
                                      icon: Icon(
                                        Icons.thumb_up,
                                      ),
                                    ),
                                    Text("100"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.comment,
                                      ),
                                    ),
                                    Text("100"),
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
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
