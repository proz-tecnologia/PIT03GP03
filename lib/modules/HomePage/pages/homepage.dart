import 'package:flutter/material.dart';
import 'package:green/modules/HomePage/Controller/home_controller.dart';
import 'package:provider/provider.dart';
import '../../../models/transaction/transaction_model.dart';
import 'drawer_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool _isMeuGreen = false;
  static const Color _primaryColor = Colors.green;
  static const Color _secondaryColor = Colors.white38;
  static const Color _thirdColor = Colors.deepOrangeAccent;

//list imagens = transações

  final List<TransactionModel> _transactionList =
      []; /*[
    // modificar para o list Icon
    TransactionModel(
      logo2: 'assets/mcdonalds.png',
      name: "Ifood",
      amount: '-32,50',
      title: '',
      dateTime: DateTime.now(),
    ),
    TransactionModel(
      logo2: 'assets/academia.png',
      name: "PROZ Fitness",
      amount: '-100,00',
      title: '',
      dateTime: DateTime.now(),
    ),
    TransactionModel(
      logo2: 'assets/contas.png',
      name: "Contas",
      amount: '',
      title: '',
      dateTime: DateTime.now(),
    ),
    TransactionModel(
      logo2: 'assets/petshop.png',
      name: "PetShop",
      amount: '-22,50',
      title: '',
      dateTime: DateTime.now(),
    ),
    TransactionModel(
      logo2: 'assets/combustivel.png',
      name: "Gasolina",
      amount: '-100,00',
      title: '',
      dateTime: DateTime.now(),
    ),
    TransactionModel(
      logo2: 'assets/transporte.png',
      name: "Uber",
      amount: '-35,00',
      title: '',
      dateTime: DateTime.now(),
    ),
    TransactionModel(
      logo2: 'assets/mercado.png',
      name: "Atacadão",
      amount: '-350,00',
      title: '',
      dateTime: DateTime.now(),
    ),
  ];
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const DrawerApp(),
      body: Consumer<HomeController>(builder: (context, controller, __) {
        return Column(
          children: [
            _appbarBotomSection(),
            _mainBoard(),
          ],
        );
      }),
    );
  }

  ///widgets Homer perfil
  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: _primaryColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
          )
        ]);
  }

//appBar Bottom Sequencia

  _appbarBotomSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              // entrar com a logica no lugar do texto
              Text(
                'R\$ ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              // entrar com a logica no lugar do texto
              Text('640,00 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Contas do Mês ',
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // dentro do planejamento
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isMeuGreen = !_isMeuGreen;
                  });
                },
                child: Text(
                  'Meu Green',
                  style: TextStyle(
                      color: _isMeuGreen ? _secondaryColor : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 2),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMeuGreen = !_isMeuGreen;
                    });
                  },
                  child: Text(
                    'Valores gastos',
                    style: TextStyle(
                        color: _isMeuGreen ? Colors.white : _secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 2),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  //aqui começa os widgets com graficos
  Expanded _mainBoard() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _reportCell(
                isSavings: true,
                title: 'Combustivel',
                gastos: 'R\$ 150,00',
                progress: 25),
            //icone vermelho
            const SizedBox(height: 16),
            _reportCell(
                isSavings: false,
                title: ' Limite Financeiro',
                gastos: 'R\$ 640,00',
                progress: 50),
            const SizedBox(
              height: 32,
            ),
            //texto na main
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Transações',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Valor',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),

                // listview widgets (trocar para logica transações

                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _transactionList.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: _primaryColor.withOpacity(0.1)),
                      ),
                      child: Image.asset(_transactionList[index].logo2,
                          fit: BoxFit.cover, width: 30, height: 30),
                    ),
                    title: Text(_transactionList[index].name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: Text(
                      _transactionList[index].dateTime.toString(),
                      style: TextStyle(
                        color: _primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      _transactionList[index].amount,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///Report Cell
  Container _reportCell({
    required bool isSavings,
    required String title,
    required String gastos,
    required int progress,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSavings ? Colors.white : _thirdColor,
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? []
            : [
                BoxShadow(
                    color: _thirdColor.withOpacity(0.4),
                    offset: const Offset(1, 0),
                    blurRadius: 10),
              ],
      ),

//graficos adicionar logica

      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? Colors.black.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$progress%',
                  style: TextStyle(
                    color: isSavings ? Colors.black : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),

          //graficos 2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: isSavings ? Colors.black : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInner(
                    isSavings: isSavings,
                    title: 'gastos',
                    value: gastos,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Column _reportInner(
    {required bool isSavings, required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          color: isSavings
              ? _HomePage2State._primaryColor.withOpacity(0.5)
              : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: TextStyle(
          color: isSavings ? Colors.black87 : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
