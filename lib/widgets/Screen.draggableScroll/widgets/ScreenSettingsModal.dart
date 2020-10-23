import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/UI.dart';

import 'ScreenSettingsModalBody.dart';
import '../ScreenStateProvider.dart';

class ScreenSettingsModal extends StatefulWidget {
  ScreenSettingsModal({
    Key key,
    @required this.isSettingsOpen,
  }) : super(key: key);

  final bool isSettingsOpen;

  @override
  ScreenSettingsModalState createState() => ScreenSettingsModalState();
}

class ScreenSettingsModalState extends State<ScreenSettingsModal> {
  Animation<double> animation;
  double offset = 0.0;
  ScrollController scrollController = ScrollController();
  final opacityKey = GlobalKey();

  @override
  void initState() {
    this.scrollController.addListener(() {});
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScreenSettingsModal oldWidget) {
    if (!oldWidget.isSettingsOpen && widget.isSettingsOpen) {
      // this.controller.play();
    }
    if (oldWidget.isSettingsOpen && !widget.isSettingsOpen) {
      // this.controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  ScreenStateProvider getState([listen = false]) =>
      Provider.of<ScreenStateProvider>(context, listen: listen);

  void openModal() {
    if (this.animation.value != 0.0) {
      return;
    }
    this.scrollController.jumpTo(0.0);
    this.getState().isSettingsOpen = true;
  }

  void closeModal() {
    if (this.animation.value != 1.0) {
      return;
    }

    this.getState().isSettingsOpen = false;
  }

  Future<bool> onWillPop() async {
    if (widget.isSettingsOpen) {
      this.closeModal();
    }
    return !widget.isSettingsOpen;
  }

  Color getBackgroundColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return Colors.white.withOpacity(0.40);
    }
    return Colors.black.withOpacity(0.10);
  }

  @override
  Widget build(BuildContext context) {
    final state = this.getState();

    final base = UI.height - 20;
    final min = 1 - (base / UI.height);
    final initial = min + 0.01;

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        state.opacity = notification.extent;
        return true;
      },
      child: DraggableScrollableSheet(
        maxChildSize: 1.0,
        initialChildSize: initial,
        minChildSize: min,
        expand: true,
        builder: (context, controller) {
          return WillPopScope(
            onWillPop: this.onWillPop,
            child: SizeChangedLayoutNotifier(
              child: ClipRect(
                child: Container(
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Opacity(
                      opacity: state.opacity,
                      child: Container(
                        alignment: Alignment.topCenter,
                        color: this.getBackgroundColor(context),
                        child: Container(
                          height: UI.height,
                          width: AppDimensions.containerWidth,
                          child: ScreenSettingsModalBody(
                            onClose: this.closeModal,
                            isModalOpen: state.isSettingsOpen,
                            scrollController: controller,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
