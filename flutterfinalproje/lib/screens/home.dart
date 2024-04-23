// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_unnecessary_containers, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterfinalproje/widgets/myhomeappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:flutterfinalproje/widgets/placescontainerdesign.dart';
import 'package:flutterfinalproje/widgets/routescontainerdesign.dart';

import '../core/localizations.dart';

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
    PlacesContainerDesign(
      imagePath: "assets/images/places/galata.jpg",
      title: "Galata Kulesi",
      rating: "8.5",
      views: "1500",
      comments: "45",
    ),
    RoutesContainerDesign(
      photo: "assets/images/routes/sariyer.jpeg",
      title: "Sarıyer",
      puan: "5.0",
      visualization: "2024",
      comment: "38",
      durak: "7", // Durak sayısı
    ),
    PlacesContainerDesign(
      imagePath: "assets/images/places/kız.png",
      title: "Kız Kulesi",
      rating: "9.0",
      views: "2000",
      comments: "60",
    ),
    RoutesContainerDesign(
      photo: "assets/images/routes/camlica.jpeg",
      title: "Çamlıca",
      puan: "5.0",
      visualization: "2024",
      comment: "38",
      durak: "7", // Durak sayısı
    ),
    PlacesContainerDesign(
      imagePath: "assets/images/places/dolmabahçe.jpg",
      title: "Dolmabahçe Sarayı",
      rating: "4.0",
      views: "3000",
      comments: "45",
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
  int carouselsliderindex = 0;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MyHomeAppBar(
          //title: 'Ana Sayfa',
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
          actions: [],
        ),
        drawer: MyDrawer(context),
        body: SafeArea(
          child: Column(
            children: [
              if (isSearching)
                Container(
                  height: 32, // Arama çubuğu yüksekliği,,,,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
                    },
                    onSubmitted: (value) {
                      // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
                    },
                    decoration: InputDecoration(
                      hintText: "Ara...",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4.0), // Dikey iç boşluk
                    ),
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      WeatherBox(),
                      GestureDetector(
                          onTap: () {
                            context.push('/VipGezginInfo');
                          },
                          child: NavigatorBox(
                            title:  AppLocalizations.of(context).getTranslate("become_a_VIP_traveler_now"),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      AppLocalizations.of(context).getTranslate("popular_this_week"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    )),
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
                            context.push('/Home');
                          },
                          child: NavigatorBox(
                            title: AppLocalizations.of(context).getTranslate("discover_traveler_products"),
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

  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  Drawer MyDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                                        "assets/images/logo/GR_Logo.png"), // Profil fotoğrafı
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
                            AssetImage("assets/images/logo/GR_Logo.png"),
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
                          context.push('/Profile');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).secondaryHeaderColor,
                        ),
                        child: Text(
                          AppLocalizations.of(context).getTranslate("profile"),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(
                          context.read<ClientCubit>().state.darkMode
                              ? Icons.nightlight
                              : Icons.wb_sunny,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text(
                          AppLocalizations.of(context).getTranslate("mode")+
                              (context.read<ClientCubit>().state.darkMode
                                  ? AppLocalizations.of(context).getTranslate("night")
                                  : AppLocalizations.of(context).getTranslate("light")),
                        ),
                        trailing: Switch(
                          value: context.read<ClientCubit>().state.darkMode,
                          onChanged: (bool newValue) {
                            // Gece modu geçişini yapar
                            context
                                .read<ClientCubit>()
                                .changeDarkMode(newValue, darkMode: true);
                            // Gündüz modu geçişi için bir kontrol yapar
                            if (!newValue) {
                              context
                                  .read<ClientCubit>()
                                  .changeDarkMode(newValue, darkMode: false);
                            }
                          },
                        ),
                      ),
                    ),
                    ListTileItem(
                      context,
                      AppLocalizations.of(context).getTranslate("language")+
                          context
                              .read<ClientCubit>()
                              .state
                              .language, // assuming language is a state in your ClientCubit
                      '/Change_LanguageScreen',
                      Icons.language,
                      Colors.black54,
                    ),
                    ListTileItem(
                      context,
                      AppLocalizations.of(context).getTranslate("settings"),
                      '/SettingsScreen',
                      Icons.settings,
                      Colors.black54,
                    ),
                    ListTileItem(
                      context,
                      AppLocalizations.of(context).getTranslate("vip_traveler"),
                      '/VipGezginInfo',
                      Icons.star,
                      Colors.black54,
                    ),
                    ListTileItem(
                      context,
                      AppLocalizations.of(context).getTranslate("settings"),
                      '/Settings',
                      Icons.settings,
                      Colors.black54,
                    ),
                    ListTileItem(
                      context,
                      AppLocalizations.of(context).getTranslate("log_out"),
                      '/LogIn',
                      Icons.logout,
                      Colors.black54,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.help),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Text(AppLocalizations.of(context).getTranslate("having_trouble")),
                                InkWell(
                                  onTap: () {
                                    context.push('/ChatBot');
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).getTranslate("help_for_you"),
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
                ),
              ],
            ),
          ),
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
          color: Theme.of(context).secondaryHeaderColor,
        ),
        alignment: Alignment.center,
        height: 75,
        width: double.infinity,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
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
          color: Theme.of(context).colorScheme.primaryContainer,
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
                color: Theme.of(context).colorScheme.tertiaryContainer,
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
                        AppLocalizations.of(context).getTranslate("location"),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                    ),
                    Container(
                        height: 65,
                        width: double.infinity,
                        child: Text(
                          AppLocalizations.of(context).getTranslate("snowy"),
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),
                    Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                              labelText: AppLocalizations.of(context).getTranslate("humidty"),
                              valueText: "30%",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfo(
                              icon: Icons.air,
                              labelText: AppLocalizations.of(context).getTranslate("wind"),
                              valueText: "27kh/h",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfo(
                              icon: Icons.umbrella,
                              labelText: AppLocalizations.of(context).getTranslate("rainfall"),
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            valueText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      )
    ]);
  }
}

Widget ListTileItem(BuildContext context, String name, String screen,
    IconData iconData, Color iconColor) {
  return BlocBuilder<ClientCubit, ClientState>(
    builder: (context, state) {
      bool isDarkMode =
          state.darkMode; // Varsayılan olarak false kullanıyoruz

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          child: Container(
            child: InkWell(
              onTap: () {
                context.push(screen);
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
                            color: isDarkMode ? Colors.white : Colors.black87,
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
    },
  );
}
