// ignore_for_file: unused_element

import 'package:fashion_app/src/Auth/view/login_screen.dart';
import 'package:fashion_app/src/Auth/view/registration_screen.dart';
import 'package:fashion_app/src/Categories/view/categories.dart';
import 'package:fashion_app/src/Categories/view/cateory_page.dart';
import 'package:fashion_app/src/Entrypoint/view/Entrypointpage.dart';
import 'package:fashion_app/src/Notification/view/notification.dart';
import 'package:fashion_app/src/Products/views/Productspage.dart';
import 'package:fashion_app/src/onboarding/view/onboardingpage.dart';
import 'package:fashion_app/src/profile/view/orderscreen.dart';
import 'package:fashion_app/src/profile/view/policy.dart';
import 'package:fashion_app/src/profile/view/shipping_order.dart';
import 'package:fashion_app/src/search/view/searchscreen.dart';
import 'package:fashion_app/src/splashscreen/view/splashscreenpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => AppEntryPoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    // GoRoute(
    //   path: '/review',
    //   builder: (context, state) => const ReviewsPage(),
    // ),
    GoRoute(
      path: '/policy',
      builder: (context, state) => const PolicyScreen(),
    ),
    // GoRoute(
    //   path: '/verification',
    //   builder: (context, state) => const VerificationPage(),
    // ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    // GoRoute(
    //   path: '/help',
    //   builder: (context, state) => const HelpCenterPage(),
    // ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const Orderscreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginSceen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) => const Cateorypage(),
    ),

    GoRoute(
      path: '/addaddress',
      builder: (context, state) => const ShippingOrder(),
    ),

    // GoRoute(
    //   path: '/addresses',
    //   builder: (context, state) => const AddressesListPage(),
    // ),

    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),

    //  GoRoute(
    //   path: '/tracking',
    //   builder: (context, state) => const TrackOrderPage(),
    // ),

    // GoRoute(
    //   path: '/checkout',
    //   builder: (context, state) => const CheckoutPage(),
    // ),

    //   GoRoute(
    //   path: '/successful',
    //   builder: (context, state) => const SuccessfulPayment(),
    // ),

    //   GoRoute(
    //   path: '/failed',
    //   builder: (context, state) => const FailedPayment(),
    // ),

    GoRoute(
      path: '/product/:id',
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id'];
        return Productpage(productID: productId.toString());
      },
    ),
  ],
);
GoRouter get router => _router;
