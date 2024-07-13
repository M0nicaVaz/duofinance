import 'package:duofinance/core/entities/User.entity.dart';
import 'package:duofinance/utils/session.dart';
import 'package:duofinance/utils/session_storage.dart';
import 'package:flutter/material.dart';
import 'package:duofinance/config/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:duofinance/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  // await dotenv.load();
  // usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  final bool isLoggedIn = await getFromStorage(key: StorageKeys.token) != null;
  final IUser? loggedUser = isLoggedIn ? await getUserFromStorage() : null;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting('pt_BR', "").then(
    (_) => runApp(
      MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<Session>(
              create: (_) => Session(isLoggedIn, loggedUser)),
        ],
        child: MyApp(
          isLoggedIn: isLoggedIn,
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.isLoggedIn, super.key});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    final Session userState = Provider.of(context);

    return MaterialApp.router(
      title: 'Split',
      routerConfig: Routes(context, userState.isLoggedIn).router,
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
