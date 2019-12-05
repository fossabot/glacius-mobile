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
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrdersLoaded) {
            return ListView.separated(
              itemCount: state.orders.length,
              separatorBuilder: (context, index) {
                return Divider(height: 0.0);
              },
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('#' + state.orders[index].id.toString()),
                  ),
                  title: Text(state.orders[index].totalPrice.toString()),
                  subtitle: Text(state.orders[index].createdAt.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
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
