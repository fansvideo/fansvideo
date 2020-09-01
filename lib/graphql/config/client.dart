import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static String _token;
  static String graphqlUrl = 'http://localhost:9002/graphql';//'https://fansvideo-hasura.herokuapp.com/v1/graphql';

  static final HttpLink httpLink = HttpLink(
    uri: Config.graphqlUrl,
//    headers: <String, String>{'Authorization': _token},
  );

  static final AuthLink authLink = AuthLink(getToken: () => _token);

  static final WebSocketLink websocketLink = WebSocketLink(
    url: 'ws://localhost:9002/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initPayload: () => {
        'headers': {'Authorization': _token},
      },
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(websocketLink);

  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: link,
      ),
    );
    return client;
  }
}
