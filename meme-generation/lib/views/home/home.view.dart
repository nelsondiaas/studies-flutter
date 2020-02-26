import 'package:meme_generation/controllers/file.controller.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math';
import 'dart:io';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final GlobalKey _globalKey = new GlobalKey();
  FileController _fileController;
  Random _rng;

  @override
  void initState() {
    super.initState();
    _fileController = GetIt.instance<FileController>();
    _rng = GetIt.instance<Random>();
  }
  
  @override
  Widget build(BuildContext context) {

    double _layoutWidth = MediaQuery.of(context).size.width;
    double _statusHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
          child: Column(
            children: <Widget>[
               Container(
                height: _statusHeight,
              ),
              Image.asset('assets/images/smiller.png', height: 50),
              Image.asset('assets/images/meme-generator.png', height: 60,),
              SizedBox(height: 5),
              RepaintBoundary(
                  key: _globalKey,
                  child: Stack(
                  children: <Widget>[
                    Observer(
                      builder: (BuildContext context) {
                        return _fileController.image != null ? Image.file(
                        _fileController.image,
                        height: 250,
                        width: _layoutWidth,
                        fit: BoxFit.fitHeight,
                        ) : Container();
                      },
                    ),
                    Container(
                      height: 250,
                      width: _layoutWidth,
                      child: Observer(
                        builder: (context) {
                          return  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                _fileController.headerText.toUpperCase(), 
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26 
                                ),),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                _fileController.footerText.toUpperCase(), 
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26 
                                ),),
                              )
                            ],
                          );
                        }
                      ),
                    )
                  ]
                ),
              ),
              SizedBox(height: 5),
              Observer(
                builder: (context) {
                  return _fileController.imageSelected ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (value) {
                            _fileController.setHeaderText(text: value);
                          },
                          decoration: InputDecoration(
                            hintText: "Header Text"
                          )
                        ),
                        SizedBox(height: 12),
                        TextField(
                          onChanged: (value) {
                            _fileController.setFooterText(text: value);
                          },
                          decoration: InputDecoration(
                            hintText: "Footer Text"
                          )
                        ),
                        Observer(
                          builder: (context) {
                            return RaisedButton(
                              onPressed: () {
                                _takeScreenshot();
                              },
                              child: Text("Save")
                            );
                          }
                        )
                      ],
                    ),
                  ) : Container(
                    child: Center(
                      child: Text("Select image to get started")
                    ),
                  );
                }
              ),
              Observer(
                builder: (context) {
                  return _fileController.imageFile != null ? Image.file(_fileController.imageFile) : Container();
                }
              )
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fileController.getImage();
        },
        child: Icon(Icons.add_a_photo)
      ),
    );
  }

   void _takeScreenshot() async {
    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File imgFile = new File('$directory/screenshot${_rng.nextInt(200)}.png');
    _fileController.setImageFile(img: imgFile);
    _saveFile(file: imgFile);
    imgFile.writeAsBytes(pngBytes);
  }

  _saveFile({File file}) async {
    await _askPermission();
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(await file.readAsBytes()));
  }

  _askPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.photos]);
  }
}