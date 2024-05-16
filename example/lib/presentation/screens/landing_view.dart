import 'package:example/domain/providers/main_screen_provider.dart';
import 'package:example/presentation/screens/categories_view.dart';
import 'package:example/presentation/screens/product_categories_view.dart';
import 'package:example/presentation/screens/product_grid_view.dart';
import 'package:example/presentation/widget/circular_progress_indicator_widget.dart';
import 'package:example/presentation/widget/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainScreenProvider = context.watch<MainScreenProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextTittleWidget(tittle: 'Todas las categorias:'),
            const SizedBox(height: 10),
            (mainScreenProvider.categories != null)
                ? CategoriesView(categories: mainScreenProvider.categories!)
                : const CircularProgressIndicatorWidget(),
            const SizedBox(height: 10),
            TextTittleWidget(
                tittle:
                    'Productos de la categoria ${mainScreenProvider.category}:'),
            const SizedBox(height: 10),
            (mainScreenProvider.categoryProducts != null)
                ? ProductCategoriesView(
                    products: mainScreenProvider.categoryProducts!)
                : const CircularProgressIndicatorWidget(),
            const SizedBox(height: 10),
            const TextTittleWidget(tittle: 'Todos nuestros productos:'),
            const SizedBox(height: 10),
            (mainScreenProvider.products != null)
                ? ProductGridView(products: mainScreenProvider.products!)
                : const CircularProgressIndicatorWidget(),
          ],
        ),
      ),
    );
  }
}
