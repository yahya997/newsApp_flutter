import 'package:flutter/material.dart';

import 'model/pageModel.dart';

import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
        'welcome',
        'Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/bg2.jpg',
        Icons.ac_unit));
    pages.add(PageModel(
        'welcome',
        'Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/image.png',
        Icons.access_alarm));
    pages.add(PageModel(
        'welcome',
        'Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/bg2.jpg',
        Icons.print));
    pages.add(PageModel(
        'welcome',
        'Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/bg2.jpg',
        Icons.map));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(
                              pages[index].image,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -150),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 48.0, right: 48.0, top: 18),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (indext) {
              _valueNotifier.value = indext;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 170),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, letterSpacing: 1),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
