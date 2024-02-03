// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/screens/app_details/chatbot.dart';
import 'package:flutterfinalproje/widgets/myhomeappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterfinalproje/widgets/routescontainerdesign.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myitems = [
    RoutesContainerDesign(
      photo: "assets/images/routes/eminonu.jpeg",
      title: "Eminönü",
      puan: "5.0",
      visualization: "2024",
      comment: "32",
      durak: "9", // Durak sayısı
    ),
    RoutesContainerDesign(
      photo: "assets/images/routes/sariyer.jpeg",
      title: "Sarıyer",
      puan: "5.0",
      visualization: "2024",
      comment: "38",
      durak: "7", // Durak sayısı
    ),
    RoutesContainerDesign(
      photo: "assets/images/routes/camlica.jpeg",
      title: "Çamlıca",
      puan: "5.0",
      visualization: "2024",
      comment: "38",
      durak: "7", // Durak sayısı
    ),
    RoutesContainerDesign(
      photo: "assets/images/routes/ortakoy.jpeg",
      title: "Ortaköy",
      puan: "5.0",
      visualization: "2024",
      comment: "38",
      durak: "7", // Durak sayısı
    ),
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyHomeAppBar(title: 'ANA SAYFA', icon: Icon(Icons.search),),
        drawer: MyDrawer(context),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      WeatherBox(),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/VipGezginInfo');
                          },
                          child: NavigatorBox(
                            title: "Hemen VİP Gezgin Ol!",
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Bu Hafta Popüler",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: 250,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayInterval:
                                        const Duration(seconds: 2),
                                    enlargeCenterPage: true,
                                    aspectRatio: 2.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        myCurrentIndex = index;
                                      });
                                    },
                                  ),
                                  items: myitems,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AnimatedSmoothIndicator(
                                  activeIndex: myCurrentIndex,
                                  count: myitems.length,
                                  effect: WormEffect(
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    spacing: 5,
                                    dotColor: Colors.grey.shade400,
                                    activeDotColor: Colors.white,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Home');
                          },
                          child: NavigatorBox(
                            title: "Gezgin Ürünlerini Keşfet!",
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context)
                .colorScheme
                .surface, // Tema rengine uygun alt menü arkaplan rengi
          ),
          child: MyBottomNavBar(),
        ),
      ),
    );
  }

  Drawer MyDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 250,
            child: DrawerHeader(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: MediaQuery.of(context).size.width *
                                    0.6, // Genişlik ve yüksekliği isteğinize göre ayarlayın
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile/profile.png"), // Profil fotoğrafı
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage("assets/images/profile/profile.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Profile');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        "Profil",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTileItem(
              context, 'Hesabım', '/UserAccount', Icons.person, Colors.black54),
          ListTileItem(context, 'VİP Gezgin', '/VipGezginInfo', Icons.star,
              Colors.black54),
          ListTileItem(
              context, 'Ayarlar', '/Settings', Icons.settings, Colors.black54),
          ListTileItem(
              context, 'Oturumu Kapat', '/LogIn', Icons.logout, Colors.black54),
          SizedBox(
            height: 300,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.question_mark),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text("Having Trouble?"),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatBot()),
                              );
                            },
                            child: Text(
                              'Help For You',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavigatorBox extends StatelessWidget {
  final String title;

  const NavigatorBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        alignment: Alignment.center,
        height: 75,
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class WeatherBox extends StatelessWidget {
  const WeatherBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        height: 185,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Colors.blue.shade300,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.cloudy_snowing,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: Text(
                          "İstanbul",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          child: Text(
                        "Karlı",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10))),
                      height: 65,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfo(
                              icon: Icons.water_drop_outlined,
                              labelText: "Nem",
                              valueText: "30%",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfo(
                              icon: Icons.air,
                              labelText: "Rüzgar",
                              valueText: "27kh/h",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfo(
                              icon: Icons.umbrella,
                              labelText: "Yağış",
                              valueText: "20%",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String valueText;

  const WeatherInfo({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(
        icon,
      ),
      Column(
        children: [
          Text(
            labelText,
          ),
          Text(
            valueText,
          ),
        ],
      )
    ]);
  }
}

Widget ListTileItem(BuildContext context, String name, String screen,
    IconData iconData, Color iconColor) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ClipRRect(
      child: Container(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, screen);
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    iconData,
                    color: iconColor,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontFamily: ('Poppins')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
