import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heartbeat/screens/home.dart';
import 'package:heartbeat/stores/page_store.dart';
import 'package:mobx/mobx.dart';




class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore _pageStore = GetIt.I<PageStore>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reaction(
            (_)=> _pageStore.page,
            (page) => pageController.jumpToPage(page)
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Home()
        ],
      ),
    );
  }
}
