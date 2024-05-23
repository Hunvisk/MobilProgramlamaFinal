
// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import '../bloc/saved_places/saved_places_cubit.dart';
import '../bloc/saved_placestovisit/saved_placestovisit_cubit.dart';
import '../services/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterfinalproje/widgets/myhomeappbar.dart';

import '../core/localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late SavedPlacesCubit savedPlacesCubit;
  late SavedPlacesToVisitCubit savedPlacesToVisitCubit;
  late ClientCubit clientCubit;
  late List<dynamic> places = [];
  late List<dynamic> carouselSliderItems = [];

  @override
  void initState() {
    super.initState();
    savedPlacesCubit = context.read<SavedPlacesCubit>();
    savedPlacesToVisitCubit = context.read<SavedPlacesToVisitCubit>();
    clientCubit = context.read<ClientCubit>();
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    // JSON dosyasını oku
    String jsonString = await rootBundle.loadString('assets/data/places.json');
    // JSON verisini parse et
    List<dynamic> jsonList = json.decode(jsonString);
    // State'i güncelle ve verileri atama
    setState(() {
      places = jsonList;
      carouselSliderItems = getCarouselSliderItems([0, 2, 4]); // Seçilen indeksler
    });
  }

  List<dynamic> getCarouselSliderItems(List<int> indices) {
    return indices.map((index) => places[index]).toList();
  }

  int myCurrentIndex = 0;
  int carouselsliderindex = 0;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, 
      appBar: MyHomeAppBar(
        icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },
        actions: const [],
      ),
      drawer: myDrawer(context),
      body: BlocBuilder<SavedPlacesToVisitCubit, SavedPlacesToVisitState>(
        builder: (context, savedPlacesToVisitState) {
          return BlocBuilder<SavedPlacesCubit, SavedPlacesState>(
            builder: (context, savedPlacesState) {
              return SafeArea(
                child: Column(
                  children: [
                    if (isSearching)
                      Container(
                        height: 32, // Arama çubuğu yüksekliği,,,,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
                          },
                          onSubmitted: (value) {
                            // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
                          },
                          decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 50,
                            ),
                            const WeatherBox(),
                            NavigatorBox(
                              title: AppLocalizations.of(context).getTranslate("become_a_VIP_traveler_now"),
                              route: "/VipGezginInfo",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).secondaryHeaderColor),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .getTranslate("popular_this_week"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          )),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          height: 250,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 1000),
                                          autoPlayInterval:
                                              const Duration(seconds: 3),
                                          enlargeCenterPage: true,
                                          aspectRatio: 2.0,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              myCurrentIndex = index;
                                            });
                                          },
                                        ),
                                        items: carouselSliderItems.map((e) => placesContainerDesign(
                                            context,
                                            e["id"] as int,
                                            e["images"][0].toString(), 
                                            e["title"].toString(), 
                                            e["rating"].toString(), 
                                            e["views"].toString(), 
                                            e["comments"].toString(),
                                            e
                                        )).toList()
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: AnimatedSmoothIndicator(
                                        activeIndex: myCurrentIndex,
                                        count: carouselSliderItems.length,
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
                            NavigatorBox(
                              title: AppLocalizations.of(context).getTranslate("discover_traveler_products"),
                              route: "/Products",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }

  

  Drawer myDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
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
                            return CircleAvatar(
                              maxRadius: 50,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: SizedBox(
                                  width: 300,
                                  height: 300,
                                  child: Hero(
                                    tag: "profilFoto",
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/logo/GR_Logo.png"), // Profil fotoğrafı
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Hero(
                          tag: "profilFoto",
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).secondaryHeaderColor, // Border rengi
                                width: 4, // Border genişliği
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage("assets/images/logo/GR_Logo.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  listTileItem(
                    context,
                    AppLocalizations.of(context).getTranslate("settings"),
                    '/SettingsScreen',
                    Icons.settings,
                  ),
                  listTileItem(
                    context,
                    AppLocalizations.of(context).getTranslate("vip_traveler"),
                    '/VipGezginInfo',
                    Icons.star,
                  ),
                  listTileItem(
                    context,
                    AppLocalizations.of(context).getTranslate("products"),
                    '/Products',
                    Icons.shopping_cart,
                  ),
                  listTileItem(
                    context,
                    AppLocalizations.of(context).getTranslate("log_out"),
                    '/LogIn',
                    Icons.logout,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help, 
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .getTranslate("having_trouble"),
                              style: TextStyle(color: Theme.of(context).colorScheme.primary), 
                            ),
                            InkWell(
                              onTap: () {
                                context.push('/ChatBot');
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                    .getTranslate("help_for_you"),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSaveOptions(int id, dynamic place) {
    showDialog(
      context: context,
      builder: (context) {
        bool isSavedPlace = savedPlacesCubit.isSavedPlaces(id);
        bool isSavedPlaceToVisit = savedPlacesToVisitCubit.isSavedPlacesToVisit(id);
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context).getTranslate("saving_options"),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context).getTranslate("savedPlaces"),),
                    value: isSavedPlace,
                    onChanged: (bool? value) {
                      setState(() {
                        isSavedPlace = value ?? false;
                        if (isSavedPlace) {
                          savedPlacesCubit.addToSavedPlaces(place);
                        } else {
                          savedPlacesCubit.removeFromSavedPlaces(id);
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context).getTranslate("places_to_visit"),),
                    value: isSavedPlaceToVisit,
                    onChanged: (bool? value) {
                      setState(() {
                        isSavedPlaceToVisit = value ?? false;
                        if (isSavedPlaceToVisit) {
                          savedPlacesToVisitCubit.addToSavedPlacesToVisit(place);
                        } else {
                          savedPlacesToVisitCubit.removeFromSavedPlacesToVisit(id);
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context).getTranslate("close"),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget placesContainerDesign(BuildContext context, int id, String imagePath, String title, String rating, String views, String comments, index) {
    bool isSavedPlace = savedPlacesCubit.isSavedPlaces(id);
    bool isWantedPlace = savedPlacesToVisitCubit.isSavedPlacesToVisit(id);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).getTranslate(title),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      (isSavedPlace || isWantedPlace)
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _showSaveOptions(id, index);
                    },
                  ),
                ],
              ),
            ),
          )
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: infoColumns(rating, views, comments),
        ),
      ],
    );
  }

  Widget infoColumns(String rating, String views, String comments) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          infoRow(
            context,
             Icons.star,
             ": $rating",
          ),
          infoRow(
            context,
            Icons.remove_red_eye,
            ": $views",
          ),
          infoRow(
            context,
            Icons.comment,
            ": $comments",
          ),
        ],
      ),
    );
  }

  Widget infoRow(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const Gap(5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigatorBox extends StatelessWidget {
  final String title;
  final String route;

  const NavigatorBox({Key? key, required this.title, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          onTap: () {
            context.push(route);
          },
        ),
      ),
    );
  }
}

class WeatherBox extends StatefulWidget {
  const WeatherBox({Key? key}) : super(key: key);

  @override
  _WeatherBoxState createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  late Future<Map<String, dynamic>> _weatherFuture;

  @override
  void initState() {
    super.initState();
    const apiKey = '2a209ebdc173950d2a371516a733bc95';
    final weatherAPI = WeatherAPI(apiKey);
    _weatherFuture = weatherAPI.getWeather('İstanbul');
  }

@override
Widget build(BuildContext context) {
  return FutureBuilder<Map<String, dynamic>>(
    future: _weatherFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Hata: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final weatherData = snapshot.data!;
        return _buildWeatherBox(weatherData);
      } else {
        return const Text('Veri bulunamadı.');
      }
    },
  );
}


  Widget _buildWeatherBox(Map<String, dynamic> weatherData) {
    // Hava durumu ikon kodunu al
final iconCode = weatherData['weather'][0]['icon'];

// Hava durumu ikonunun URL'sini oluştur
final iconUrl = 'http://openweathermap.org/img/wn/$iconCode@2x.png';

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  iconUrl,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '${weatherData['name']}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: Text(
                      '${weatherData['main']['temp']}°C',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    height: 65,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherInfo(
                          icon: Icons.water_drop_outlined,
                          labelText: AppLocalizations.of(context)
                              .getTranslate("humidty"),
                          valueText: '${weatherData['main']['humidity']}%',
                        ),
                        WeatherInfo(
                          icon: Icons.air,
                          labelText: AppLocalizations.of(context)
                              .getTranslate("wind"),
                          valueText: '${weatherData['wind']['speed']}km/h',
                        ),
                        WeatherInfo(
                          icon: Icons.umbrella,
                          labelText: AppLocalizations.of(context)
                              .getTranslate("rainfall"),
                          valueText: weatherData['rain'] != null ? '${weatherData['rain']['1h']}mm' : '0mm',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Container(
              constraints: const BoxConstraints(maxWidth: 50),
              child: Text(
                labelText,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            valueText,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
Widget listTileItem(BuildContext context, String name, String screen,
    IconData iconData) {
  return BlocBuilder<ClientCubit, ClientState>(
    builder: (context, state) {
      bool isDarkMode = state.darkMode; // Varsayılan olarak false kullanıyoruz

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
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
                      //color: ,
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
      );
    },
  );
}


