import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/base/home/components/item_tile.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_shimmer.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import '../../common_widgets/app_name_widget.dart';
import 'components/category_tile.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  var _cartQuantityItems = 0;

  void itemSelectedCartAnimations(GlobalKey<State<StatefulWidget>> gkImage) {
    runAddToCartAnimation(gkImage);
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), (){
      setState(() {
        isLoading = false;
      });
    });
  }

  UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: _appBarLogo(),
        actions: [
          _cardButton(),
        ],
      ),
      body: AddToCartAnimation(
        // To send the library the location of the Cart icon
        cartKey: cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
          this.runAddToCartAnimation = runAddToCartAnimation;
        },
        child: Column(
          children: [
            _searchBar(),
            _categoriesBar(),
            Expanded(
                child: !isLoading
                    ? GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: app_data.items.length,
                        itemBuilder: (_, index) {
                          return ItemTile(
                            item: app_data.items[index],
                            cartAnimationMethod: itemSelectedCartAnimations,
                            cartAdd: () async {
                              await cartKey.currentState!.runCartAnimation(
                                  (++_cartQuantityItems).toString());
                            },
                          );
                        },
                      )
                    : GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                            10,
                            (index) => CustomShimmer(
                                  height: double.infinity,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(20),
                                )),
                      )),
          ],
        ),
      ),
    );
  }

  _appBarLogo() {
    return const AppNameWidget();
  }

  _cardButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 17, right: 18),
      child: GestureDetector(
        onTap: () {},
        child: Badge(
          child: AddToCartIcon(
            icon: Icon(
              Icons.shopping_cart,
              color: CustomColors.customSwatchColor,
            ),
            key: cartKey,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            hintText: 'Pesquisa frutaMix',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.search,
              size: 21,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none))),
      ),
    );
  }

  _categoriesBar() {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return CategoryTile(
              onPressed: () {
                setState(() {
                  selectedCategory = app_data.categorias[index];
                });
              },
              category: app_data.categorias[index],
              isSelected: app_data.categorias[index] == selectedCategory,
            );
          },
          separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
          itemCount: app_data.categorias.length)
    );
  }
}
