import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../consts/url.dart';

class GridViewProduct extends StatelessWidget {
  GridViewProduct({super.key});


  final List<Map<String, String>> products = [
    {"image": GridUrl.gImageUrl1, "name": "product_1"},
    {"image":GridUrl.gImageUrl2,"name": "product_2"},
    {"image":GridUrl.gImageUrl3,"name": "product_3"},
    {"image":GridUrl.gImageUrl3,"name": "product_4"},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio:(screenWidth / 2) / (screenWidth * 0.6),
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image.network(products[index]['image']!, height: screenWidth*0.3, width: screenWidth *0.5),
              const SizedBox(height: 8),
              Text(products[index]['name']!.tr(),),
              const SizedBox(height: 6),
              IconButton(
                alignment: Alignment.bottomCenter,
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('${products[index]['name']!.tr()} added to cart'.tr())),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
