import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_de_datos_de_vuelos/apis/auth_api.dart';
import 'package:visor_de_datos_de_vuelos/pages/check_auth_page.dart';
import 'package:visor_de_datos_de_vuelos/pages/home.dart';
import 'package:visor_de_datos_de_vuelos/pages/login.dart';
import 'package:visor_de_datos_de_vuelos/pages/register.dart';
import 'package:visor_de_datos_de_vuelos/providers/vuelos_provider_service.dart';
import 'package:visor_de_datos_de_vuelos/services/notification_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VuelosProviderService()),
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: MaterialApp(
        title: 'Vuelos',
        scaffoldMessengerKey: NotificationService.messenger,
        debugShowCheckedModeBanner: false,
        initialRoute: "check",
        routes: {
          "/": (context) => HomePage(),
          "login": (context) => LoginPage(),
          "register": (context) => RegisterPage(),
          "check": (context) => CheckAuthPage()
        },
      ),
    );
  }
}
