import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/bloc/blocs.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                AppLocalizations.of(context).language,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/flags/thai.png",
              width: 32,
            ),
            title: Text(AppLocalizations.of(context).thai),
            onTap: () => context.read<LanguageCubit>().switchToThai(),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Image.asset(
              "assets/flags/us.png",
              width: 32,
            ),
            title: Text(AppLocalizations.of(context).english),
            onTap: () => context.read<LanguageCubit>().switchToEnglish(),
          ),
        ],
      ),
    );
  }
}
