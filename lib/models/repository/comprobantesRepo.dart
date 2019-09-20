import '../comprobante.dart';
import '../estadoComprobante.dart';
import '../comprobanteTipoImpuesto.dart';
import '../comprobanteTipoViatico.dart';
import '../tipoImpuesto.dart';
import '../tipoViatico.dart';

class ComprobantesRepo {
  static List<Comprobante> comprobantes = [
    Comprobante(
      "11",
      "11",
      "Factura",
      12.32,
      DateTime.now(),
      EstadoComprobante.PENDIENTE,
      [
        ComprobanteTipoViatico(1, 12, TipoViatico.FACTURA_A),
        ComprobanteTipoViatico(2, 12, TipoViatico.FACTURA_A),
      ],
      [
        ComprobanteTipoImpuesto(1, 12.32, 5.0, TipoImpuesto.IVA),
        ComprobanteTipoImpuesto(2, 12.32, 6.0, TipoImpuesto.IIBB),
      ],
    ),
    Comprobante(
      "12",
      "12",
      "Factura",
      12.32,
      DateTime.now(),
      EstadoComprobante.PENDIENTE,
      [
        ComprobanteTipoViatico(3, 12, TipoViatico.FACTURA_A),
        ComprobanteTipoViatico(4, 12, TipoViatico.FACTURA_A),
      ],
      [
        ComprobanteTipoImpuesto(3, 12.32, 5.0, TipoImpuesto.IVA),
        ComprobanteTipoImpuesto(4, 12.32, 6.0, TipoImpuesto.IIBB),
      ],
    ),
  ];
}
