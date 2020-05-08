import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sma/shared/colors.dart';

class BaseScreen extends StatelessWidget {

  final List<Widget> children;
  final Future<void> Function() onRefresh;

  BaseScreen({
    @required this.children,
    @required this.onRefresh
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return new Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  height: 24.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                    child: Center(
                      child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
                    ),
                  ),
                ),
                Center(
                  child: new Text(
                    'Yay!',
                  ),
                ),
              ],
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'There are no bottons to push :)',
              ),
              new Text(
                'Just turn off your internet.',
              ),
          ],
        ),
      )
    );


      // body: RefreshIndicator(
      //   child: SafeArea(
      //     child: ListView(
      //       physics: BouncingScrollPhysics(),
      //       padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      //       children: this.children
      //     )
      //   ), 
      //   onRefresh: onRefresh
      // )
    
  }
}