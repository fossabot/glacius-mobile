import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:glacius_mobile/src/plugins/auth_plugin.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1.0, 0.0),
            colors: [Color(0xFFE0E0E0), Color(0xFFEEEEEE)],
            tileMode: TileMode.repeated),
      ),
      height: MediaQuery.of(viewService.context).size.height,
      child: ListView(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                AuthPlugin().user['name'],
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
            ),
          ),
          Container(
            child: Center(child: Builder(builder: (BuildContext context) {
              return RaisedButton(
                onPressed: () {
                  dispatch(HomeActionCreator.onLogout());
                },
                child: Text('Logout'),
              );
            })),
          )
        ],
      ),
    ),
  );
}
