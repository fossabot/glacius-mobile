import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:glacius_mobile/views/dashboard/dashboard.dart';
import 'package:glacius_mobile/views/order/order.dart';
import 'package:glacius_mobile/views/product/product.dart';
import 'package:glacius_mobile/views/profile/profile.dart';

abstract class LayoutState extends Equatable {
  final int selectedPageIndex;
  final List<Widget> pages = <Widget>[
    DashboardPage(),
    OrderPageBuilder(),
    ProductPage(),
    ProfilePage(),
  ];

  LayoutState({@required this.selectedPageIndex});

  @override
  List<Object> get props => [pages, selectedPageIndex];
}

class LayoutInitial extends LayoutState {
  LayoutInitial() : super(selectedPageIndex: 3);
}

class LayoutPageChanged extends LayoutState {
  LayoutPageChanged({@required selectedPageIndex})
      : super(selectedPageIndex: selectedPageIndex);
}
