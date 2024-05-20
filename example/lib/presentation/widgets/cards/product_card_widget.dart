import 'package:example/presentation/widgets/rating_container_widget.dart';
import 'package:example/presentation/widgets/text_title_widget.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                product.image,
                height: 150,
              ),
            ),
            const SizedBox(height: 10),
            TextTittleWidget(tittle: product.title),
            const SizedBox(height: 5),
            TextTittleWidget(tittle: '\$ ${product.price}'),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingContainerWidget(
                    icon: Icons.remove_red_eye_rounded,
                    text: product.rating.count.toString()),
                RatingContainerWidget(
                  icon: Icons.star_rate_rounded,
                  text: product.rating.rate.toString(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
