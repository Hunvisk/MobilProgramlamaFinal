// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myhomeappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myitems = [
    Image.asset("assets/images/image7.jpg"),
    Image.asset("assets/images/image8.jpeg"),
    Image.asset("assets/images/image7.jpg"),
    Image.asset("assets/images/image8.jpeg"),
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHomeAppBar(),
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
                      child: NavigatorBox(title: "Hemen VİP Gezgin Ol!",)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 325,
                        width: double.infinity,
                        color: Colors.grey.shade200,
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
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                height: 250,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayInterval: const Duration(seconds: 2),
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                onPageChanged:(index, reason) {
                                  setState(() {
                                    myCurrentIndex = index;
                                  });
                                },
                              ),
                              items: myitems,
                            ),
                            AnimatedSmoothIndicator(
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
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                      child: NavigatorBox(title: "Gezgin Ürünlerini Keşfet!",)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
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
                    child: CircleAvatar(
                      radius: 45,
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
                      child: Text("Profil"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTileItem(context, 'Hesabım', '/Home', Icons.person, Colors.black54),
          ListTileItem(context, 'VİP Gezgin', '/VipGezginInfo', Icons.star, Colors.black54),
          ListTileItem(context, 'Ayarlar', '/Home', Icons.settings, Colors.black54),
          ListTileItem(context, 'Oturumu Kapat', '/LogIn', Icons.logout, Colors.black54),
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
                                MaterialPageRoute(builder: (context) => Home()),
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

  const NavigatorBox({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
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
        color: Colors.grey.shade200,
        height: 185,
        child: Row(
          children: [
            Container(
              color: Colors.blue.shade300,
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
            Container(
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
                        )
                      ),
                  ),
                  Container(
                    height: 65,
                    width: 271,
                    color: Colors.grey.shade300,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ]
    );
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
                      ),
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