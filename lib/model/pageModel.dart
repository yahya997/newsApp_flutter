import 'package:flutter/cupertino.dart';

class PageModel {
  String _title, _description, _image;
  IconData _icon;

  PageModel(this._title, this._description, this._image, this._icon);

  IconData get icon => _icon;

  get image => _image;

  get description => _description;

  String get title => _title;
}