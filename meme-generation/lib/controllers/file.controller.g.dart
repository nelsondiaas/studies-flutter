// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FileController on _FileControllerBase, Store {
  Computed<String> _$headerTextComputed;

  @override
  String get headerText =>
      (_$headerTextComputed ??= Computed<String>(() => super.headerText)).value;
  Computed<String> _$footerTextComputed;

  @override
  String get footerText =>
      (_$footerTextComputed ??= Computed<String>(() => super.footerText)).value;
  Computed<File> _$imageFileComputed;

  @override
  File get imageFile =>
      (_$imageFileComputed ??= Computed<File>(() => super.imageFile)).value;
  Computed<File> _$imageComputed;

  @override
  File get image =>
      (_$imageComputed ??= Computed<File>(() => super.image)).value;
  Computed<bool> _$imageSelectedComputed;

  @override
  bool get imageSelected =>
      (_$imageSelectedComputed ??= Computed<bool>(() => super.imageSelected))
          .value;

  final _$_headerTextAtom = Atom(name: '_FileControllerBase._headerText');

  @override
  String get _headerText {
    _$_headerTextAtom.context.enforceReadPolicy(_$_headerTextAtom);
    _$_headerTextAtom.reportObserved();
    return super._headerText;
  }

  @override
  set _headerText(String value) {
    _$_headerTextAtom.context.conditionallyRunInAction(() {
      super._headerText = value;
      _$_headerTextAtom.reportChanged();
    }, _$_headerTextAtom, name: '${_$_headerTextAtom.name}_set');
  }

  final _$_footerTextAtom = Atom(name: '_FileControllerBase._footerText');

  @override
  String get _footerText {
    _$_footerTextAtom.context.enforceReadPolicy(_$_footerTextAtom);
    _$_footerTextAtom.reportObserved();
    return super._footerText;
  }

  @override
  set _footerText(String value) {
    _$_footerTextAtom.context.conditionallyRunInAction(() {
      super._footerText = value;
      _$_footerTextAtom.reportChanged();
    }, _$_footerTextAtom, name: '${_$_footerTextAtom.name}_set');
  }

  final _$_imageAtom = Atom(name: '_FileControllerBase._image');

  @override
  File get _image {
    _$_imageAtom.context.enforceReadPolicy(_$_imageAtom);
    _$_imageAtom.reportObserved();
    return super._image;
  }

  @override
  set _image(File value) {
    _$_imageAtom.context.conditionallyRunInAction(() {
      super._image = value;
      _$_imageAtom.reportChanged();
    }, _$_imageAtom, name: '${_$_imageAtom.name}_set');
  }

  final _$_imageFileAtom = Atom(name: '_FileControllerBase._imageFile');

  @override
  File get _imageFile {
    _$_imageFileAtom.context.enforceReadPolicy(_$_imageFileAtom);
    _$_imageFileAtom.reportObserved();
    return super._imageFile;
  }

  @override
  set _imageFile(File value) {
    _$_imageFileAtom.context.conditionallyRunInAction(() {
      super._imageFile = value;
      _$_imageFileAtom.reportChanged();
    }, _$_imageFileAtom, name: '${_$_imageFileAtom.name}_set');
  }

  final _$_imageSelectedAtom = Atom(name: '_FileControllerBase._imageSelected');

  @override
  bool get _imageSelected {
    _$_imageSelectedAtom.context.enforceReadPolicy(_$_imageSelectedAtom);
    _$_imageSelectedAtom.reportObserved();
    return super._imageSelected;
  }

  @override
  set _imageSelected(bool value) {
    _$_imageSelectedAtom.context.conditionallyRunInAction(() {
      super._imageSelected = value;
      _$_imageSelectedAtom.reportChanged();
    }, _$_imageSelectedAtom, name: '${_$_imageSelectedAtom.name}_set');
  }

  final _$getImageAsyncAction = AsyncAction('getImage');

  @override
  Future<dynamic> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  final _$_FileControllerBaseActionController =
      ActionController(name: '_FileControllerBase');

  @override
  void setImageFile({File img}) {
    final _$actionInfo = _$_FileControllerBaseActionController.startAction();
    try {
      return super.setImageFile(img: img);
    } finally {
      _$_FileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeaderText({String text}) {
    final _$actionInfo = _$_FileControllerBaseActionController.startAction();
    try {
      return super.setHeaderText(text: text);
    } finally {
      _$_FileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFooterText({String text}) {
    final _$actionInfo = _$_FileControllerBaseActionController.startAction();
    try {
      return super.setFooterText(text: text);
    } finally {
      _$_FileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'headerText: ${headerText.toString()},footerText: ${footerText.toString()},imageFile: ${imageFile.toString()},image: ${image.toString()},imageSelected: ${imageSelected.toString()}';
    return '{$string}';
  }
}
