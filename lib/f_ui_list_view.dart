import 'package:flutter/material.dart';

typedef FItemBuilder = Widget Function(
    BuildContext context, dynamic item, int index);

class FUIListView extends StatelessWidget {
  // list data source
  final List<dynamic> data;

  // the background box for the list
  final Gradient? gradient;

  // flutter.widgets.scroll_view.shrinkWrap
  final bool shrinkWrap;

  // Determines the physics of a [Scrollable] widget.
  final ScrollPhysics? physics;

  // flutter.widgets.scroll_view.controller
  final ScrollController? controller;

  // constructor for a list item
  final FItemBuilder builder;

  // the inside margin of the list
  final EdgeInsets padding;

  // page header
  final Widget? header;

  // page footer
  final Widget? footer;

  const FUIListView({
    Key? key,
    this.header,
    this.footer,
    this.physics,
    this.gradient,
    this.controller,
    this.shrinkWrap = false,
    this.padding = EdgeInsets.zero,
    required this.builder,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              gradient: (gradient ??
                  const LinearGradient(
                    colors: [
                      Colors.greenAccent,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ),
          ),
        ),
        ScrollConfiguration(
          behavior: const FUIOverScrollBehavior(),
          child: ListView.builder(
            padding: padding,
            physics: physics,
            controller: controller,
            shrinkWrap: shrinkWrap,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return (header ?? const SizedBox());
              }
              if (index == (data.length + 1)) {
                return (footer ?? const SizedBox());
              }
              final item = (index - 1);
              return builder(context, data[item], item);
            },
            itemCount: (data.length + 2),
          ),
        ),
      ],
    );
  }
}

class FUIOverScrollBehavior extends ScrollBehavior {
  final bool showLeading;
  final bool showTrailing;

  const FUIOverScrollBehavior({
    this.showLeading = false,
    this.showTrailing = false,
  });

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          showLeading: showLeading,
          showTrailing: showTrailing,
          axisDirection: axisDirection,
          color: Colors.transparent,
          child: child,
        );
        default:
          return const SizedBox();
    }
  }
}
