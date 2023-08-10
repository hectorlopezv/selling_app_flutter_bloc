import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/common/routes/names.dart';
import 'package:ulearing/common/service/settings_button.dart';
import 'package:ulearing/common/values/constants.dart';
import 'package:ulearing/global.dart';
import 'package:ulearing/pages/application/bloc/app_bloc.dart';
import 'package:ulearing/pages/application/bloc/app_events.dart';
import 'package:ulearing/pages/settings/bloc/settings_bloc.dart';
import 'package:ulearing/pages/settings/bloc/settings_states.dart';
import 'package:ulearing/pages/settings/widgets/settings_app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(TriggerAppEvent(0));
    GlobalPreferences.storageService.remove(AppsConsts.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarSettings(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
