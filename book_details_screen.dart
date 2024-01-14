import 'package:flutter/material.dart';
import 'cart_provider.dart';

class BookDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assume Book data is obtained from the server or other sources
    var book = Book(
      title: 'Sample Book',
      price: 25.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Book Title: ${book.title}'),
            Text('Price: RM ${book.price}'),
            ElevatedButton(
             onPressed: () {
               // Check if the book is already in the cart
              bool isInCart = CartProvider().isBookInCart(book);

              if (!isInCart) {
                CartProvider().addToCart(book);
                Navigator.pop(context); // Go back to the Cart Screen
              } else {
                // Show an alert or snackbar indicating the book is already in the cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('This book is already in your cart.'),
        ),
      );
    }
  },
  child: Text('Add to Cart'),
),
