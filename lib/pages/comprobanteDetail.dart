import 'package:flutter/material.dart';
import '../models/comprobante.dart';
import '../models/estadoComprobante.dart';
import '../models/comprobanteTipoImpuesto.dart';
import '../models/comprobanteTipoViatico.dart';
import '../models/tipoImpuesto.dart';
import '../models/tipoViatico.dart';

class ComprobanteDetail extends StatefulWidget {
  final Comprobante comprobante;
  final bool isEditing;

  ComprobanteDetail(this.comprobante, this.isEditing);

  @override
  _ComprobanteDetailState createState() => _ComprobanteDetailState();
}

class _ComprobanteDetailState extends State<ComprobanteDetail> {
  @override
  Widget build(BuildContext context) {
    Widget mainWidget;
    if (widget.comprobante != null) {
      mainWidget = widget.isEditing
          ? _showModifyForm(widget.comprobante)
          : _showDetail(widget.comprobante);
    } else {
      mainWidget = _showNewForm();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
      ),
      body: Container(
        child: mainWidget,
      ),
    );
  }

  _getAppBarTitle() {
    String appBarTitle =
        widget.comprobante == null ? "Nuevo comprobante" : "Detalle";
    appBarTitle = widget.isEditing ? "Modificar comprobate" : appBarTitle;
    return appBarTitle;
  }

  _showDetail(Comprobante comprobante) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Número: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(comprobante.nroComprobante),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Punto de Venta: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(comprobante.puntoDeVenta),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tipo: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(comprobante.tipoFormulario),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Monto: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$${comprobante.monto}"),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Estado: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(comprobante.estadoComprobante.nombreEstadoComprobante),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Viáticos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _createViaticosTable(comprobante.viaticos),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Impuestos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _createImpuestosTable(comprobante.impuestos),
          ],
        ),
      ],
    );
  }

  _showModifyForm(Comprobante comprobante) {
    return Text("Modify form");
  }

  _showNewForm() {
    int _currentComprobanteEstado;
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Número: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "No puede quedar vacio";
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Punto de Venta: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: TextFormField(),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tipo: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: TextFormField(),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Monto: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: TextFormField(),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Estado: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: DropdownButton(
                    value: _currentComprobanteEstado,
                    items: [
                      DropdownMenuItem(
                        value:
                            EstadoComprobante.PENDIENTE.codigoEstadoComprobante,
                        child: Text(EstadoComprobante
                            .PENDIENTE.nombreEstadoComprobante),
                      ),
                    ],
                    onChanged: null,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Viáticos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //_createViaticosTable(comprobante.viaticos),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Impuestos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //_createImpuestosTable(comprobante.impuestos),
            ],
          ),
        ],
      ),
    );
  }

  _createViaticosTable(List<ComprobanteTipoViatico> viaticos) {
    List<TableRow> _rows = [];
    _rows.add(
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Código",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Tipo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Monto",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
    for (int i = 0; i < viaticos.length; i++) {
      _rows.add(
        TableRow(
          children: [
            Center(
                child:
                    Text(viaticos[i].codigoComprobanteTipoViatico.toString())),
            Center(child: Text(viaticos[i].tipoViatico.nombreTipoViatico)),
            Center(child: Text("\$${viaticos[i].montoTipoViatico.toString()}")),
          ],
        ),
      );
    }
    return Table(
      border: TableBorder(
        top: BorderSide(width: 1),
        horizontalInside: BorderSide(width: 1),
        bottom: BorderSide(width: 1),
      ),
      children: _rows,
    );
  }

  _createImpuestosTable(List<ComprobanteTipoImpuesto> impuestos) {
    List<TableRow> _rows = [];
    _rows.add(
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Código",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Monto",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Porcentaje",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
    for (int i = 0; i < impuestos.length; i++) {
      _rows.add(
        TableRow(children: [
          Center(
            child: Text(impuestos[i].codigoComprobanteTipoImpuesto.toString()),
          ),
          Center(
            child: Text("\$${impuestos[i].montoTipoImpuesto.toString()}"),
          ),
          Center(
            child: impuestos[i].tipoImpuesto.esPorcentual
                ? Text(impuestos[i].tipoImpuesto.porcentaje.toString())
                : Text(" - "),
          ),
          Center(
            child: impuestos[i].tipoImpuesto.esPorcentual
                ? Text((impuestos[i].tipoImpuesto.porcentaje *
                        impuestos[i].montoTipoImpuesto)
                    .toString())
                : Text(
                    impuestos[i].montoTipoImpuesto.toString(),
                  ),
          ),
        ]),
      );
    }
    return Table(
      border: TableBorder(
        top: BorderSide(width: 1),
        horizontalInside: BorderSide(width: 1),
        bottom: BorderSide(width: 1),
      ),
      children: _rows,
    );
  }
}
