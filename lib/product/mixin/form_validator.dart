import 'package:strapi_provider/product/constants/string_constants.dart';
import 'package:strapi_provider/product/extension/string_extension.dart';

mixin FormValidate {
  String? emailValidation(String? mail) {
    if (mail != null && mail.isNotEmpty) {
      if (mail.emailValid()) {
        return null;
      } else {
        return invalidEmailText;
      }
    } else {
      return emailCannotBeEmpty;
    }
  }

  String? passwordControl(String? value) {
    if (value != null && value.length > 5) {
      return null;
    } else {
      return passwordCharacterWarning;
    }
  }
}