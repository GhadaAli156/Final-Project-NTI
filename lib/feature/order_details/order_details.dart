import 'package:flutter/material.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';
import 'package:project_nti_app/feature/order_details/widgets/address_card.dart';
import 'package:project_nti_app/feature/order_details/widgets/custom_button.dart';
import 'package:project_nti_app/feature/order_details/widgets/custom_status.dart';
import 'package:project_nti_app/feature/order_details/widgets/order_card.dart';
import 'package:project_nti_app/feature/order_details/widgets/payment.dart';
import 'package:project_nti_app/feature/order_details/widgets/section_tile.dart';

import '../../core/widget/custom_appbar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key,required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Order"),
            SizedBox(height: 10),
            OrderInfoCard(product: product,),

            SizedBox(height: 20),
            SectionTitle(title: "Delivery Address"),
            SizedBox(height: 10),
            DeliveryAddressCard(),

            SizedBox(height: 20),
            SectionTitle(title: "Payment Method"),
            SizedBox(height: 10),
            PaymentMethodCard(),

            SizedBox(height: 20),
            OrderButtons(),

            SizedBox(height: 20),
          
            CurrentStatusCard(model: product,),
          ],
        ),
      ),
    );
  }
}
