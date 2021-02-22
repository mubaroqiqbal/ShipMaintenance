import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';

class GuidelineVideo extends StatefulWidget {
  static bool isLoading;

  @override
  _GuidelineVideo createState() => _GuidelineVideo();

}

class _GuidelineVideo extends State<GuidelineVideo>{

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

    return new Stack(
        children: <Widget>[
          ListView.builder(
            controller: _controller,
            itemCount: 15,
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
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    color: Colors.white
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, //Center Row contents vertically,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        color: colors.textColor,
                        height: (media.width*0.35)*0.75,
                        width: media.width*0.35,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cara mengecek ecdis transas", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("6:30"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  color: colors.primaryBlue,
                                  icon: Icon(Icons.file_download),
                                  onPressed: (){

                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              );
            },
          ),
        ]
    );
  }
}