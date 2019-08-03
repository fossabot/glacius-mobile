import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
  LoginState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  ProgressDialog progressDialog = new ProgressDialog(
    viewService.context,
    ProgressDialogType.Normal,
  );
  progressDialog.setMessage('Logging in...');

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
            padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 128.0,
                    width: 128.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      radius: 100.0,
                      child: Text(
                        "G",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Glacius MSS',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(viewService.context).size.width,
            margin: EdgeInsets.only(left: 40.0, right: 40.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 0.0, right: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    right: 00.0,
                  ),
                  child: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: state.emailEditController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(viewService.context).size.width,
            margin: EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 10.0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 0.0, right: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    right: 00.0,
                  ),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: state.passwordEditController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          buildErrorMsg(state, viewService),
          buildLoginButton(state, dispatch, viewService, progressDialog),
          Container(
            width: MediaQuery.of(viewService.context).size.width,
            margin: EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 10.0,
            ),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Forget your password?",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(),
          ),
          Container(
            width: MediaQuery.of(viewService.context).size.width,
            margin: EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 10.0,
              bottom: 20.0,
            ),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      'Don\'t have an account? Create One',
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildLoginButton(
  LoginState state,
  Dispatch dispatch,
  ViewService viewService,
  ProgressDialog progressDialog,
) {
  return Container(
    width: MediaQuery.of(viewService.context).size.width,
    margin: EdgeInsets.only(
      left: 40.0,
      right: 40.0,
      top: 30.0,
    ),
    alignment: Alignment.center,
    child: Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            color: Color(0xfff65aa3),
            onPressed: () {
              dispatch(LoginActionCreator.onLogin(progressDialog));
            },
            child: Text(
              "Log In",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildErrorMsg(LoginState state, ViewService viewService) {
  if (state.loginResult == LoginResult.LoginFailure) {
    return Container(
      width: MediaQuery.of(viewService.context).size.width,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      alignment: Alignment.center,
      child: Text(
        state.errorMsg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  return Container();
}
