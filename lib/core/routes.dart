import 'package:flutter_advanced_dev/screens/Restaurant/BaslangicScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/AnaYemekScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/BeyazFirinScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/BigChefsScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/KahvaltiScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/SalataScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/SutisScreen.dart';
import 'package:flutter_advanced_dev/screens/Restaurant/TatliScreen.dart';
import 'package:flutter_advanced_dev/screens/RestaurantScreen.dart';
import 'package:flutter_advanced_dev/screens/client/logins.dart';
import 'package:flutter_advanced_dev/screens/static/kategori.dart';
import 'package:go_router/go_router.dart';
import '../screens/client/register.dart';
import '../screens/client/LoginScreen.dart';
import '../screens/client/profile.dart';
import '../screens/core/loader.dart';
import '../screens/core/settings.dart';
import '../screens/home.dart';
import '../screens/payment/payment.dart';
import '../screens/product/brands.dart';
import '../screens/product/cart.dart';
import '../screens/product/favorites.dart';
import '../screens/product/product.dart';
import '../screens/product/products.dart';
import '../screens/product/search.dart';
import '../screens/static/about.dart';
import '../screens/static/boarding.dart';
import '../screens/static/contact.dart';
import '../screens/static/ip.dart';
import '../screens/static/preview.dart';
import '../screens/static/translator.dart';
import '../screens/Restaurant/product_detail_screen.dart';

// GoRouter configuration
final routes = GoRouter(
  initialLocation:
      '/BoardingScreen', // İlk açılış sayfası olarak RestaurantScreen'i belirliyoruz
  errorBuilder: (context, state) => const LoginScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/preview',
      builder: (context, state) => const PreviewScreen(),
    ),
    GoRoute(
      path: '/ip',
      builder: (context, state) => const IPScreen(),
    ),
    GoRoute(
      path: '/translate',
      builder: (context, state) => const TranslateScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/brands',
      builder: (context, state) => const BrandsScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      path: "/products",
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: "/favorites",
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: "/cart",
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/restaurant',
      builder: (context, state) => const RestaurantScreen(),
    ),
    GoRoute(
      path: '/sutis',
      builder: (context, state) => const SutisScreen(),
    ),
    GoRoute(
      path: '/beyazfirin',
      builder: (context, state) => const BeyazFirinScreen(),
    ),
    GoRoute(
      path: '/bigchefs',
      builder: (context, state) => const BigChefsScreen(),
    ),
    GoRoute(
      path: '/logins',
      builder: (context, state) => const Logins(),
    ),
    GoRoute(
      path: '/salata',
      builder: (context, state) => const SalataScreen(),
    ),
    GoRoute(
      path: '/kahvalti',
      builder: (context, state) => const KahvaltiScreen(),
      routes: [
        GoRoute(
          path: 'details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ProductDetailScreen(id: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/baslangic',
      builder: (context, state) => const BaslangicScreen(),
    ),
    GoRoute(
      path: '/anayemek',
      builder: (context, state) => const AnaYemekScreen(),
    ),
    GoRoute(
      path: '/tatli',
      builder: (context, state) => const TatliScreen(),
    ),
    GoRoute(
      path: '/kategori',
      builder: (context, state) => const KategoriScreen(),
    ),
    GoRoute(
      path: '/BoardingScreen',
      builder: (context, state) => const BoardingScreen(),
    ),
  ],
);
