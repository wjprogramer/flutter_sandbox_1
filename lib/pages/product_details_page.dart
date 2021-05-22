import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel productModel;

  ProductDetailsPage({
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product ${productModel.name} Details'
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _title('Product Details'),
            _labelAndValue('ID', productModel.id),
            _labelAndValue('Name', productModel.name),
            _labelAndValue('Price', '\$${productModel.price}'),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _labelAndValue(String label, String value) {
    final labelStyle = TextStyle(
      fontSize: 20,
      color: Colors.grey,
    );
    final valueStyle = TextStyle(
      fontSize: 30,
      color: Colors.blue[700],
    );

    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 8, top: 24),
      child: Text.rich(
        TextSpan(
          text: '$label: ',
          style: labelStyle,
          children: [
            TextSpan(
              text: value,
              style: valueStyle,
            ),
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

}
