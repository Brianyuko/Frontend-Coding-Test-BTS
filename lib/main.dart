import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_bts/blocs/auth/auth_bloc.dart';
import 'package:frontend_bts/routes/routes.dart';
import 'package:frontend_bts/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = appRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<AuthBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Frontend BTS',
        debugShowCheckedModeBanner: kDebugMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _appRouter,
      ),
    );
  }
}
