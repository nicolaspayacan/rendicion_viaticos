import 'package:flutter/material.dart';
import 'package:rendicion_viaticos/models/estadoComprobante.dart';
import 'models/repository/comprobantesRepo.dart';
import 'models/comprobante.dart';
import 'package:intl/intl.dart';

import 'pages/comprobanteDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Comprobantes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  List<Comprobante> comprobantes = ComprobantesRepo.comprobantes;

  /*
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: comprobantes.length,
        itemBuilder: (ctx, index) {
          /*
          return ExpansionTile(
            title: Text("Comprobante ${comprobantes[index].nroComprobante} - ${DateFormat('dd-MM-yyyy')
                .format(comprobantes[index].fecha)}"),
            children: _buildComprobanteDetail(comprobantes[index]),
          );
          */
          return InkWell(
            onTap: () {
              _showComprobanteDetail(comprobantes[index]);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                    "Comprobante ${comprobantes[index].nroComprobante} - ${DateFormat('dd-MM-yyyy').format(comprobantes[index].fecha)} - [${comprobantes[index].estadoComprobante.nombreEstadoComprobante.substring(0,1)}]",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _editComprobante(comprobantes[index]);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteDialog(comprobantes[index]);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createComprobante,
        tooltip: 'Nuevo',
        label: Text("Nuevo"),
        icon: Icon(Icons.receipt),
        //child: Icon(Icons.add),
      ),
      // ng comma makes auto-formatting nicer for build methods.
    );
  }

  _showComprobanteDetail(Comprobante comprobante) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ComprobanteDetail(comprobante, false)));
  }

  _editComprobante(Comprobante comprobante) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ComprobanteDetail(comprobante, true)));
  }

  _showDeleteDialog(Comprobante comprobante) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atención"),
          content: Text("Seguro que desea anular el comprobante Nro: ${comprobante.nroComprobante}?"),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            new FlatButton(
              onPressed: () {
                _deleteComprobante(comprobante);
                Navigator.of(context).pop();
              },
              child: Text("Si"),
            ),
          ],
        );
      },
    );
  }

  _deleteComprobante(Comprobante comprobante) {
    List<Comprobante> _comprobantes = comprobantes;
    //_comprobantes.firstWhere((c) => c.nroComprobante == comprobante.nroComprobante);
    int index = _comprobantes.indexWhere((c) => c.nroComprobante == comprobante.nroComprobante);
    _comprobantes[index].estadoComprobante = EstadoComprobante.ANULADO;
    setState(() {
      comprobantes = _comprobantes;
    });
  }

  _createComprobante() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ComprobanteDetail(null, true)));
  }
/*
  _buildComprobanteDetail(Comprobante comprobante) {
    return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Nro: ${comprobante.nroComprobante}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text("Punto de Venta: ${comprobante.puntoDeVenta}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text("Tipo: ${comprobante.tipoFormulario}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text("Monto: ${comprobante.monto}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text("Estado: ${comprobante.estadoComprobante
                  .nombreEstadoComprobante}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    )
    ,
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    <Widget>[
    Padding(
    padding: const EdgeInsets
        .all(8.0),
    child: Text(
    "Viaticos", style: TextStyle(fontSize:
    16, fontWeight: FontWeight.bold), )
    ,
    ),
    Padding(
    padding: const EdgeInsets.
    all(8.0),
    child: Table(
    border
        : TableBorder.all(width: 1),
    children: [
    TableRow(
    children: [
    Text(
    "Tipo"),
    Text("Monto"
    ),
    ],
    ),
    ...comprobante.
    viaticos.map((viatico)
    {
    return TableRow(
    children: [
    Text(viatico.tipoViatico.nombreTipoViatico),
    Text(viatico.montoTipoViatico.toString()),
    ],
    );
    }
    ),
    ],
    ),
    ),

    ],
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Padding(
    padding:
    const EdgeInsets.all(8.0),
    child:
    Text("Impuestos", style: TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold)
    , ),
    ),
    Padding(
    padding: const
    EdgeInsets.all(8.0),
    child: Table
    (
    border: TableBorder.all(width: 1
    ),
    children: [
    TableRow(
    children: [
    Text("Monto Base", style: TextStyle(
    fontWeight: FontWeight.bold), ),
    Text
    ("Monto", style: TextStyle(fontWeight
        : FontWeight.bold), ),
    Text(
    "Porcentaje", style: TextStyle(fontWeight:
    FontWeight.bold), ),
    Text("
    Final", style: TextStyle(fontWeight: FontWeight
        .
    bold
    )
    ,
    )
    ,
    ]
    ,
    )
    ,
    ..
        .
    comprobante
        .
    impuestos
        .
    map
    (
    (
    impuesto
    )
    {
    return TableRow(
    children: [
    Text(impuesto.montoBase.toString()),
    Text(impuesto.montoTipoImpuesto.toString()),
    impuesto.tipoImpuesto.esPorcentual ?
    Text(impuesto.tipoImpuesto.porcentaje.toString())
        : Text(" - "),
    impuesto.tipoImpuesto.esPorcentual ?
    Text((impuesto.montoTipoImpuesto * impuesto.tipoImpuesto.porcentaje).toString())
        : Text(impuesto.montoTipoImpuesto.toString()),
    ],
    );
    }
    )
        .
    toList
    (
    )
    ,
    ]
    ,
    )
    ,
    )
    ,
    ]
    ,
    )
    ,
    ];
  }
  */
}
