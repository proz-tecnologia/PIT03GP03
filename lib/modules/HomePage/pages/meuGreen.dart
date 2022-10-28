import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class MeuGreen extends StatefulWidget {
  const MeuGreen({Key? key}) : super(key: key);

  @override
  State<MeuGreen> createState() => _MeuGreenState();
}

class _MeuGreenState extends State<MeuGreen> {
  int index = 0;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  Map<String, double> listaValores = {
    'Alimentação': 667.89,
    'Transporte': 550.76,
    'Diversão': 238.99,
    'Educação': 235.99,
    'Saúde': 980.55
  };

  List<Color> listaCores = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meu Green'),
      ),
      body: Center(
        child: PieChart(
          dataMap: listaValores,
          colorList: listaCores,
          //Definindo o tamanho da pizza
          chartRadius: MediaQuery.of(context).size.width / 2,
          centerText: '',
          chartType: ChartType.ring,
          ringStrokeWidth: 24,
          animationDuration: const Duration(seconds: 3),
          chartValuesOptions: const ChartValuesOptions(
              //mostrar valores
              showChartValues: true,
              //mostrar valores fora do grafico
              showChartValuesOutside: true,
              //mostrar valores em porcentagem
              showChartValuesInPercentage: false,
              //mostrar o fundo dos valores
              showChartValueBackground: false),
          legendOptions: const LegendOptions(
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
