import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glacius_mobile/utils/utils.dart';
import 'package:glacius_mobile/widgets/widgets.dart';
import 'package:uni_links/uni_links.dart';
import 'bloc/bloc.dart';
import 'widgets/widgets.dart';

class NotificationIntegrationSettingPage extends StatefulWidget {
  @override
  _NotificationIntegrationSettingPageState createState() =>
      _NotificationIntegrationSettingPageState();
}

class _NotificationIntegrationSettingPageState
    extends State<NotificationIntegrationSettingPage> {
  StreamSubscription _callbackSubscription;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<NotificationIntegrationSettingBloc>(context)
        .add(LoadNotificationIntegrations());

    _callbackSubscription = getUriLinksStream().listen((Uri uri) {
      BlocProvider.of<NotificationIntegrationSettingBloc>(context)
          .add(LoadNotificationIntegrations());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _callbackSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationChannelBloc, NotificationChannelState>(
      listener: (context, state) {
        if (state is NotificationChannelDisableSuccess) {
          BlocProvider.of<NotificationIntegrationSettingBloc>(context)
              .add(LoadNotificationIntegrations());
        }

        if (state is NotificationChannelGetConnectUrlSuccess) {
          //start in browser
          OAuthHelper(
            browser: OAuthBrowser(onClosedCallback: () {
              BlocProvider.of<NotificationIntegrationSettingBloc>(context)
                  .add(LoadNotificationIntegrations());
            }),
          ).connect(state.url);
        }
      },
      child: BlocBuilder<NotificationIntegrationSettingBloc,
          NotificationIntegrationSettingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Notification Connection')),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: (state is NotificationIntegrationSettingLoaded)
                  ? Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('Telegram'),
                          trailing: EnableDisableButton(
                            integrations: state.integrations,
                            notificationChannel: 'telegram',
                          ),
                        ),
                      ],
                    )
                  : Spinner.configured(context),
            ),
          );
        },
      ),
    );
  }
}
