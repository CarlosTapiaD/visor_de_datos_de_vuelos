import 'package:flutter/material.dart';
import 'package:visor_de_datos_de_vuelos/apis/auth_api.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login.dart';

class CheckAuthPage extends StatelessWidget {
  const CheckAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: authService.readToken(),
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return const Text("Esper");
          }
          if (asyncSnapshot.data == '') {
            Future.microtask(() => {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) {
                          return const LoginPage();
                        },
                        transitionDuration: const Duration(seconds: 0)),
                  )
                });
          } else {
            Future.microtask(() => {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) {
                          return const HomePage();
                        },
                        transitionDuration: const Duration(seconds: 0)),
                  )
                });
          }

          return Container();
        },
      )),
    );
  }
}
