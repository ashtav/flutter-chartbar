part of 'models.dart';

class ChartModel extends Equatable {
  final String bulan;
  final int total;
  ChartModel({this.bulan, this.total});

  factory ChartModel.fromJson(Map<String, dynamic> map) => ChartModel(
    bulan: map['bulan'], total: int.parse(map['total'])
  );

  @override
  List<Object> get props => [bulan, total];
}