import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';

class StockBeingUseActivity extends StatefulWidget {
  static bool isLoading;

  @override
  _StockBeingUseActivity createState() => _StockBeingUseActivity();

}

class _StockBeingUseActivity extends State<StockBeingUseActivity>{

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    try{

      _controller = ScrollController();
      _controller.addListener(_scrollListener);

    } catch (e, s) {
      debugPrint("error = "+e.toString());
      debugPrint("error = "+s.toString());
    }
  }

  _scrollListener() {
    try{

    } catch (e, s) {
      debugPrint("error = "+e.toString());
      debugPrint("error = "+s.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return new Stack(
        children: <Widget>[
          ListView.builder(
            controller: _controller,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  try{

                  } catch (e, s) {
                    debugPrint("error = "+e.toString());
                    debugPrint("error = "+s.toString());
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: colors.lineColor,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: colors.lineColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text("sdkahsbdsahbdjhahs", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                ),
              );
            },
          ),
        ]
    );
  }
}