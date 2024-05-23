import 'package:example/domain/providers/main_screen_provider.dart';
import 'package:example/presentation/widgets/categories_widget.dart';
import 'package:example/presentation/widgets/containers/product_categories_widget.dart';
import 'package:example/presentation/widgets/containers/product_grid_widget.dart';
import 'package:example/presentation/widgets/circular_progress_indicator_widget.dart';
import 'package:example/presentation/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});

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
                ? CategoriesWidget(categories: mainScreenProvider.categories!)
                : const CircularProgressIndicatorWidget(),
            const SizedBox(height: 10),
            TextTittleWidget(
                tittle:
                    'Productos de la categoria ${mainScreenProvider.category}:'),
            const SizedBox(height: 10),
            (mainScreenProvider.categoryProducts != null)
                ? ProductCategoriesWidget(
                    products: mainScreenProvider.categoryProducts!)
                : const CircularProgressIndicatorWidget(),
            const SizedBox(height: 10),
            const TextTittleWidget(tittle: 'Todos nuestros productos:'),
            const SizedBox(height: 10),
            (mainScreenProvider.products != null)
                ? ProductGridWidget(products: mainScreenProvider.products!)
                : const CircularProgressIndicatorWidget(),
            FilledButton(
                onPressed: () {
                  mainScreenProvider.registerUser();
                },
                child: const Text('Registrar')),
            FilledButton(
                onPressed: () {
                  mainScreenProvider.loginUser();
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
