import 'package:flutter/material.dart';
import 'package:duofinance/routes/routes.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  initializeDateFormatting('pt_BR', "").then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Split',
      routerConfig: Routes(context).router,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          brightness: Brightness.dark,
          useMaterial3: true,
          colorScheme: ColorScheme.dark(
            primary: Colors.cyan[400]!,
            secondary: Colors.lime[200]!,
          )),
    );
  }
}
