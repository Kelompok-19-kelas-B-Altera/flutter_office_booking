import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
