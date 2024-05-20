import 'package:example/presentation/widgets/cards/product_card_widget.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCategoriesWidget extends StatelessWidget {
  final List<ProductModel> products;
  const ProductCategoriesWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) =>
            ProductCardWidget(product: products[index]),
      ),
    );
  }
}
