import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';

class StockListActivity extends StatefulWidget {
  static bool isLoading;

  @override
  _StockListActivity createState() => _StockListActivity();

}

class _StockListActivity extends State<StockListActivity>{

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

    var media = MediaQuery.of(context).size;

    return new Container(
      color: colors.secondaryBlack,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: media.height*0.45,
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(10, (index){
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
                          title: Text("akshjdkjsad", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    );
                  })
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 50,
            width: media.width*0.89,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
              ),
              color: colors.primaryBlue,
              elevation: 0,
              onPressed: () {

              },
              child: Text(
                "gunakan barang".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}