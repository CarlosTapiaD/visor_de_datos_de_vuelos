import 'package:flutter/material.dart';
import 'package:visor_de_datos_de_vuelos/models/vuelos.dart';
import 'package:visor_de_datos_de_vuelos/providers/vuelos_provider_service.dart';
import 'package:provider/provider.dart';

import '../search/search_data.dart';
import '../widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prospectosProviderService =
        Provider.of<VuelosProviderService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vuelos"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: const DrawerWidget(),
      body: prospectosProviderService.listaVuelos.length == 0
          ? const Center(
              child: Text("Sin vuelos registrados"),
            )
          : ListView.builder(
              itemCount: prospectosProviderService.listaVuelos.length,
              itemBuilder: (_, index) {
                Vuelos p = prospectosProviderService.listaVuelos[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        // Navigator.pushNamed(context, "form", arguments: p);
                      },
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("N. de vuelo"),
                          Text(p.datavuelo.flightNum)
                        ],
                      ),
                      title: Text(
                          "Origen: ${p.datavuelo.origin}-> Destino:${p.datavuelo.destination}"),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              child: Container(
                                width: 30,
                                height: 30,
                                child: FadeInImage(
                                    placeholder:
                                        const AssetImage("img/giphy.gif"),
                                    image: NetworkImage(
                                        p.climaOrigen.current.weatherIcons[0])),
                              ),
                            ),
                            Text(
                                "${p.climaOrigen.current.weatherDescriptions[0]}"),
                            const Text("-->"),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              child: Container(
                                width: 30,
                                height: 30,
                                child: FadeInImage(
                                    placeholder:
                                        const AssetImage("img/giphy.gif"),
                                    image: NetworkImage(p
                                        .climaDestino.current.weatherIcons[0])),
                              ),
                            ),
                            Text(p.climaDestino.current.weatherDescriptions[0]),
                          ],
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_right,
                        size: 24,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}


// Text(
//                           " ${p.climaOrigen.current.weatherDescriptions[0]} -->${p.climaDestino.current.weatherDescriptions[0]} ")