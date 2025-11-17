import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  final String description =
      "High-quality running shoes designed for comfort, performance, and style — perfect for running or everyday wear.";

  buildColumn() => Column(
    children: [
      const SizedBox(height: 20.0),
      Row(
        children: [
          Expanded(
            child: Image.asset('assets/img/shoes.jpg', fit: BoxFit.contain),
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('PRODUCT NAME: NIKE', style: TextStyle(fontSize: 18.0)),
          Text('PRICE: \$500', style: TextStyle(fontSize: 18.0)),
        ],
      ),
      const SizedBox(height: 20.0),
      Row(
        children: [
          Expanded(
            child: Text(
              "DESCRIPTION: \n High-quality running shoes designed for comfort, performance, and style — perfect for running or everyday wear",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    ],
  );

  buildRatingAndButton(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: const [
          Text('Rating: ', style: TextStyle(fontSize: 18)),
          Icon(Icons.star, color: Colors.amber, size: 28),
          Icon(Icons.star, color: Colors.amber, size: 28),
          Icon(Icons.star, color: Colors.amber, size: 28),
        ],
      ),
      ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Added to Cart!')));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'ADD TO CART',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'STORE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: false, // keep it aligned to the left
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pop(context); // go back when tapped
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            buildColumn(),
            const SizedBox(height: 20),
            buildRatingAndButton(context),
          ],
        ),
      ),
    );
  }
}
