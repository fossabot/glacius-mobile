import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glacius_mobile/widgets/widgets.dart';

import 'bloc/bloc.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<OrderBloc>(context).add(LoadOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrdersLoaded) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('#' + state.orders[index].id.toString()),
                  ),
                  title: Text(state.orders[index].totalPrice.toString()),
                  subtitle: Text(state.orders[index].createdAt.toString()),
                );
              },
            );
          }
          return Spinner.withScaffold(context);
        },
      ),
    );
  }
}
