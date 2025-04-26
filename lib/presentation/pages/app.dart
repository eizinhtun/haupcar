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
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            title: 'Recipe Finder',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
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
              // Add other supported locales here
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
