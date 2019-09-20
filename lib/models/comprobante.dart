import 'comprobanteTipoImpuesto.dart';
import 'comprobanteTipoViatico.dart';
import 'estadoComprobante.dart';

class Comprobante {
  String nroComprobante;
  String puntoDeVenta;
  String tipoFormulario;
  double monto;
  DateTime fecha;

  EstadoComprobante estadoComprobante;

  List<ComprobanteTipoViatico> viaticos;
  List<ComprobanteTipoImpuesto> impuestos;

  Comprobante(this.nroComprobante, this.puntoDeVenta, this.tipoFormulario,
      this.monto, this.fecha, this.estadoComprobante, this.viaticos,
      this.impuestos);


}