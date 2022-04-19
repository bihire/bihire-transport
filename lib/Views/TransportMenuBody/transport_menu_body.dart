import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:localization1/Views/TransportMenuBody/bottom_popup_modal.dart';

class TransportMenuBody extends StatefulWidget {
  const TransportMenuBody({Key? key}) : super(key: key);

  @override
  _TransportMenuBodyState createState() => _TransportMenuBodyState();
}

class _TransportMenuBodyState extends State<TransportMenuBody>
    with TickerProviderStateMixin {
  late double _barOffset;
  late double _previousPosition;
  // controller for the thing
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _barOffset = 300.0;
    _previousPosition = 0.0;
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  void _tripShowModalBottomSheet(context) {
    // showRoundedModalBottomSheet(
    //     context: context,
    //     builder: (context) => _buildBottomSheetChild()
    // );
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              height: height * 0.64,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 30, maxWidth: width * 0.4),
                      child: Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(bottom: 7),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey,
                          ),
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            child: Text('201',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center)),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Kicukiro(saint-joseph) - Down town'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 10),
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text('RAC 3457',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center)),
                                  Container(
                                    child: Text('20 minutes',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFFd9d9d9))),
                                  )
                                ],
                              ),
                            );
                          }))
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBottomSheetChild(context) {
    return NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          return false;
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: DraggableScrollableSheet(
            initialChildSize: 0.64,
            minChildSize: 0.64,
            maxChildSize: 0.64,
            builder: (context, scrollController) {
              return Container(
                // color: Colors.white,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  itemCount: 20,
                ),
              );
            },
          ),
        ));
  }

  void _showGeneralDialod(context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (ctx, anim1, anim2) => AlertDialog(
        title: Text('blured background'),
        content: Text('background should be blured and little bit darker '),
        elevation: 2,
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Kigali',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () => {_tripShowModalBottomSheet(context)},
                  child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Container(
                          child: Container(
                              child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Text('201',
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600))),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '20 active buses',
                                  style: TextStyle(color: Color(0xFFd9d9d9)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child:
                                    Text('Kicukiro(saint-joseph) - Down town'),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: .5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Text('201',
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600))),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '20 active buses',
                                  style: TextStyle(color: Color(0xFFd9d9d9)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child:
                                    Text('Kicukiro(saint-joseph) - Down town'),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: .5,
                          ),
                        ],
                      )))),
                ),
              ],
            )),
        Text('data'),
      ],
    );
  }
}
