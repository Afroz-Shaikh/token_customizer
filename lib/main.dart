import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:restart_app/restart_app.dart';
import 'package:theme_configurator/screens/homescreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

ValueNotifier<Map> valueNotifier = ValueNotifier(
  {
    'borderRadius': '\$md',
    'backgroundColor': '\$primary0',
    'alignItems': 'start',
    'variants': {
      'action': {
        'primary': {
          'bg': '\$primary0',
          '_dark': {
            'bg': '\$primary0',
            'borderColor': '\$primary700',
            ':hover': {
              'bg': '\$primary500',
              'borderColor': '\$primary400',
            }
          }
        }
      },
      'variant': {
        'link': {
          'px': '\$0',
          ':hover': {
            '_text': {
              'textDecorationLine': 'underline',
            },
          },
          ':active': {
            '_text': {
              'textDecorationLine': 'underline',
            },
          },
        },
        'outline': {
          'bg': 'transparent',
          'borderWidth': '\$1',
          ':hover': {
            'bg': '\$backgroundLight50',
          },
          ':active': {
            'bg': 'transparent',
          },
          '_dark': {
            'bg': 'transparent',
            ':hover': {
              'bg': '\$backgroundDark900',
            },
            ':active': {
              'bg': 'transparent',
            },
          },
        },
      }
    }
  },
);

class TokenNotifier extends ChangeNotifier {
  ValueNotifier<Map> valueNotifier = ValueNotifier({
    'borderRadius': '\$md',
    'backgroundColor': '\$primary0',
    'variants': {
      'action': {
        'primary': {
          'bg': '\$primary0',
          '_dark': {
            'bg': '\$primary0',
            'borderColor': '\$primary700',
            ':hover': {
              'bg': '\$primary500',
              'borderColor': '\$primary400',
            }
          }
        }
      }
    }
  });

  void updateValue(Map value) {
    valueNotifier.value = value;
    notifyListeners();
  }
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return GluestackProvider(
          gluestackCustomConfig: GluestackCustomConfig(button: {}),
          gluestackTokenConfig: GluestackTokenConfig(
            gsColorsToken: const GSColorsToken(
              primary0: Colors.blue,
            ),
          ),
          child: GSApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: GSThemeData(brightness: Brightness.dark),
              darkTheme: GSThemeData(
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: const Color(0xFF171717)),
              debugShowCheckedModeBanner: false,
              home: HomeScreen()),
        );
      },
    );
  }
}
