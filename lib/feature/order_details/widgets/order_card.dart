import 'package:flutter/material.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key,required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white, 
              width: 80,
              height: 80,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text("Color: White\nSize: 40", style: TextStyle(fontSize: 13)),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity: 1", style: TextStyle(fontSize: 13)),
                    Text(
                      "Price: \$${product.price.toString()}",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Text("GST: 25%", style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
