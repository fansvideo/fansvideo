import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

final OptimisticCache cache = OptimisticCache(
  dataIdFromObject: typenameDataIdFromObject,
);

ValueNotifier<GraphQLClient> clientFor({
  @required String uri,
  String subscriptionUri,
}) {
  Link link = HttpLink(uri: uri);
  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      url: subscriptionUri,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
      ),
    );

    link = link.concat(websocketLink);
  }

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: cache,
      link: link,
    ),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class FansGraphqlProvider extends StatelessWidget {
  FansGraphqlProvider({
    @required this.child,
    @required String uri,
    String subscriptionUri,
  }) : client = clientFor(
    uri: uri,
    subscriptionUri: subscriptionUri,
  );

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}