import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Reference design used a rotating "quote" banner — but since attributing
/// invented quotes to real historical authors isn't something we can do
/// honestly, this rotates real, PDF-sourced highlights instead (still
/// visually a carousel with dot indicators, just backed by true content).
class HeroHighlightCarousel extends StatefulWidget {
  final List<String> highlights;

  const HeroHighlightCarousel({super.key, required this.highlights});

  @override
  State<HeroHighlightCarousel> createState() => _HeroHighlightCarouselState();
}

class _HeroHighlightCarouselState extends State<HeroHighlightCarousel> {
  final _controller = PageController();
  int _page = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.highlights.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 5), (_) {
        if (!mounted) return;
        final next = (_page + 1) % widget.highlights.length;
        _controller.animateToPage(next, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.highlights.isEmpty ? ['বাংলা সাহিত্য শেখা, বোঝা, মনে রাখা — একসাথে'] : widget.highlights;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 168,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: Stack(
          children: [
            // Decorative open-book glyph, echoing the app's launcher icon.
            Positioned(
              right: -10,
              bottom: -10,
              child: Opacity(
                opacity: 0.14,
                child: Icon(Icons.menu_book, size: 140, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (i) => setState(() => _page = i),
                      itemCount: items.length,
                      itemBuilder: (context, i) => Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          items[i],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (items.length > 1)
                    Row(
                      children: List.generate(items.length, (i) {
                        final active = i == _page;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(right: 6),
                          width: active ? 18 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(active ? 0.95 : 0.4),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      }),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
