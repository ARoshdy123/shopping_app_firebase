
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/widgets/display_product.dart';
import 'package:shopping_app_firebase/widgets/grid_view.dart';
import 'package:shopping_app_firebase/widgets/hot_offers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shopping_app_title'.tr()),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              if (context.locale == Locale('en', 'US')) {
                context.setLocale(Locale('ar', 'EG'));
              } else {
                context.setLocale(Locale('en', 'US'));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'our_products'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DisplayProducts(),
              const SizedBox(height: 20),
              GridViewProduct(),
              const SizedBox(height: 20),
              Text(
                'hot_offers'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              HotOffers(),
            ],
          ),
        ),
      ),
    );
  }
}
