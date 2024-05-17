import 'package:example/presentation/widgets/cards/product_card_widget.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.62),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          ProductCardWidget(product: products[index]),
    );
  }
}
