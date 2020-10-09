part of '../pages.dart';

class ChartBar extends StatefulWidget {
  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  List<charts.Series> seriesList;
  bool animate, isLoading = true;

  static List<charts.Series<ChartModel, String>> _createData(List<ChartModel> listData) {
    return [
      new charts.Series<ChartModel, String>(
        id: 'Omzet',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartModel omzet, _) => omzet.bulan,
        measureFn: (ChartModel omzet, _) => omzet.total,
        data: listData,
        fillColorFn: (ChartModel omzet, _) {
          switch (omzet.bulan) {
            case 'Januari': return charts.MaterialPalette.red.makeShades(2)[1]; break;
            default: return charts.MaterialPalette.blue.makeShades(2)[1]; break;
          }
        })
    ];
  }

  Future<void> _initializeChart() async{
    setState(() { isLoading = true; });

    final result = await ChartService.getOmzet();

    final List<ChartModel> listData = [];
    result.forEach((e) => listData.add(e));

    setState(() {
      seriesList = _createData(listData);
      isLoading = false;
    });
  }

  @override
  void initState() { 
    super.initState();
    _initializeChart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Bar'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async{
              _initializeChart();
            },
          )
        ],
      ),

      body: isLoading ? SpinKitCircle(size: 50, color: Colors.blue) : seriesList == null ? Center(
        child: Text('Tidak ada data'),
      ) : 
      
      Container(
        padding: EdgeInsets.all(15),
        child: charts.BarChart(
          seriesList,
          animate: animate,
          domainAxis: new charts.OrdinalAxisSpec(
              renderSpec: charts.SmallTickRendererSpec(
              labelRotation: 45,
            ),
          ),
        ),
      ),
      
    );
  }
}