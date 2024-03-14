
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantify/ui/tabs/ScanTab/preview_page.dart';
import '../../home/Home.dart';

class ScanTab extends StatefulWidget {
  const ScanTab({Key? key, required this.cameras}) : super(key: key);
  static String routeName = 'ScanTab';

  final List<CameraDescription>? cameras;
  @override
  State<ScanTab> createState() => _ScanTabState();
}

class _ScanTabState extends State<ScanTab> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  bool flashIsOpened=false;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                picture: picture,
              )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }
  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewPage(
              picture: returnImage,
            ))); //close the model sheet
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          (_cameraController.value.isInitialized)
              ? Container(child: CameraPreview(_cameraController),height: double.infinity,)
              : Container(
              color: Colors.black,
              child: const Center(child: CircularProgressIndicator())),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child:
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(

                      child: FloatingActionButton(
                        onPressed: _pickImageFromGallery,
                        child: const Icon(Icons.image, size: 35, color: Colors.white),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    ),
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: takePicture,
                        child: const ImageIcon(
                          AssetImage("assets/images/icons/Camera.png"),
                          color: Colors.white,
                          size: double.maxFinite,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    ),
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                            setState(
                            () => _isRearCameraSelected = !_isRearCameraSelected);
                            initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                        },
                        child: const ImageIcon(
                          AssetImage("assets/images/icons/Rotate.png"),
                          color: Colors.white,
                          size: 35,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    ),
                  ],
                )

              )),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child:
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: (){
                        },
                        child: const ImageIcon(
                          AssetImage("assets/images/icons/Flash off.png"),
                          color: Colors.white,
                          size: 60,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      Spacer(),
                      Text("Scan",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,

                        ),

                      ),
                      Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                        },
                        child: const ImageIcon(
                          AssetImage("assets/images/icons/Cross.png"),
                          color: Colors.white,
                          size: 60,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    ],
                  )

              )),
          Center(
            child: Image.asset("assets/images/scan2.png"),
          )
        ]),);
  }
}

// Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
// Expanded(
// child: IconButton(
// padding: EdgeInsets.zero,
// iconSize: 30,
// icon: Icon(
// _isRearCameraSelected
// ? CupertinoIcons.switch_camera
//     : CupertinoIcons.switch_camera_solid,
// color: Colors.white),
// onPressed: () {
// setState(
// () => _isRearCameraSelected = !_isRearCameraSelected);
// initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
// },
// )),
// Expanded(
// child: IconButton(
// onPressed: takePicture,
// iconSize: 50,
// padding: EdgeInsets.zero,
// constraints: const BoxConstraints(),
// icon: const Icon(Icons.circle, color: Colors.white),
// )),
// const Spacer(),
// ])