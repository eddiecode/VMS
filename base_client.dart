import 'package:http/http.dart' as http;

const String baseurl = 'http://localhost:3300/visitors';
class BaseClient {
  var client = http.Client();

  // GET

  Future<dynamic> get(String api) async {
    var baseUrl;
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

     var response = await client.get(url);
     if (response.statusCode ==200)
       {
         return response.body;
       }
          else
            {
              //throw exception abd catch it in UI
            }

   }

   Future<dynamic> post(String api) async {}

   Future<dynamic> put(String api) async {}

   Future<dynamic> delete(String api) async {}
}
