import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:glacius_mobile/bloc/bloc.dart';
import 'package:glacius_mobile/models/models.dart';
import 'package:glacius_mobile/repositories/repositories.dart';
import 'package:glacius_mobile/views/order/bloc/bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;
  final ShopBloc shopBloc;

  OrderBloc({@required this.orderRepository, @required this.shopBloc});

  @override
  OrderState get initialState => OrderInitial();

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is LoadOrders) {
      yield OrdersLoading();
      List<Order> orders =
          await orderRepository.getOrders(shopId: shopBloc.getMyShop().id);
      yield OrdersLoaded(orders: orders);
    }
  }
}
