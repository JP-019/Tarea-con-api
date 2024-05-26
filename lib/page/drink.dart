import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/give.dart';

class BebidasLink extends StatefulWidget {
  const BebidasLink({Key? key}) : super(key: key);
//actualizacion
  @override
  _BebidasLinkState createState() => _BebidasLinkState();
}

class _BebidasLinkState extends State<BebidasLink> {
  int _currentIndex = 0;

  List<give> _drinks = [];
  late StreamSubscription
      _subscription; // Mantener una referencia a la suscripción

  @override
  void initState() {
    super.initState();
    _subscription = Stream.empty()
        .listen((_) {}); // Inicializar la suscripción con un Stream vacío

    _fetchDrinks();
  }

  @override
  void dispose() {
    _subscription.cancel(); // Cancelar la suscripción en dispose()
    super.dispose();
  }

  Future<void> _fetchDrinks() async {
    for (var i = 0; i < 10; i++) {
      final response = await http.get(
          Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/random.php"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var drinkData = (data['drinks'] as List).first;
        setState(() {
          _drinks.add(give(drinkData['strDrink'], drinkData['strDrinkThumb']));
        });
      } else {
        throw Exception("Fallo conexión");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebidas'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: _drinks.length,
        itemBuilder: (context, index) {
          final drink = _drinks[index];
          return GestureDetector(
            onTap: () {
              context.go(
                '/detalles',
              );
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.local_bar),
                title: Text(
                  drink.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go(
                    '/list'); // Cambia '/list' por la ruta de tu lista de bebidas
                break;
              case 2:
                context.go(
                    '/search'); // Cambia '/search' por la ruta de tu página de búsqueda
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list),
            label: 'List',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
