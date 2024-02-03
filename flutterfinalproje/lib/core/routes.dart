// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/screens/app_details/aboutus.dart';
import 'package:flutterfinalproje/screens/app_details/chatbot.dart';
import 'package:flutterfinalproje/screens/app_details/settings.dart';
import 'package:flutterfinalproje/screens/app_details/vipgezgininfo.dart';
import 'package:flutterfinalproje/screens/home.dart';
import 'package:flutterfinalproje/screens/places_and_routes/map.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/places.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/selectedplaces.dart';
import 'package:flutterfinalproje/screens/places_and_routes/routes/routes.dart';
import 'package:flutterfinalproje/screens/places_and_routes/routes/selectedroutes.dart';
import 'package:flutterfinalproje/screens/shopping/product/products.dart';
import 'package:flutterfinalproje/screens/shopping/product/selectedproducts.dart';
import 'package:flutterfinalproje/screens/user/account/cardsinfo.dart';
import 'package:flutterfinalproje/screens/user/account/useraccount.dart';
import 'package:flutterfinalproje/screens/user/login.dart';
import 'package:flutterfinalproje/screens/user/profile/achievements.dart';
import 'package:flutterfinalproje/screens/user/profile/favorites.dart';
import 'package:flutterfinalproje/screens/user/profile/photographs.dart';
import 'package:flutterfinalproje/screens/user/profile/placestovisit.dart';
import 'package:flutterfinalproje/screens/user/profile/profile.dart';
import 'package:flutterfinalproje/screens/user/profile/userblogs.dart';
import 'package:flutterfinalproje/screens/user/profile/usercomments.dart';
import 'package:flutterfinalproje/screens/user/register.dart';


class Routes {
  static final Map<String, WidgetBuilder> routes = {
    // App Details
      '/AboutUs': (context) => AboutUs(),
      '/ChatBot': (context) => ChatBot(),
      '/Settings': (context) => Settings(),
      '/VipGezginInfo':(context) => VipGezginInfo(),
    // Places And Routes
      // Places
        '/Places': (context) => Places(),
        '/SelectedPlaces': (context) => SelectedPlaces(),
      // Routes
        '/Routes': (context) => RoutesScreen(),
        '/SelectedRoutes': (context) => SelectedRoutes(),
      '/Map': (context) => MyMap(),
    // Shopping
      // Product
        '/Products': (context) => Products(),
        '/SelectedProducts': (context) => SelectedProducts(),
    // User
      // Account
        '/UserAccount': (context) => UserAccount(),
        '/CardsInfo': (context) => CardsInfo(),
      // Profile
        '/Achievemets': (context) => Achievemets(),
        '/Favorites': (context) => Favorites(),
        '/Photographs': (context) => Photographs(),
        '/PlaceToVisit': (context) => PlaceToVisit(),
        '/Profile': (context) => ProfileScreen(),
        '/UserBlogs': (context) => UserBlogs(),
        '/UserComments': (context) => UserComments(),
      '/LogIn': (context) => LoginScreen(),
      '/Register': (context) => RegisterScreen(),
    '/Home': (context) => Home(),
    
      };
}