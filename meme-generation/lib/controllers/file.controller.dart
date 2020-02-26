import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
part 'file.controller.g.dart';

class FileController = _FileControllerBase with _$FileController;

abstract class _FileControllerBase with Store {
  
  @observable
  String _headerText = "";

  @observable
  String _footerText = "";

  @observable
  File _image = null;

  @observable
  File _imageFile = null;

  @observable
  bool _imageSelected = false;
  
  @computed
  String get headerText => _headerText;

  @computed
  String get footerText => _footerText;

  @computed
  File get imageFile => _imageFile;

  @computed
  File get image => _image;

  @computed
  bool get imageSelected => _imageSelected;

  @action
  void setImageFile({File img}) {
    _imageFile = img;
  }

  @action 
  void setHeaderText({String text}) {
    _headerText = text;
  }

  @action 
  void setFooterText({String text}) {
    _footerText = text;
  }

  @action
  Future getImage() async {
    var image;
    try {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    } catch(error) {
      print("Error load image: ${error}");
    }
    if (image != null) {
      _imageSelected = true;
    }
    _image = image;
    var path = new Directory('storage/emulated/0/' + 'MemeGenerator').create(recursive: true);
    print("TESTS: $path");
  }
}