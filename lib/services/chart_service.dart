part of 'services.dart';

class ChartService {
  static Future<List<ChartModel>> getOmzet() async{
    final response = await http.get('your_api_url');
    final data = json.decode(response.body);

    List result = data['status'] ? data['result'] : [];
    return result.map((e) => ChartModel.fromJson(e)).toList();
  }
}