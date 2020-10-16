import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    uri: '<URL Here>',
  );

  static GraphQLClient getClient() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}
