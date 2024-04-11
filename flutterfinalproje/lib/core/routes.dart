// ignore_for_file: prefer_const_constructors
import 'package:go_router/go_router.dart';

import '../screens/app_details/aboutus.dart';
import '../screens/app_details/chatbot.dart';
import '../screens/app_details/settings.dart';
import '../screens/app_details/vipgezgininfo.dart';
import '../screens/Home.dart';
import '../screens/core/change_language.dart';
import '../screens/core/error.dart';
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
//import '../screens/user/account/useraccount.dart';
import '../screens/user/Login.dart';
import '../screens/user/profile/achievements.dart';
import '../screens/user/profile/favorites.dart';
import '../screens/user/profile/photographs.dart';
import '../screens/user/profile/placestovisit.dart';
import '../screens/user/profile/profile.dart';
import '../screens/user/profile/userblogs.dart';
import '../screens/user/profile/usercomments.dart';
import '../screens/user/register.dart';
import '../tabletscreens.dart/app_details/tabletvipgezgininfo.dart';
import '../tabletscreens.dart/places_and_routes/places/tabletplaces.dart';
import '../tabletscreens.dart/places_and_routes/places/tabletselectedplaces.dart';
import '../tabletscreens.dart/places_and_routes/routes/tabletroutes.dart';
import '../tabletscreens.dart/places_and_routes/routes/tabletselectedroutes.dart';
import '../tabletscreens.dart/user/profile/tabletachievements.dart';
import '../tabletscreens.dart/user/profile/tabletfavorites.dart';
import '../tabletscreens.dart/user/profile/tabletphotographs.dart';
import '../tabletscreens.dart/user/profile/tabletplacestovisit.dart';
import '../tabletscreens.dart/user/profile/tabletprofile.dart';
import '../tabletscreens.dart/user/profile/tabletuserblogs.dart';
import '../tabletscreens.dart/user/profile/tabletusercomments.dart';



// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    // Uygulama LoaderScreen ile başlayacak.
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const LoaderScreen(),
    // ),

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
      path: '/TabletVipGezginInfo',
      builder: (context, state) => const TabletVipGezginInfo(),
    ),
    GoRoute(
      path: '/Aboutus',
      builder: (context, state) => const AboutUs(),
    ),
    GoRoute(
      path: '/VipGezginInfo',
      builder: (context, state) => const VipGezginInfo(),
    ),

    // Core
    GoRoute(
      path: '/Change_LanguageScreen',
      builder: (context, state) => const Change_LanguageScreen(),
    ),

    // Places And Routes

    // Places
    GoRoute(
      path: '/Places',
      builder: (context, state) => const Places(),
    ),
        GoRoute(
      path: '/TabletPlaces',
      builder: (context, state) => const TabletPlaces(),
    ),
    GoRoute(
      path: '/SelectedPlaces',
      builder: (context, state) => const SelectedPlaces(),
    ),
        GoRoute(
      path: '/TabletSelectedPlaces',
      builder: (context, state) => const TabletSelectedPlaces(),
    ),

    // Routes
    GoRoute(
      path: '/Routes',
      builder: (context, state) => const RoutesScreen(),
    ),
        GoRoute(
      path: '/TabletRoutes',
      builder: (context, state) => const TabletRoutes(),
    ),
    GoRoute(
      path: '/SelectedRoutes',
      builder: (context, state) => const SelectedRoutes(),
    ),
        GoRoute(
      path: '/TabletSelectedRoutes',
      builder: (context, state) => const TabletSelectedRoutes(),
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
      path: '/',
      builder: (context, state) => const BoardingScreen(),
    ),

    // User
    // Account
    //GoRoute(
    //  path: '/UserAccount',
    //  builder: (context, state) => const UserAccount(),
    //),
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
      path: '/TabletAchievemets',
      builder: (context, state) => const TabletAchievemets(),
    ),
    GoRoute(
      path: '/Favorites',
      builder: (context, state) => const Favorites(),
    ),
    GoRoute(
      path: '/TabletFavorites',
      builder: (context, state) => const TabletFavorites(),
    ),
    GoRoute(
      path: '/Photographs',
      builder: (context, state) => const Photographs(),
    ),
        GoRoute(
      path: '/TabletPhotographs',
      builder: (context, state) => const TabletPhotographs(),
    ),
    GoRoute(
      path: '/PlaceToVisit',
      builder: (context, state) => const PlaceToVisit(),
    ),
        GoRoute(
      path: '/TabletPlaceToVisit',
      builder: (context, state) => const TabletPlaceToVisit(),
    ),
    GoRoute(
      path: '/Profile',
      builder: (context, state) => const ProfileScreen(),
    ),
        GoRoute(
      path: '/TabletProfile',
      builder: (context, state) => const TabletProfile(),
    ),
    GoRoute(
      path: '/UserBlogs',
      builder: (context, state) => UserBlogs(),
    ),
        GoRoute(
      path: '/TabletUserBlogs',
      builder: (context, state) => TabletUserBlogs(),
    ),
    GoRoute(
      path: '/UserComments',
      builder: (context, state) => UserComments(),
    ),
        GoRoute(
      path: '/TabletUserComments',
      builder: (context, state) => TabletUserComments(),
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
