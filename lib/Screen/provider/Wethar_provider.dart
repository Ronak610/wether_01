import 'package:flutter/cupertino.dart';

class WetherProvider extends ChangeNotifier
{
  TextEditingController txtSearch = TextEditingController();
  String contry="surat";
  void ChnageCountry(data)
  {
    contry=data;
    print("=====$contry");
    notifyListeners();
  }
}