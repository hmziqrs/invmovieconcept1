import 'package:flutter/material.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/providers/AppProvider.dart';
import 'package:invmovieconcept1/io/io.dart';
import 'package:invmovieconcept1/UI.dart';

import 'widgets/ScreenSettingsModalBody.dart';
import 'ScreenStateProvider.dart';

part 'widgets/ScreenSettingsModal.dart';

class Screen extends StatelessWidget {
  const Screen({
    this.init,
    this.child,
    this.drawer,
    this.builder,
    this.debugLabel,
    this.belowBuilder,
    this.overBuilders = const [],
    this.renderSettings = true,
    this.scaffoldBackgroundColor,
  });

  final Widget child;
  final Widget drawer;
  final String debugLabel;
  final bool renderSettings;
  final List<Widget> overBuilders;
  final Color scaffoldBackgroundColor;
  final void Function(BuildContext) init;
  final Widget Function(BuildContext) builder;
  final Widget Function(BuildContext context) belowBuilder;

  @override
  Widget build(BuildContext context) {
    if (init != null) {
      init(context);
    }

    final brightness = Theme.of(context).brightness;
    final statusBar = brightness != Brightness.light
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return ChangeNotifierProvider<ScreenStateProvider>(
      create: (_) => ScreenStateProvider(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusBar,
        child: Scaffold(
          drawer: drawer,
          backgroundColor: scaffoldBackgroundColor ??
              Theme.of(context).scaffoldBackgroundColor,
          body: Stack(
            fit: StackFit.expand,
            children: [
              belowBuilder != null ? belowBuilder(context) : Container(),
              Positioned.fill(
                child: child ?? builder(context),
              ),
              if (overBuilders.isNotEmpty) ...overBuilders,
              renderSettings
                  ? Consumer<ScreenStateProvider>(
                      builder: (ctx, state, child) {
                        return ScreenSettingsModal(
                          isSettingsOpen: state.isSettingsOpen,
                        );
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
