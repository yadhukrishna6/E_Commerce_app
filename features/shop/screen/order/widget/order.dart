import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/features/shop/screen/order/widget/order_list.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TappBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showbackarrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),
        child: TOrderListItems(),
      ),
    );
  }
}
