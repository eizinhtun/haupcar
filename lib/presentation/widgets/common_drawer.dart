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
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                // color: Colors.blue,
                ),
            child: Text(
              AppLocalizations.of(context).language,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/flags/thai.png",
              width: 32,
              height: 32,
            ),
            title: Text(AppLocalizations.of(context).thai),
            onTap: () {
              // Handle the tap
              context.read<LanguageCubit>().switchToThai();
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/flags/us.png",
              width: 32,
              height: 32,
            ),
            title: Text(AppLocalizations.of(context).english),
            onTap: () {
              // Handle the tap
              context.read<LanguageCubit>().switchToEnglish();
            },
          ),
        ],
      ),
    );
  }
}
