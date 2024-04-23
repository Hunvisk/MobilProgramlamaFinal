// ignore_for_file: prefer_const_constructors
import 'package:go_router/go_router.dart';

import '../desktopScreens/app_details/desktopvipgezgininfo.dart';
import '../desktopScreens/places_and_routes/desktopmap.dart';
import '../desktopScreens/places_and_routes/places/desktopplaces.dart';
import '../desktopScreens/places_and_routes/places/desktopselectedplaces.dart';
import '../desktopScreens/places_and_routes/routes/desktoproutes.dart';
import '../desktopScreens/places_and_routes/routes/desktopselectedroutes.dart';
import '../desktopScreens/shopping/product/desktopSelectedProducts.dart';
import '../desktopScreens/shopping/product/desktopproducs.dart';
import '../desktopScreens/user/account/desktopAddCard.dart';
import '../desktopScreens/user/account/desktopCardsİnfo.dart';
import '../desktopScreens/user/account/desktopforgotPassword.dart';
import '../desktopScreens/user/desktoplogin.dart';
import '../desktopScreens/user/desktopregister.dart';
import '../desktopScreens/user/profile/desktopachievements.dart';
import '../desktopScreens/user/profile/desktopblogs.dart';
import '../desktopScreens/user/profile/desktopcomments.dart';
import '../desktopScreens/user/profile/desktopfavorites.dart';
import '../desktopScreens/user/profile/desktopphotographs.dart';
import '../desktopScreens/user/profile/desktopplacestovisit.dart';
import '../desktopScreens/user/profile/desktopprofile.dart';
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
import '../tabletscreens.dart/places_and_routes/tabletmap.dart';
import '../tabletscreens.dart/shopping/product/tabletproducs.dart';
import '../tabletscreens.dart/shopping/product/tabletselectedproducts.dart';
import '../tabletscreens.dart/user/account/tabletaddcard.dart';
import '../tabletscreens.dart/user/account/tabletcardsinfo.dart';
import '../tabletscreens.dart/user/account/tabletforgotpassword.dart';
import '../tabletscreens.dart/user/profile/tabletachievements.dart';
import '../tabletscreens.dart/user/profile/tabletfavorites.dart';
import '../tabletscreens.dart/user/profile/tabletphotographs.dart';
import '../tabletscreens.dart/user/profile/tabletplacestovisit.dart';
import '../tabletscreens.dart/user/profile/tabletprofile.dart';
import '../tabletscreens.dart/user/profile/tabletuserblogs.dart';
import '../tabletscreens.dart/user/profile/tabletusercomments.dart';
import '../tabletscreens.dart/user/tabletlogin.dart';
import '../tabletscreens.dart/user/tabletregister.dart';

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
      path: '/DesktopVipGezginInfo',
      builder: (context, state) => const DesktopVipGezginInfo(),
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
      path: '/DesktopPlaces',
      builder: (context, state) => const DesktopPlaces(),
    ),
    GoRoute(
      path: '/SelectedPlaces',
      builder: (context, state) => const SelectedPlaces(),
    ),
    GoRoute(
      path: '/TabletSelectedPlaces',
      builder: (context, state) => const TabletSelectedPlaces(),
    ),
    GoRoute(
      path: '/DesktopSelectedPlaces',
      builder: (context, state) => const DesktopSelectedPlaces(),
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
      path: '/DesktopRoutes',
      builder: (context, state) => const DesktopRoutes(),
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
      path: '/DesktopSelectedRoutes',
      builder: (context, state) => const DesktopSelectedRoutes(),
    ),
    GoRoute(
      path: '/Map',
      builder: (context, state) => const MyMap(),
    ),
    GoRoute(
      path: '/TabletMap',
      builder: (context, state) => const TabletMap(),
    ),
    GoRoute(
      path: '/DesktopMap',
      builder: (context, state) => const DesktopMap(),
    ),

    // Shopping
    // Product
    GoRoute(
      path: '/Products',
      builder: (context, state) => const Products(),
    ),
    GoRoute(
      path: '/TabletProducts',
      builder: (context, state) => const TabletProducts(),
    ),
    GoRoute(
      path: '/DesktopProducts',
      builder: (context, state) => const DesktopProducts(),
    ),
    GoRoute(
      path: '/SelectedProducts',
      builder: (context, state) => const SelectedProducts(),
    ),
    GoRoute(
      path: '/TabletSelectedProducts',
      builder: (context, state) => const TabletSelectedProducts(),
    ),
    GoRoute(
      path: '/DesktopSelectedProducts',
      builder: (context, state) => const DesktopSelectedProducts(),
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
      path: '/TabletCardsInfo',
      builder: (context, state) => const TabletCardsInfo(),
    ),
    GoRoute(
      path: '/DesktopCardsInfo',
      builder: (context, state) => const DesktopCardsInfo(),
    ),
    GoRoute(
      path: '/AddCard',
      builder: (context, state) => const AddCard(),
    ),
    GoRoute(
      path: '/TabletAddCard',
      builder: (context, state) => const TabletAddCard(),
    ),
    GoRoute(
      path: '/DesktopAddCard',
      builder: (context, state) => const DesktopAddCard(),
    ),
    GoRoute(
      path: '/ForgotPassword',
      builder: (context, state) => const ForgotPassword(),
    ),
    GoRoute(
      path: '/TabletForgotPassword',
      builder: (context, state) => const TabletForgotPassword(),
    ),
    GoRoute(
      path: '/DesktopForgotPassword',
      builder: (context, state) => const DesktopForgotPassword(),
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
      path: '/DesktopAchievemets',
      builder: (context, state) => const DesktopAchievemets(),
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
      path: '/DesktopFavorites',
      builder: (context, state) => const DesktopFavorites(),
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
      path: '/DesktopPhotographs',
      builder: (context, state) => const DesktopPhotographs(),
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
      path: '/DesktopPlaceToVisit',
      builder: (context, state) => const DesktopPlaceToVisit(),
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
      path: '/DesktopProfile',
      builder: (context, state) => const DesktopProfile(),
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
      path: '/DesktopUserBlogs',
      builder: (context, state) => DesktopUserBlogs(),
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
      path: '/DesktopUserComments',
      builder: (context, state) => DesktopUserComments(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/TabletLogin',
      builder: (context, state) => TabletLogin(),
    ),
    GoRoute(
      path: '/DesktopLogin',
      builder: (context, state) => const DesktopLogin(),
    ),
    GoRoute(
      path: '/Register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/TabletRegister',
      builder: (context, state) => TabletRegister(),
    ),
    GoRoute(
      path: '/DesktopRegister',
      builder: (context, state) => DesktopRegister(),
    ),
    GoRoute(
      path: '/Home',
      builder: (context, state) => Home(),
    ),
  ],
);
