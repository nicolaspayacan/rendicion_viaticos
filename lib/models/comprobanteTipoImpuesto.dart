import 'tipoImpuesto.dart';

class ComprobanteTipoImpuesto {
  int codigoComprobanteTipoImpuesto;
  double montoBase;
  double montoTipoImpuesto;

  TipoImpuesto tipoImpuesto;

  ComprobanteTipoImpuesto(this.codigoComprobanteTipoImpuesto, this.montoBase,
      this.montoTipoImpuesto, this.tipoImpuesto);


}