import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'services/graphql/graphql_service.dart';
import 'view_models/auth_view_model.dart';
import 'view_models/building_view_model.dart';
import 'view_models/chat_view_model.dart';
import 'view_models/detail_view_model.dart';
import 'view_models/review_view_model.dart';
import 'view_models/search_view_model.dart';
import 'views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, var client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
          ChangeNotifierProvider(create: (ctx) => BuildingViewModel()),
          ChangeNotifierProvider(create: (ctx) => DetailViewModel()),
          ChangeNotifierProvider(create: (ctx) => ReviewViewModel()),
          ChangeNotifierProvider(create: (ctx) => SearchViewModel()),
          ChangeNotifierProvider(create: (ctx) => ChatViewModel()),
        ],
        child: GraphQLProvider(
          client: GraphqlService.client,
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          ),
        ),
      ),
    );
  }
}
