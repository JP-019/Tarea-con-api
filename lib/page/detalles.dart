import 'package:flutter/material.dart';
import '../model/give.dart';

class DrinkDetail extends StatelessWidget {
  const DrinkDetail({super.key, required this.drink});

  final give drink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.network(
                drink.url,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${drink.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description: Write your description here',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text('Ingredients'),
              value: false,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              title: Text('Feedback'),
              value: false,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              title: Text('Glasses'),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
