import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:provider/provider.dart';

import 'widgets/ScreenSettingsModal.dart';

import 'ScreenStateProvider.dart';

class Screen extends StatefulWidget {
  Screen(
    this.init, {
    Key key,
    this.theme,
    this.child,
    this.builder,
    this.textStyle,
    this.belowBuilder,
    this.bottomNavigationBar,
    this.scaffoldBackgroundColor,
  });

  final void Function(BuildContext) init;
  final Widget child;
  final Widget Function() builder;
  final Widget Function(BuildContext context) belowBuilder;
  final Color scaffoldBackgroundColor;
  final ThemeData theme;
  final TextStyle textStyle;
  final BottomNavigationBar bottomNavigationBar;

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Size size;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        this.size = UI.getSize();
      });
    });
    super.initState();
  }

  bool onNotification(SizeChangedLayoutNotification notification) {
    if (this.size != UI.getSize()) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          this.size = UI.getSize();
        });
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData rootTheme = this.widget.theme ??
        Theme.of(context).copyWith(
          primaryColor: Theme.of(context).primaryColor,
          accentColor: Theme.of(context).primaryColor,
        );

    final textStyle =
        this.widget.textStyle ?? Theme.of(context).textTheme.bodyText1;

    this.widget.init(context);
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: this.onNotification,
      child: SizeChangedLayoutNotifier(
        child: Scaffold(
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
                    this.widget.belowBuilder != null
                        ? this.widget.belowBuilder(context)
                        : Container(),
                    Positioned.fill(
                      child: widget.child ?? widget.builder(),
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
        ),
      ),
    );
  }
}
