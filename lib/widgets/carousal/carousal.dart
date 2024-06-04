import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widgets_wigets/widgets/carousal/components/indicator_dot.dart';
import 'package:widgets_wigets/widgets/carousal/components/indicator_line.dart';
import 'package:shimmer/shimmer.dart';

enum CarouselButtonType { iconOnly, rounded }

enum CarouselIndicatorType { dot, line }

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    required this.images,
    this.height = 200,
    this.duration = const Duration(seconds: 5),
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(8),
    this.indicatorType = CarouselIndicatorType.dot,
    this.curve = Curves.easeInOut,
    this.swipeDuration = const Duration(milliseconds: 500),
    this.showIndicator = true,
    this.showButtons = true,
    this.buttonType = CarouselButtonType.iconOnly,
    this.maxWidth = 430,
  });

  /// ImageUrls for  Carousel
  final List<String> images;

  /// Height for Carousel ; default: 200
  final double? height;

  /// Duration for Carousel ; default: 5 seconds
  final Duration? duration;

  /// Border Radius for Carousel ; default: 8
  final double? borderRadius;

  /// Padding Around Carousel ; default : All : 8
  final EdgeInsetsGeometry? padding;

  /// Indicator Type for Carousel ; default: dot
  final CarouselIndicatorType? indicatorType;

  /// Curve Animation for Carousel ; default: Curves.easeInOut
  final Curve? curve;

  /// Duration for Carousel ; default: 500 milliseconds
  final Duration? swipeDuration;

  /// Boolean to enable/disable indicator ; default: true
  final bool? showIndicator;

  /// Boolean to enable/disable indicator ; default: true
  final bool? showButtons;

  /// Carousel Button Types
  final CarouselButtonType? buttonType;

  /// Max Width for Carousel ; default: 430
  final double? maxWidth;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController? _pageController;
  int currentIndex = 0;

  void _startAutoChange() {
    Timer.periodic(widget.duration!, (timer) {
      if (currentIndex != widget.images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController!.animateToPage(
        currentIndex,
        duration: widget.swipeDuration!,
        curve: widget.curve!,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoChange();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding!,
      child: SizedBox(
        height: widget.height,
        width: widget.maxWidth,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: onChangedFunction,
              physics: const BouncingScrollPhysics(),
              allowImplicitScrolling: true,
              children: List.generate(
                widget.images.length,
                (index) {
                  final image = widget.images[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: widget.height,
                      width: widget.maxWidth,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                        child: image.startsWith("http")
                            ? CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                                fadeInDuration:
                                    const Duration(milliseconds: 300),
                                fadeOutDuration:
                                    const Duration(milliseconds: 100),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            widget.showButtons!
                ? Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (currentIndex != 0) {
                                currentIndex--;
                              } else {
                                currentIndex = widget.images.length - 1;
                              }
                              _pageController!.animateToPage(
                                currentIndex,
                                duration: widget.swipeDuration!,
                                curve: widget.curve!,
                              );
                            },
                            icon: CircleAvatar(
                              backgroundColor: widget.buttonType ==
                                      CarouselButtonType.iconOnly
                                  ? Colors.transparent
                                  : Colors.white.withOpacity(0.6),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (currentIndex != widget.images.length - 1) {
                                currentIndex++;
                              } else {
                                currentIndex = 0;
                              }
                              _pageController!.animateToPage(
                                currentIndex,
                                duration: widget.swipeDuration!,
                                curve: widget.curve!,
                              );
                            },
                            icon: CircleAvatar(
                              backgroundColor: widget.buttonType ==
                                      CarouselButtonType.iconOnly
                                  ? Colors.transparent
                                  : Colors.white.withOpacity(0.6),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.showIndicator!
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.images.length,
                          (index) =>
                              widget.indicatorType == CarouselIndicatorType.dot
                                  ? IndicatorDot(
                                      currentIndex: currentIndex,
                                      positionIndex: index)
                                  : IndicatorLine(
                                      currentIndex: currentIndex,
                                      positionIndex: index),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
