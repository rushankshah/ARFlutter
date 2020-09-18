import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'AR Magic',
        theme: ThemeData(primarySwatch: Colors.red),
        home: HomePage(title: 'AR Magic',),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArCoreController arCoreController;
  ArCoreFaceController arCoreFaceController;

  _onArCoreViewCreated(ArCoreController controller){
      arCoreController = controller;
      // _addSphere(arCoreController);
      // _addCylinder(arCoreController);
      _addIronMan(arCoreController);
      _addCaptainAmerica(arCoreController);
      _addThor(arCoreController);
      _addSpiderMan(arCoreController);
      _addBlackWidow(arCoreController);
      _addBlackPanther(arCoreController);
      _addAntMan(arCoreController);
  }
  _addSphere(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/IronMan.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List());
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(
        shape: sphere,
        position: vector.Vector3(0,0,-1),
      );
    controller.addArCoreNode(node);
  }

  _addCylinder(ArCoreController controller){
    final material = ArCoreMaterial(color: Colors.red, reflectance: 0);
    final cylinder = ArCoreCylinder(materials: [material], radius: 0.4, height: 0.3);
    final node = ArCoreNode(
        shape: cylinder,
        position: vector.Vector3(0,-2.5,-3.0),
      );
    controller.addArCoreNode(node);
  }

  _addAntMan(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/AntMan.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List());
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(0,-7,-5),
      );
    controller.addArCoreNode(node);
  }

   _addBlackPanther(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/BlackPanther.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List());
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(0,5,-7),
      );
    controller.addArCoreNode(node);
  }

  _addIronMan(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/IronMan.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List());
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(-0.5,-1.5,-5),
      );
    controller.addArCoreNode(node);
  }
  _addCaptainAmerica(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/Cap2.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List(), metallic: 1);
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(3,3,-5),
      );
    controller.addArCoreNode(node);
  }

  _addThor(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/Thor.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List(), metallic: 1);
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(-3,3,-5),
      );
    controller.addArCoreNode(node);
  }

  _addSpiderMan(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/Spiderman.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List(), metallic: 1);
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(-4,-3,-5),
      );
    controller.addArCoreNode(node);
  }
  _addBlackWidow(ArCoreController controller)async{
    final ByteData texture = await rootBundle.load('assets/BlackWidow.jpg');
    final material = ArCoreMaterial(color: Colors.black,textureBytes: texture.buffer.asUint8List(), metallic: 1);
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(3,3,0));
    final node = ArCoreNode(
        shape: cube,
        position: vector.Vector3(3,-3,-5),
      );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    arCoreFaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated)
    );
  }

  _faceView(ArCoreFaceController controller){
    arCoreFaceController = controller;
    _loadImage();
  }

  _loadImage()async{
      final ByteData textureBytes = await rootBundle.load('assets/IronMan.jpg');
      arCoreFaceController.loadMesh(textureBytes: textureBytes.buffer.asUint8List());
  }

}