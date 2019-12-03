import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glacius_mobile/utils/oauth_helper.dart';
import 'package:glacius_mobile/widgets/widgets.dart';
import 'package:uni_links/uni_links.dart';
import 'widgets/widgets.dart';
import 'bloc/bloc.dart';

class MarketplaceIntegrationSettingPage extends StatefulWidget {
  @override
  _MarketplaceIntegrationSettingPageState createState() =>
      _MarketplaceIntegrationSettingPageState();
}

class _MarketplaceIntegrationSettingPageState
    extends State<MarketplaceIntegrationSettingPage> {
  StreamSubscription _callbackSubscription;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<MarketplaceIntegrationSettingBloc>(context)
        .add(LoadMarketplaceIntegrations());

    _callbackSubscription = getUriLinksStream().listen((Uri uri) {
      BlocProvider.of<MarketplaceIntegrationSettingBloc>(context)
          .add(LoadMarketplaceIntegrations());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _callbackSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OAuthBloc, OAuthState>(
      listener: (context, state) {
        if (state is OAuthDisableSuccess) {
          BlocProvider.of<MarketplaceIntegrationSettingBloc>(context)
              .add(LoadMarketplaceIntegrations());
        }

        if (state is OAuthGetConnectUrlSuccess) {
          //start in browser
          OAuthHelper(
            browser: OAuthBrowser(onClosedCallback: () {
              BlocProvider.of<MarketplaceIntegrationSettingBloc>(context)
                  .add(LoadMarketplaceIntegrations());
            }),
          ).connect(state.url);
        }
      },
      child: BlocBuilder<MarketplaceIntegrationSettingBloc,
          MarketplaceIntegrationSettingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Marketplace Connection')),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: (state is MarketplaceIntegrationSettingLoaded)
                  ? Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('Shopify'),
                          trailing: EnableDisableButton(
                            integrations: state.integrations,
                            marketplace: 'shopify',
                            requiredFieldTitle: 'Shopify shop name',
                            requiredFieldOnConnect: 'shopify_shop',
                          ),
                        ),
                        ListTile(
                          title: Text('EasyStore'),
                          trailing: EnableDisableButton(
                            integrations: state.integrations,
                            marketplace: 'easystore',
                            requiredFieldTitle: 'Easystore shop name',
                            requiredFieldOnConnect: 'easystore_shop',
                          ),
                        ),
                        ListTile(
                          title: Text('Shopee'),
                          trailing: EnableDisableButton(
                            integrations: state.integrations,
                            marketplace: 'shopee',
                          ),
                        ),
                        ListTile(
                          title: Text('WooCommerce'),
                          trailing: EnableDisableButton(
                            integrations: state.integrations,
                            marketplace: 'woocommerce',
                            requiredFieldTitle: 'WooCommerce store url',
                            requiredFieldOnConnect: 'woocommerce_store_url',
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
