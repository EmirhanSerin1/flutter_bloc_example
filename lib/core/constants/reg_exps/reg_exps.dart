class AllRegExps{
  static RegExp mailReg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp nameReg = RegExp(r'^.{2,}$');
  static RegExp phoneNumber = RegExp(r'^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}');
  static RegExp password = RegExp(r'^[a-zA-Z0-9].{5,}$');


}