import 'package:flutter/material.dart';
import 'package:qcf_quran_lite/qcf_quran_lite.dart';

class AyatBody extends StatefulWidget {
  const AyatBody({super.key, required this.id});
  final int id;

  @override
  State<AyatBody> createState() => _AyatBodyState();
}
class _AyatBodyState extends State<AyatBody> {
  late PageController _controller;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();

    int firstPage = getPageNumber(widget.id, 1);

    _controller = PageController(initialPage: firstPage - 1);
    currentPage = firstPage;
  }
  // Page 1
  List<HighlightVerse> _activeHighlights = [];
  void highlightAyah() {
    setState(() {
      _activeHighlights = [
        HighlightVerse(
          surah: 2,
          verseNumber: 2,
          page: 1,
          color: Colors.amber.withOpacity(0.4),
        ),
      ];
    });
  }

  void clearHighlight() {
    setState(() {
      _activeHighlights = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Container(
            height: h * 1,
            child: QuranPageView(
              pageController: _controller,
              highlights: _activeHighlights,
              onPageChanged: (pageNumber) {
                setState(() {
                  currentPage = pageNumber;
                });
              },
              onLongPress: (surahNumber, verseNumber, details) {
                setState(() {
                  _activeHighlights = [
                    HighlightVerse(
                      surah: surahNumber,
                      verseNumber: verseNumber,
                      page: getPageNumber(surahNumber, 1),
                      color: Colors.yellow.withOpacity(0.4),
                    ),
                  ];
                });
              },
            ),
          ),
          Positioned(top: h * 0.87, child: Text("${currentPage}")),
        ],
      ),
    );
  }
}
