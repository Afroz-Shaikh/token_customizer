import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:restart_app/restart_app.dart';
import 'package:theme_configurator/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double radiusValue = 0;
  String radius = '\$sm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        bottomOpacity: 0,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 30,
              height: 20,
            ),
            const Text(
              'Gluestack Theme Configurator',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              log(valueNotifier.value.toString());
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: Text('Theme Config'),
                      content: Text(valueNotifier.value.toString()),
                    );
                  });
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            // ToolBox Widget
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    right: BorderSide(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Color Default',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          // Restart App
                          try {
                            // Restart.restartApp(webOrigin: '');
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        child: const Text('Restart App Default',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < 10; i++)
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                log('Tapped');
                                log(valueNotifier.value.toString());
                                valueNotifier.value = {
                                  'borderRadius': '\$md',
                                  'backgroundColor': tokenColors[i],
                                  'variants': {
                                    'action': {
                                      'primary': {
                                        'bg': tokenColors[i],
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
                                          'bg': tokenColors[i],
                                        },
                                        ':active': {
                                          'bg': 'transparent',
                                        },
                                        '_dark': {
                                          'bg': 'transparent',
                                          ':hover': {
                                            'bg': tokenColors[i],
                                          },
                                          ':active': {
                                            'bg': 'transparent',
                                          },
                                        },
                                      },
                                    }
                                  }
                                };
                                // {
                                //   'borderRadius': '\$md',
                                //   'backgroundColor': tokenColors[i],
                                //   'variants': {
                                //     'action': {
                                //       'primary': {
                                //         'bg': tokenColors[i],
                                //         '_dark': {
                                //           'bg': tokenColors[i],
                                //           'borderColor': '\$primary700',
                                //           ':hover': {
                                //             'bg': '\$primary500',
                                //             'borderColor': '\$primary400',
                                //           }
                                //         }
                                //       }
                                //     }
                                //   }
                                // };
                              },
                              child: CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundColor: gscolors[i],
                              ),
                            ))
                        ],
                      ),
                      Text('Border Radius'),
                      Container(
                        width: double.infinity,
                        child: CupertinoSegmentedControl(
                          borderColor: Colors.black.withOpacity(0.3),
                          selectedColor: Colors.blue,
                          unselectedColor: Colors.white,
                          children: {
                            '\$sm': Text('\$sm'),
                            '\$md': Text('\$md'),
                            '\$lg': Text('\$lg'),
                            '\$3xl': Text('\$3xl'),
                          },
                          groupValue: radius,
                          onValueChanged: (value) {
                            setState(() {
                              radius = value;
                              switch (radius) {
                                case '\$3xl':
                                  radiusValue = 1.0;
                                  break;
                                case '\$lg':
                                  radiusValue = 0.5;
                                  break;
                                case '\$md':
                                  radiusValue = 0.3;
                                  break;
                                case '\$sm':
                                  radiusValue = 0.1;
                                  break;
                                default:
                                  radiusValue = 0.5; // Default value
                              }
                            });
                          },
                        ),
                      ),
                      // Slider(
                      //     thumbColor: Colors.red,
                      //     value: radiusValue,
                      //     onChanged: (v) {
                      //       setState(() {
                      //         radiusValue = v;
                      //         if (radiusValue > 0.7) {
                      //           radius = '\$3xl';
                      //         } else if (radiusValue < 0.6) {
                      //           radius = '\$lg';
                      //         } else if (radiusValue < 0.4) {
                      //           radius = '\$md';
                      //         } else if (radiusValue < 0.2) {
                      //           radius = '\$sm';
                      //         }
                      //       });
                      //     })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          )),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GSButton(
                            onPressed: () {},
                            style: GSStyle.fromMap(data: {
                              'backgroundColor': value['backgroundColor'],
                              'borderRadius': radius,
                              'borderColor': value['backgroundColor'],
                              // 'borderColor': value['backgroundColor'],
                              // 'variants': value['variants']
                            }),
                            variant: GSButtonVariants.outline,
                            child: const Text(
                              'Button',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GSButton(
                            onPressed: () {},
                            variant: GSButtonVariants.outline,
                            style: GSStyle.fromMap(data: {
                              'borderRadius': radius,
                              'borderColor': value['backgroundColor'],
                            }),
                            child: const Text('Outline '),
                          ),
                          const SizedBox(height: 10),
                          GSButton(
                            style: GSStyle.fromMap(data: {
                              'backgroundColor': value['backgroundColor'],
                              'borderRadius': radius,
                              'borderColor': value['backgroundColor'],
                              'variants': value['variants']
                            }),
                            child: GSHStack(
                              children: [
                                GSIcon(
                                  icon: Icons.edit,
                                  style: GSStyle(color: $GSColors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GSButtonText(
                                  text: "Left Icon",
                                  style: GSStyle(),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 10),
                          GSButton(
                            style: GSStyle.fromMap(data: {
                              'backgroundColor': value['backgroundColor'],
                              'borderRadius': radius,
                              'borderColor': value['backgroundColor'],
                              'variants': value['variants']
                            }),
                            child: GSHStack(
                              children: [
                                GSButtonText(
                                  text: "Right Icon",
                                  style: GSStyle.fromMap(data: {
                                    'borderRadius': radius,
                                    'borderColor': value['backgroundColor'],
                                  }),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GSIcon(
                                  icon: Icons.add,
                                  style: GSStyle(color: $GSColors.white),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),

                          //
                        ],
                      )),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> tokenColors = [
  '\$secondary900',
  '\$primary0',
  '\$primary200',
  '\$primary300',
  '\$primary400',
  '\$tertiary500',
  '\$rose500',
  '\$fuchsia500',
  '\$purple500',
  '\$indigo500',
];

List gscolors = [
  $GSColors.secondary900,
  $GSColors.primary0,
  $GSColors.primary200,
  $GSColors.primary300,
  $GSColors.primary400,
  $GSColors.tertiary500,
  $GSColors.rose500,
  $GSColors.fuchsia500,
  $GSColors.purple500,
  $GSColors.indigo500,
];
