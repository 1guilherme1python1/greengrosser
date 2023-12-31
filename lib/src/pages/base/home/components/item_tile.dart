import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;
  final Future Function() cartAdd;
  final GlobalKey imageGk = GlobalKey();

  ItemTile(
      {super.key,
      required this.item,
      required this.cartAnimationMethod,
      required this.cartAdd});

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Image
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Container(
                        key: imageGk,
                        child: Image.asset(
                          item.imgUrl,
                        ),
                      ),
                    ),
                  ),
                  //Name
                  Text(
                    item.itemName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //Price - unit
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              child: Material(
                child: InkWell(
                  onTap: () {
                    cartAnimationMethod(imageGk);
                    cartAdd();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                    ),
                    height: 40,
                    width: 35,
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
