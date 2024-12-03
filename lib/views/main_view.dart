import 'package:animated_3d_character/models/animation_model.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  late String animation;
  late bool cameraControls;
  late bool autoPlay;
  late bool autoRotate;
  int selectedAnimation = -1;
  Key widgetKey = UniqueKey();

  @override
  void initState() {
    animation = "";
    cameraControls = false;
    autoPlay = false;
    autoRotate = false;
    super.initState();
  }
  rebuildWidget(){
      setState(() {
        widgetKey = UniqueKey();
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              child: O3D.asset(
                key: widgetKey,
                src: "assets/CHICKEN.glb",
                cameraTarget: CameraTarget(0, 0.2, 0.2),
                cameraControls: cameraControls,
                autoPlay: autoPlay,
                animationName: animation,
                autoRotate: autoRotate,
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(cameraControls ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        cameraControls = !cameraControls;
                      });
                      rebuildWidget();
                      debugPrint('cameraControls $cameraControls');
                    },
                  ),
                  IconButton(
                    icon: Icon(autoPlay ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        autoPlay = !autoPlay;
                      });
                      rebuildWidget();
                    },
                  ),
                  IconButton(
                    icon: Icon(autoRotate ? Icons.rotate_right : Icons.rotate_left),
                    onPressed: () {
                      setState(() {
                        autoRotate = !autoRotate;
                      });
                      rebuildWidget();
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.3,
              padding: EdgeInsets.symmetric( vertical: size.height * 0.02, horizontal: size.width * 0.04),
              margin: EdgeInsets.symmetric( vertical: size.height * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.black.withOpacity(0.09),
                    offset: const Offset(0, -1)
                  )
                ]
              ),
              child: ListView.builder(
                  itemCount: AnimationModel.animations.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    AnimationModel _animation = AnimationModel.animations[index];
                    bool isActive = index == selectedAnimation;
                    return GestureDetector(
                    onTap: (){
                      animation = _animation.animationKey.toString();
                      selectedAnimation = index;
                      rebuildWidget();
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_animation.name, style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: isActive ? FontWeight.w600 : FontWeight.w400),),
                        isActive ? const Icon(Icons.done, color: Colors.black,) : const SizedBox.shrink()
                      ],
                    ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
