import 'package:flutter/material.dart';
import 'package:flutterfinalproje/screens/core/settings.dart';
import 'package:go_router/go_router.dart';

import '../dashboard/dashboard.dart';
import '../desktopScreens/app_details/desktopvipgezgininfo.dart';
import '../desktopScreens/places_and_routes/desktopmap.dart';
import '../desktopScreens/places_and_routes/places/desktopplaces.dart';
import '../desktopScreens/places_and_routes/places/desktopselectedplaces.dart';
import '../desktopScreens/places_and_routes/routes/desktoproutes.dart';
import '../desktopScreens/places_and_routes/routes/desktopselectedroutes.dart';
import '../desktopScreens/shopping/product/desktop_selected_products.dart';
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
import '../screens/app_details/vipgezgininfo.dart';
import '../screens/Home.dart';
import '../screens/core/change_language.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/places_and_routes/map.dart';
import '../screens/places_and_routes/places/places.dart';
import '../screens/places_and_routes/places/selectedplaces.dart';
import '../screens/places_and_routes/routes/routes.dart';
import '../screens/places_and_routes/routes/selectedroutes.dart';
import '../screens/settings_screens/about_app.dart';
import '../screens/settings_screens/add_mail.dart';
import '../screens/settings_screens/add_phone_number.dart';
import '../screens/settings_screens/notifications.dart';
import '../screens/settings_screens/past_payments.dart';
import '../screens/settings_screens/permissions.dart';
import '../screens/settings_screens/theme_mode.dart';
import '../screens/shopping/product/products.dart';
import '../screens/shopping/product/selectedproducts.dart';
import '../screens/static/boarding.dart';
import '../screens/settings_screens/addcard.dart';
import '../screens/user/account/cardsinfo.dart';
import '../screens/user/account/forgot_password.dart';
import '../screens/user/Login.dart';
import '../screens/user/profile/achievements.dart';
import '../screens/user/profile/saved.dart';
import '../screens/user/profile/photographs.dart';
import '../screens/user/profile/placestovisit.dart';
import '../screens/user/profile/profile.dart';
import '../screens/user/profile/saved_screens/saved_places.dart';
import '../screens/user/profile/saved_screens/saved_routes.dart';
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

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => DashboardScreen(
        state: state,
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Home',
          pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Places',
          pageBuilder: (context, state) => const NoTransitionPage(child: PlacesScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletPlaces',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletPlaces()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopPlaces',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopPlaces()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Map',
          pageBuilder: (context, state) => const NoTransitionPage(child: MyMap()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletMap',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletMap()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopMap',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopMap()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Routes',
          pageBuilder: (context, state) => const NoTransitionPage(child: RoutesScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletRoutes',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletRoutes()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopRoutes',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopRoutes()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/VipGezginInfo',
          pageBuilder: (context, state) => const NoTransitionPage(child: VipGezginInfo()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletVipGezginInfo',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletVipGezginInfo()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopVipGezginInfo',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopVipGezginInfo()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Profile',
          pageBuilder: (context, state) => const NoTransitionPage(child: ProfileScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletProfile',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletProfile()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopProfile',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopProfile()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/SavedPlaces',
          pageBuilder: (context, state) => const NoTransitionPage(child: SavedPlacesScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/SavedRoutes',
          pageBuilder: (context, state) => const NoTransitionPage(child: SavedRoutesScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Saved',
          pageBuilder: (context, state) => const NoTransitionPage(child: SavedScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletFavorites',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletFavorites()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopFavorites',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopFavorites()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Photographs',
          pageBuilder: (context, state) => const NoTransitionPage(child: Photographs()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletPhotographs',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletPhotographs()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopPhotographs',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopPhotographs()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/PlaceToVisit',
          pageBuilder: (context, state) => const NoTransitionPage(child: PlaceToVisit()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletPlaceToVisit',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletPlaceToVisit()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopPlaceToVisit',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopPlaceToVisit()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/UserBlogs',
          pageBuilder: (context, state) => const NoTransitionPage(child: UserBlogs()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletUserBlogs',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletUserBlogs()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopUserBlogs',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopUserBlogs()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/UserComments',
          pageBuilder: (context, state) => const NoTransitionPage(child: UserComments()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletUserComments',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletUserComments()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopUserComments',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopUserComments()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Products',
          pageBuilder: (context, state) => const NoTransitionPage(child: Products()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletProducts',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletProducts()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopProducts',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopProducts()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/SelectedProducts',
          pageBuilder: (context, state) => const NoTransitionPage(child: SelectedProducts()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/TabletSelectedProducts',
          pageBuilder: (context, state) => const NoTransitionPage(child: TabletSelectedProducts()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/DesktopSelectedProducts',
          pageBuilder: (context, state) => const NoTransitionPage(child: DesktopSelectedProducts()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Achievemets',
          pageBuilder: (context, state) => const NoTransitionPage(child: Achievemets()),
        ),
      ]
    ),

            GoRoute(
              path: '/ChatBot',
              builder: (context, state) => const ChatBot(),
            ),
            GoRoute(
              path: '/SettingsScreen',
              builder: (context, state) => const SettingsScreen(),
            ),
            // Settings Screens
            GoRoute(
              path: '/Change_LanguageScreen',
              builder: (context, state) => const Change_LanguageScreen(),
            ),
            GoRoute(
              path: '/AboutApp',
              builder: (context, state) => const AboutAppScreen(),
            ),
            GoRoute(
              path: '/AddMail',
              builder: (context, state) => const AddMailScreen(),
            ),
            GoRoute(
              path: '/AddPhoneNumber',
              builder: (context, state) => const AddPhoneNumberScreen(),
            ),
            GoRoute(
              path: '/Notifications',
              builder: (context, state) => const NotificationsScreen(),
            ),
            GoRoute(
              path: '/PastPayments',
              builder: (context, state) => const PastPaymentsScreen(),
            ),
            GoRoute(
              path: '/Permissions',
              builder: (context, state) => const PermissionsScreen(),
            ),
            GoRoute(
              path: '/ThemeMode',
              builder: (context, state) => const ThemeModeScreen(),
            ),
            // Profile Screens
            
            GoRoute(
              path: '/TabletAchievemets',
              builder: (context, state) => const TabletAchievemets(),
            ),
            GoRoute(
              path: '/DesktopAchievemets',
              builder: (context, state) => const DesktopAchievemets(),
            ),
            GoRoute(
              path: '/SelectedPlaces',
              builder: (context, state) => SelectedPlaces(place: state.extra as Map<String, dynamic>,),
            ),
            GoRoute(
              path: '/TabletSelectedPlaces',
              builder: (context, state) => const TabletSelectedPlaces(),
            ),
            GoRoute(
              path: '/DesktopSelectedPlaces',
              builder: (context, state) => const DesktopSelectedPlaces(),
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
    // Loader
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    // Boarding
    GoRoute(
      path: '/Boarding',
      builder: (context, state) => const BoardingScreen(),
    ),

    // Login 
    GoRoute(
      path: '/Login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/TabletLogin',
      builder: (context, state) => const TabletLogin(),
    ),
    GoRoute(
      path: '/DesktopLogin',
      builder: (context, state) => const DesktopLogin(),
    ),
    //Register
    GoRoute(
      path: '/Register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/TabletRegister',
      builder: (context, state) => const TabletRegister(),
    ),
    GoRoute(
      path: '/DesktopRegister',
      builder: (context, state) => const DesktopRegister(),
    ),
    // Forgot Password
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
    

    GoRoute(
      path: '/Aboutus',
      builder: (context, state) => const AboutUs(),
    ),
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
  ]
);
