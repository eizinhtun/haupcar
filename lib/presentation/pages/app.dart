import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/bloc/blocs.dart';
import 'package:haupcar/presentation/pages/pages.dart';
import 'package:haupcar/presentation/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CategoryBloc>()),
        BlocProvider(create: (context) => getIt<ProductsBloc>()),
        BlocProvider(create: (context) => getIt<LanguageCubit>()),
        BlocProvider(
          create: (context) => getIt<ConnectivityCubit>(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            title: 'Haupcar',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
              primarySwatch: Colors.teal,
              scaffoldBackgroundColor: Colors.grey.shade100,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              listTileTheme: ListTileThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(fontSize: 16),
                bodyMedium: TextStyle(fontSize: 14),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.grey.shade900,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.deepOrange.shade700,
                foregroundColor: Colors.white,
              ),
              listTileTheme: ListTileThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(fontSize: 16),
                bodyMedium: TextStyle(fontSize: 14),
              ),
            ),
            builder: (context, child) {
              MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(textScaler: TextScaler.noScaling),
                child: child!,
              );
            },
            locale: locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', 'US'), // English
              Locale('th', 'TH'), // Thailand
            ],
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).home),
      ),
      drawer: CommonDrawer(),
      body: CategoryPage(),
    );
  }
}
