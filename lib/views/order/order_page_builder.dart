import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glacius_mobile/bloc/shop/shop_bloc.dart';
import 'package:glacius_mobile/repositories/repositories.dart';
import 'package:glacius_mobile/views/order/order.dart';
import 'bloc/bloc.dart';

class OrderPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      builder: (context) => OrderRepository(),
      child: BlocProvider<OrderBloc>(
        builder: (context) {
          return OrderBloc(
            orderRepository: RepositoryProvider.of<OrderRepository>(context),
            shopBloc: BlocProvider.of<ShopBloc>(context),
          );
        },
        child: OrderPage(),
      ),
    );
  }
}
