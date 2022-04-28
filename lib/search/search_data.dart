import 'package:flutter/material.dart';
import 'package:visor_de_datos_de_vuelos/apis/vuelos_api.dart';
import 'package:visor_de_datos_de_vuelos/models/vuelos.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  ApiVuelos apiProspectos = ApiVuelos();
  Future<List<Vuelos>> getProspecto(String strNombre) async {
    List<Vuelos> vuelos = [];
    final response = await apiProspectos.getProspectos(strNombre) ?? [];
    if (response != null) {
      vuelos = response;
    }
    return vuelos;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: las acciones del appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
    // throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono izquierda appbar
    return IconButton(
      icon: AnimatedIcon(
        progress: transitionAnimation,
        icon: AnimatedIcons.menu_arrow,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
        future: getProspecto(query),
        builder: (BuildContext context, AsyncSnapshot<List<Vuelos>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
                children: snapshot.data!.map((p) {
              return ListTile(
                title: Text(
                    "Origen: ${p.datavuelo.origin}-> Destino:${p.datavuelo.destination}"),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: FadeInImage(
                            placeholder: const AssetImage("img/giphy.gif"),
                            image: NetworkImage(
                                p.climaOrigen.current.weatherIcons[0])),
                      ),
                      Text("${p.climaOrigen.current.weatherDescriptions[0]}"),
                      const Text("-->"),
                      Container(
                        width: 30,
                        height: 30,
                        child: FadeInImage(
                            placeholder: const AssetImage("img/giphy.gif"),
                            image: NetworkImage(
                                p.climaDestino.current.weatherIcons[0])),
                      ),
                      Text("${p.climaDestino.current.weatherDescriptions[0]}"),
                    ],
                  ),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  close(context, null);
                  // Navigator.pushNamed(context, 'form', arguments: p);
                },
              );
            }).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
        future: getProspecto(query),
        builder: (BuildContext context, AsyncSnapshot<List<Vuelos>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
                children: snapshot.data!.map((p) {
              return Card(
                child: ListTile(
                  title: Text(
                      "Origen: ${p.datavuelo.origin}-> Destino:${p.datavuelo.destination}"),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: FadeInImage(
                              placeholder: const AssetImage("img/giphy.gif"),
                              image: NetworkImage(
                                  p.climaOrigen.current.weatherIcons[0])),
                        ),
                        Text("${p.climaOrigen.current.weatherDescriptions[0]}"),
                        const Text("-->"),
                        Container(
                          width: 30,
                          height: 30,
                          child: FadeInImage(
                              placeholder: const AssetImage("img/giphy.gif"),
                              image: NetworkImage(
                                  p.climaDestino.current.weatherIcons[0])),
                        ),
                        Text(
                            "${p.climaDestino.current.weatherDescriptions[0]}"),
                      ],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    close(context, null);
                    // Navigator.pushNamed(context, 'form', arguments: p);
                  },
                ),
              );
            }).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
