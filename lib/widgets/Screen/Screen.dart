import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/providers/AppProvider.dart';
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
    this.renderSettings = true,
    this.scaffoldBackgroundColor,
  });

  final Widget child;
  final Widget drawer;
  final String debugLabel;
  final bool renderSettings;
  final Color scaffoldBackgroundColor;
  final void Function(BuildContext) init;
  final Widget Function(BuildContext) builder;
  final Widget Function(BuildContext context) belowBuilder;

  @override
  Widget build(BuildContext context) {
    if (init != null) {
      init(context);
    }
    return ChangeNotifierProvider<ScreenStateProvider>(
      create: (_) => ScreenStateProvider(),
      child: Scaffold(
        drawer: drawer,
        backgroundColor: scaffoldBackgroundColor ??
            Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            belowBuilder != null ? belowBuilder(context) : Container(),
            Positioned.fill(
              child: child ?? builder(context),
            ),
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
    );
  }
}
