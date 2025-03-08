import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/home/app.dart';
import '../feature/provider/app_provider.dart';
import '../outer_layer/client/dio_agent.dart';
import '../outer_layer/client/rest_client.dart';
import '../outer_layer/repository/user_repository.dart';

FutureOr<Widget> bootstrap() async {
  final dio = configureDio();
  final restClient = RestClient(dio);
  final repo = UserRepository(client: restClient);

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider(repo)),
    ],
    child: const App(),
  );
}
