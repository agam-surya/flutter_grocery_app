import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/product_detail.dart';

import 'models/product.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetail(
            product: product,
          );
        }));
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.green,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product.images![0]!,
              child: SizedBox(
                width: 150,
                child: Image.network(product.images![0]!),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Rp ${product.price}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                product.title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: const [
                    Icon(
                      Icons.add_shopping_cart,
                      size: 20,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Beli",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.remove_circle_outline,
                      size: 18,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('0'),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      size: 18,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
