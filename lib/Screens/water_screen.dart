import 'package:evolve/custom_packages/LiquidCircularProgressIndicator_custom/lib/src/liquid_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> with SingleTickerProviderStateMixin{

  AnimationController? animationController ;

  var waterLevel = 0.5;
  var selectedStyle = 0;

  // final sphereBottleRef = GlobalKey<>();
  // final sphereBottleRef = GlobalKey<SphericalBottleState>();



  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );

    animationController?.addListener(() {
      setState(() {

      });
    });

    //  animationController?.repeat();
    animationController!.value = 0.4;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final percentage = animationController!.value * 100;
// final sphere = SphericalBottle(
//       key: sphereBottleRef,
//       waterColor: Colors.red,
//       bottleColor: Colors.redAccent,
//       capColor: Colors.grey.shade700,
//     );
//



    final stylePicker = Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Center(
        child: ToggleButtons(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Icon(Icons.crop_portrait),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Icon(Icons.circle_outlined),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Icon(Icons.change_history),
            ),
          ],
          isSelected: List<bool>.generate(3, (index) => index == selectedStyle),
          onPressed: (index) => setState(() => selectedStyle = index),
        ),
      ),
    );



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Water Intake"),
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          size: Size(200, 225),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 100, width: 100,
            child: LiquidCircularProgressIndicator(
              backgroundColor: Colors.yellow,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              value: animationController!.value,
              center: Text("${percentage.toStringAsFixed(0)}%",
                style: const TextStyle(color: Colors.black,
                ),
              ),
              borderColor: Colors.black,
              borderWidth: 1.0,
              direction: Axis.vertical,
            ))
        ),
      ),
      // body: Column(
      //   children: [
      //     // Expanded(
      //     //   child: sphere
      //     // )

      //       Center(
      //         child: GestureDetector(
      //           onTap: () {
      //             if(animationController!.value == 1.0)
      //             {
      //               animationController!.value = 0;
      //             }
      //             else{
      //               animationController!.value = animationController!.value+0.1;
      //             }


      //             print("Animation val :: ${animationController!.value}");

      //           },
      //           child: Container(
      //             margin: const EdgeInsets.symmetric(vertical: 10),
      //             height: 100, width: 100,
      //             child: LiquidCircularProgressIndicator(
      //               valueColor: const AlwaysStoppedAnimation(Colors.green),
      //               value: animationController!.value,
      //               center: Text("${percentage.toStringAsFixed(0)}%",
      //               style: const TextStyle(color: Colors.black,
      //                ),
      //               ),
      //               borderColor: Colors.black,
      //               borderWidth: 1.0,
      //               direction: Axis.vertical,

      //             ),
      //           ),
      //         ),
      //       ),

      //       Container(
      //         child: CustomPaint(
      //           painter: WaterDropPainter(color: Colors.blue),
      //         ),
      //       ),

      //       // ClipPath(
      //       //   clipper: WaterDropClipper(color: Colors.red),
      //       //   child: Container(
      //       //     width: MediaQuery.of(context).size.width /2 ,
      //       //     height: MediaQuery.of(context).size.height /4 ,
      //       //     color: Colors.amber, // Adjust color here if needed
      //       //   ),
      //       // ),



      //   ],
      // ),
    );
  }
}



//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(50,95);
path_0.cubicTo(69.3,95,85,79.3,85,60);
path_0.cubicTo(85,39,63.4,17.299999999999997,51.8,5.700000000000003);
path_0.cubicTo(50.8,4.700000000000003,49.199999999999996,4.700000000000003,48.3,5.700000000000003);
path_0.cubicTo(36.6,17.3,15,39,15,60);
path_0.cubicTo(15,79.3,30.7,95,50,95);
path_0.close();
path_0.moveTo(50,11);
path_0.cubicTo(61.4,22.4,80,42,80,60);
path_0.cubicTo(80,76.5,66.5,90,50,90);
path_0.cubicTo(33.5,90,20,76.5,20,60);
path_0.cubicTo(20,42,38.6,22.5,50,11);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}
