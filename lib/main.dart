import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_project/screens/name/bloc/name_screen_bloc.dart';
import 'package:task_project/screens/name/name_screen.dart';
import 'package:task_project/shared/repositories/shared_prefs.dart';
import 'package:task_project/shared/repositories/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _sharedPrefs = SharedPrefs();
  await _sharedPrefs.init();

  runApp(
    Provider(
      create: (context) => _sharedPrefs,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepository>(
      create: (_) => SharedPreferenceRepository(
          Provider.of<SharedPrefs>(context, listen: false)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color.fromRGBO(84, 19, 216, 1.0),
          fontFamily: 'OpenSans',
        ),
        home: BlocProvider<NameScreenBloc>(
            create: (context) => NameScreenBloc(
                  repository: RepositoryProvider.of<UserRepository>(context),
                ),
            child: const NameScreen()),
      ),
    );
  }
}
