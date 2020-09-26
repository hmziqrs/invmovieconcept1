import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:simple_animations/simple_animations.dart';

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

class ScreenSettingsModalState extends State<ScreenSettingsModal>
    with AnimationMixin {
  Animation<double> animation;
  double offset = 0.0;

  @override
  void initState() {
    this.animation = Tween(begin: 0.0, end: 1.0).animate(this.controller);
    this.controller.duration = Duration(milliseconds: 320);
    this.controller.addListener(() {
      setState(() {
        this.offset = this.animation.value;
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScreenSettingsModal oldWidget) {
    if (!oldWidget.isSettingsOpen && widget.isSettingsOpen) {
      this.controller.play();
    }
    if (oldWidget.isSettingsOpen && !widget.isSettingsOpen) {
      this.controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  ScreenStateProvider getState([listen = false]) =>
      Provider.of<ScreenStateProvider>(context, listen: listen);

  void openModal() {
    if (this.animation.value != 0.0) {
      return;
    }
    this.getState().isSettingsOpen = true;
  }

  void closeModal() {
    if (this.animation.value != 1.0) {
      return;
    }

    this.getState().isSettingsOpen = false;
  }

  void onVerticalDragUpdate(double offset) {
    if (this.animation.value != 1.0 && this.animation.value != 0.0) {
      return;
    }

    setState(() {
      this.offset =
          (this.offset - (offset / this.getState().baseOffset)).clamp(0.0, 1.0);
    });
  }

  void onVerticalDragEnd() {
    if (!widget.isSettingsOpen) {
      if (this.offset > 0.20) {
        this.controller.forward(from: this.offset);
        this.getState().isSettingsOpen = true;
      } else {
        this.controller.reverse(from: this.offset);
      }
    } else {
      if (this.offset < 0.80) {
        this.controller.reverse(from: this.offset);
        this.getState().isSettingsOpen = false;
      } else {
        this.controller.forward(from: this.offset);
      }
    }
  }

  Future<bool> onWillPop() async {
    if (widget.isSettingsOpen) {
      this.closeModal();
    }
    return !widget.isSettingsOpen;
  }

  bool onSizeChangeNotification(notification) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration.zero, () {
        this.getState().onLayoutChange();
        setState(() {});
      });
    });
    return true;
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

    final topPosition = Utils.rangeMap(
      this.offset,
      0.0,
      1.0,
      state.baseOffset,
      0.0,
    );

    return Positioned(
      left: 0,
      right: 0,
      top: topPosition,
      child: GestureDetector(
        onDoubleTap: () => !widget.isSettingsOpen ? this.openModal() : null,
        onVerticalDragEnd: (event) => this.onVerticalDragEnd(),
        onVerticalDragUpdate: (event) => this.onVerticalDragUpdate(
          event.delta.dy,
        ),
        child: NotificationListener<SizeChangedLayoutNotification>(
          onNotification: this.onSizeChangeNotification,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.runtimeType == OverscrollNotification) {
                final OverscrollNotification parsed = notification;
                if (parsed.dragDetails == null) {
                  return true;
                }
                final delta = parsed.dragDetails.delta;
                this.onVerticalDragUpdate(delta.dy);
              }
              if (notification.runtimeType == ScrollEndNotification) {
                this.onVerticalDragEnd();
              }
              return false;
            },
            child: WillPopScope(
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
                        // opacity: 1.0,
                        opacity: (this.offset * 1.8).clamp(0.0, 1.0),
                        child: Container(
                          alignment: Alignment.topCenter,
                          color: this.getBackgroundColor(context),
                          child: Container(
                            height: UI.height,
                            width: AppDimensions.containerWidth,
                            child: ScreenSettingsModalBody(
                              onClose: this.closeModal,
                              isModalOpen: state.isSettingsOpen,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
