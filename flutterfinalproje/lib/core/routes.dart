// ignore_for_file: prefer_const_constructors
import 'package:go_router/go_router.dart';

import '../screens/app_details/aboutus.dart';
import '../screens/app_details/chatbot.dart';
import '../screens/app_details/settings.dart';
import '../screens/app_details/vipgezgininfo.dart';
import '../screens/Home.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/places_and_routes/map.dart';
import '../screens/places_and_routes/places/places.dart';
import '../screens/places_and_routes/places/selectedplaces.dart';
import '../screens/places_and_routes/routes/routes.dart';
import '../screens/places_and_routes/routes/selectedroutes.dart';
import '../screens/shopping/product/products.dart';
import '../screens/shopping/product/selectedproducts.dart';
import '../screens/static/boarding.dart';
import '../screens/user/account/addcard.dart';
import '../screens/user/account/cardsinfo.dart';
import '../screens/user/account/forgotPassword.dart';
import '../screens/user/account/useraccount.dart';
import '../screens/user/Login.dart';
import '../screens/user/profile/achievements.dart';
import '../screens/user/profile/favorites.dart';
import '../screens/user/profile/photographs.dart';
import '../screens/user/profile/placestovisit.dart';
import '../screens/user/profile/profile.dart';
import '../screens/user/profile/userblogs.dart';
import '../screens/user/profile/usercomments.dart';
import '../screens/user/register.dart';



// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    // Uygulama LoaderScreen ile başlayacak.
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),

    // App Details
    GoRoute(
      path: '/ChatBot',
      builder: (context, state) => const ChatBot(),
    ),
    GoRoute(
      path: '/Settings',
      builder: (context, state) => const Settings(),
    ),
    GoRoute(
      path: '/VipGezginInfo',
      builder: (context, state) => const VipGezginInfo(),
    ),
    GoRoute(
      path: '/Aboutus',
      builder: (context, state) => const AboutUs(),
    ),
    GoRoute(
      path: '/VipGezginInfo',
      builder: (context, state) => const VipGezginInfo(),
    ),

    // Places And Routes

    // Places
    GoRoute(
      path: '/Places',
      builder: (context, state) => const Places(),
    ),
    GoRoute(
      path: '/SelectedPlaces',
      builder: (context, state) => const SelectedPlaces(),
    ),

    // Routes
    GoRoute(
      path: '/Routes',
      builder: (context, state) => const RoutesScreen(),
    ),
    GoRoute(
      path: '/SelectedRoutes',
      builder: (context, state) => const SelectedRoutes(),
    ),
    GoRoute(
      path: '/Map',
      builder: (context, state) => const MyMap(),
    ),

    // Shopping
    // Product
    GoRoute(
      path: '/Products',
      builder: (context, state) => const Products(),
    ),
    GoRoute(
      path: '/SelectedProducts',
      builder: (context, state) => const SelectedProducts(),
    ),

    // Static
    GoRoute(
      path: '/Boarding',
      builder: (context, state) => const BoardingScreen(),
    ),

    // User
    // Account
    GoRoute(
      path: '/UserAccount',
      builder: (context, state) => const UserAccount(),
    ),
    GoRoute(
      path: '/CardsInfo',
      builder: (context, state) => const CardsInfo(),
    ),
    GoRoute(
      path: '/AddCard',
      builder: (context, state) => const AddCard(),
    ),
    GoRoute(
      path: '/ForgotPassword',
      builder: (context, state) => const ForgotPassword(),
    ),
    
    // Profile
    GoRoute(
      path: '/Achievemets',
      builder: (context, state) => const Achievemets(),
    ),

    GoRoute(
      path: '/Favorites',
      builder: (context, state) => const Favorites(),
    ),
    GoRoute(
      path: '/Photographs',
      builder: (context, state) => const Photographs(),
    ),
    GoRoute(
      path: '/PlaceToVisit',
      builder: (context, state) => const PlaceToVisit(),
    ),
    GoRoute(
      path: '/Profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/UserBlogs',
      builder: (context, state) => UserBlogs(),
    ),
    GoRoute(
      path: '/UserComments',
      builder: (context, state) => UserComments(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/Register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/Home',
      builder: (context, state) => Home(),
    ),
  ],
);
