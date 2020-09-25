import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/ScreenSettingsModal.dart';

import 'ScreenStateProvider.dart';
import 'messages/keys.dart';

class Screen extends StatelessWidget {
  Screen(
    this.init, {
    Key key,
    this.theme,
    this.builder,
    this.textStyle,
    this.belowBuilder,
    this.bottomNavigationBar,
    this.scaffoldBackgroundColor,
  });

  final void Function(BuildContext) init;
  final Widget Function(VoidCallback showPopUp) builder;
  final Widget Function(BuildContext context) belowBuilder;
  final Color scaffoldBackgroundColor;
  final ThemeData theme;
  final TextStyle textStyle;
  final BottomNavigationBar bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final ThemeData rootTheme = this.theme ??
        Theme.of(context).copyWith(
          primaryColor: Theme.of(context).primaryColor,
          accentColor: Theme.of(context).primaryColor,
        );

    final textStyle = this.textStyle ?? Theme.of(context).textTheme.bodyText1;

    return OrientationBuilder(
      builder: (orientationContext, _) {
        this.init(orientationContext);
        return Scaffold(
          body: DefaultTextStyle(
            style: textStyle,
            child: Theme(
              data: rootTheme.copyWith(
                tabBarTheme: TabBarTheme(
                  labelColor: Colors.red,
                  labelStyle: textStyle,
                  unselectedLabelStyle: textStyle,
                ),
                textTheme: rootTheme.textTheme.copyWith(
                  bodyText1: textStyle,
                  button: textStyle,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: textStyle,
                  labelStyle: textStyle,
                ),
              ),
              child: ChangeNotifierProvider<ScreenStateProvider>(
                create: (_) => ScreenStateProvider(),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    this.belowBuilder != null
                        ? this.belowBuilder(orientationContext)
                        : Container(),
                    Positioned.fill(
                      child: this.builder(
                        null,
                      ),
                    ),
                    Consumer<ScreenStateProvider>(
                      builder: (ctx, state, child) {
                        return ScreenSettingsModal(
                          isSettingsOpen: state.isSettingsOpen,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
