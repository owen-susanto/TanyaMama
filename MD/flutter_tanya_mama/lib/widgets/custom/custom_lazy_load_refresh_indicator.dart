library lazy_load_refresh_indicator;

import 'package:flutter/material.dart';

enum LoadingStatus { LOADING, STABLE }

/// The signature for a function that's called when the user has dragged a
/// [LazyLoadRefreshIndicator] far enough to demonstrate that they want the app to
/// refresh. The returned [Future] must complete when the refresh operation is
/// finished.
///
/// Used by [LazyLoadRefreshIndicator.onRefresh].
typedef RefreshCallback = Future<void> Function();

typedef EndOfPageListenerCallback = void Function();

class CustomLazyLoadRefreshIndicator extends StatefulWidget {
  /// The offset to take into account when triggering [onEndOfPage] in pixels
  final int scrollOffset;

  /// Called when the [child] reaches the end of the list
  final VoidCallback onEndOfPage;

  /// Used to determine if loading of new data has finished. You should use set this if you aren't using a FutureBuilder or StreamBuilder
  final bool isLoading;

  /// A function that's called when the user has dragged the refresh indicator
  /// far enough to demonstrate that they want the app to refresh. The returned
  /// [Future] must complete when the refresh operation is finished.
  final RefreshCallback onRefresh;

  /// Refresh Indicator Stroke Width, default is 2.0 pixels
  final double strokeWidth;

  /// Toggle with or without refresh, default is true
  final bool withRefresh;

  /// The widget below this widget in the tree.
  ///
  /// The refresh indicator will be stacked on top of this child. The indicator
  /// will appear when child's Scrollable descendant is over-scrolled.
  ///
  /// Typically a [ListView] or [CustomScrollView].
  final Widget child;

  const CustomLazyLoadRefreshIndicator({
    Key? key,
    this.scrollOffset = 100,
    required this.onEndOfPage,
    this.isLoading = false,
    required this.onRefresh,
    required this.child,
    this.strokeWidth = 2.0,
    this.withRefresh = true,
  }) : super(key: key);

  @override
  CustomLazyLoadRefreshIndicatorState createState() =>
      CustomLazyLoadRefreshIndicatorState();
}

class CustomLazyLoadRefreshIndicatorState
    extends State<CustomLazyLoadRefreshIndicator> {
  LoadingStatus loadMoreStatus = LoadingStatus.STABLE;

  @override
  void didUpdateWidget(CustomLazyLoadRefreshIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading) {
      loadMoreStatus = LoadingStatus.STABLE;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.withRefresh) {
      return NotificationListener<ScrollNotification>(
        onNotification: _handleLoadMoreScroll,
        child: RefreshIndicator(
          onRefresh: widget.onRefresh,
          strokeWidth: widget.strokeWidth,
          child: widget.child,
        ),
      );
    } else {
      return NotificationListener<ScrollNotification>(
        onNotification: _handleLoadMoreScroll,
        child: widget.child,
      );
    }
  }

  bool _handleLoadMoreScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (notification.metrics.maxScrollExtent > notification.metrics.pixels &&
          notification.metrics.maxScrollExtent - notification.metrics.pixels <=
              widget.scrollOffset) {
        if (loadMoreStatus == LoadingStatus.STABLE) {
          loadMoreStatus = LoadingStatus.LOADING;
          widget.onEndOfPage();
        }
      }
      return true;
    }
    if (notification is OverscrollNotification) {
      if (notification.overscroll > 0) {
        if (loadMoreStatus == LoadingStatus.STABLE) {
          loadMoreStatus = LoadingStatus.LOADING;
          widget.onEndOfPage();
        }
      }
      return true;
    }
    return false;
  }
}
