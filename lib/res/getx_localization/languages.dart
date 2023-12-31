import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': ' Email',
          'internet_exception':
              "We're unable to show results. \nPlease check your data \nconnection.",
          'general_exception':
              "We're unable to process your request. \n Please try  again",
          'welcome': "Welcome\nBack",
          'login': 'Login',
          'password_hint': 'Password'
        },
        'bn_BD': {'email_hint': 'ইমেইল প্রদান করুন'}
      };
}
