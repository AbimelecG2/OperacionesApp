import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Aritmeticas',
      home: PaginaPrincipal(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  TextEditingController controladorNumero1 = TextEditingController();
  TextEditingController controladorNumero2 = TextEditingController();
  String operacion = 'Suma';
  String resultado = '';
  double alturaCampoTexto = 60;

  void calcularResultado() {
    double num1 = double.tryParse(controladorNumero1.text) ?? 0;
    double num2 = double.tryParse(controladorNumero2.text) ?? 0;
    double res;

    switch (operacion) {
      case 'Suma':
        res = num1 + num2;
        break;
      case 'Resta':
        res = num1 - num2;
        break;
      case 'Multiplicación':
        res = num1 * num2;
        break;
      case 'División':
        res = num2 != 0 ? num1 / num2 : 0;
        break;
      default:
        res = 0;
    }

    setState(() {
      resultado = 'Resultado: $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Aritmeticas',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            construirCampoTexto(
                controladorNumero1, 'Primer Número', alturaCampoTexto),
            SizedBox(height: 20),
            construirCampoTexto(
                controladorNumero2, 'Segundo Número', alturaCampoTexto),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: operacion,
                  isExpanded: true,
                  onChanged: (String? nuevoValor) {
                    setState(() {
                      operacion = nuevoValor!;
                    });
                  },
                  items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: alturaCampoTexto,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child:
                      Text(resultado, style: TextStyle(color: Colors.black))),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: calcularResultado,
              child: const Icon(Icons.play_arrow),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget construirCampoTexto(
      TextEditingController controller, String etiqueta, double altura) {
    return Container(
      height: altura,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: etiqueta,
          labelStyle: TextStyle(color: Colors.black),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
