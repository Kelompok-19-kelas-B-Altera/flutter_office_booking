import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../constants.dart';

class GraphqlService {
  static HttpLink httpLink = HttpLink(
    baseUrl + 'graphql/',
  );

  static Link link = httpLink;

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
}
