import 'package:flutter/material.dart';

enum MaterialElevation {
  the1dp,
  the2dp,
  the3dp,
  the4dp,
  the5dp,
  the6dp,
  the7dp,
  the8dp,
}

class MaterialShadow {
  static BoxDecoration asBoxDecoration({required MaterialElevation elevation}) {
    BoxShadow shadow;

    switch (elevation) {
      case MaterialElevation.the1dp:
        shadow = const BoxShadow(
            color: Colors.black12, spreadRadius: 1, blurRadius: 0);
        break;
      case MaterialElevation.the2dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 1, blurRadius: 1);
        break;
      case MaterialElevation.the3dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 2, blurRadius: 2);
        break;
      case MaterialElevation.the4dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 2, blurRadius: 5);
        break;
      case MaterialElevation.the5dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 3, blurRadius: 5);
        break;
      case MaterialElevation.the6dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 4, blurRadius: 6);
        break;
      case MaterialElevation.the7dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 4, blurRadius: 7);
        break;
      case MaterialElevation.the8dp:
        shadow = const BoxShadow(
            color: Colors.black26, spreadRadius: 5, blurRadius: 8);
        break;
      default:
        throw Exception('Not supported elevation value: $elevation');
    }

    return BoxDecoration(boxShadow: [shadow]);
  }
}

class ScrollShadowContainer extends StatefulWidget {
  const ScrollShadowContainer({
    super.key,
    required this.child,
    this.top = true,
    this.bottom = true,
    this.elevation = MaterialElevation.the4dp,
  }) : boxShadow = null;

  const ScrollShadowContainer.custom({
    super.key,
    required this.child,
    required this.boxShadow,
    this.top = true,
    this.bottom = true,
  }) : elevation = null;

  final Widget child;
  final MaterialElevation? elevation;
  final BoxShadow? boxShadow;
  final bool top;
  final bool bottom;

  @override
  State<ScrollShadowContainer> createState() => _ScrollShadowContainerState();
}

class _ScrollShadowContainerState extends State<ScrollShadowContainer> {
  ScrollController? _scrollController;

  bool _needShadowOnTop = false;
  bool _needShadowOnBottom = false;

  BoxDecoration get _shadowDecoration => widget.boxShadow != null
      ? BoxDecoration(boxShadow: [widget.boxShadow!])
      : MaterialShadow.asBoxDecoration(elevation: widget.elevation!);
  BoxDecoration get _emptyDecoration => const BoxDecoration();

  void _updateShadowsVisibility() {
    bool top;
    bool bottom;

    if (!_scrollController!.hasClients) {
      if (_scrollController!.initialScrollOffset > 0) {
        top = true;
        bottom = true;
      } else {
        top = false;
        bottom = true;
      }
    } else if (_scrollController!.position.atEdge) {
      if (_scrollController!.position.pixels ==
          _scrollController!.position.minScrollExtent) {
        top = false;
      } else {
        top = true;
      }
      if (_scrollController!.position.pixels ==
          _scrollController!.position.maxScrollExtent) {
        bottom = false;
      } else {
        bottom = true;
      }
    } else {
      if (_scrollController!.position.pixels <
          _scrollController!.position.minScrollExtent) {
        top = false;
        bottom = true;
      } else if (_scrollController!.position.pixels >
          _scrollController!.position.maxScrollExtent) {
        top = true;
        bottom = false;
      } else {
        top = bottom = true;
      }
    }

    if (_needShadowOnTop != top || _needShadowOnBottom != bottom) {
      _needShadowOnTop = top;
      _needShadowOnBottom = bottom;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    T? ambiguate<T>(T? value) => value;

    ambiguate(WidgetsBinding.instance)
        ?.addPostFrameCallback((_) => _updateShadowsVisibility());
  }

  @override
  Widget build(BuildContext context) {
    if (_scrollController != PrimaryScrollController.of(context)) {
      _scrollController = PrimaryScrollController.of(context);
      _scrollController!.addListener(_updateShadowsVisibility);
    }

    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.child,
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 0,
              width: MediaQuery.of(context).size.width,
              decoration: _needShadowOnTop && widget.top
                  ? _shadowDecoration
                  : _emptyDecoration,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 0,
              width: MediaQuery.of(context).size.width,
              decoration: _needShadowOnBottom && widget.bottom
                  ? _shadowDecoration
                  : _emptyDecoration,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_updateShadowsVisibility);
    super.dispose();
  }
}
