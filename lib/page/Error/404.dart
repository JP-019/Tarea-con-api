import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Error404 extends StatelessWidget {
  const Error404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Error 404',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Página no encontrada',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar de vuelta a la página de inicio
                context.go('/');
              },
              child: Text('Regresar a la página de inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
