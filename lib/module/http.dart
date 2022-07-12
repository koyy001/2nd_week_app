import 'dart:convert';
import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.249.18.151:443";

Future<RequestResult> http_post(String route, [dynamic data]) async
{
  var url = "$PROTOCOL://$DOMAIN/$route";
  var dataStr = jsonEncode(data);
  var result = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: dataStr);
  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> http_get(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(Uri.parse(url));
  return RequestResult(true, jsonDecode(result.body));
}