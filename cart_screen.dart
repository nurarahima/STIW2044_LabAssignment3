import 'package:flutter/material.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.cart.length,
            itemBuilder: (context, index) {
              var book = cartProvider.cart[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text('Price: RM ${book.price}\nQuantity: ${book.quantity}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    cartProvider.removeFromCart(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookDetailsScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );

    ListTile(
      title: Text(book.title),
      subtitle: Text('Price: RM ${book.price}\nQuantity: ${book.quantity}'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _showDeleteDialog(book); // Call the delete dialog method
    },
  ),
);,

  }
}
