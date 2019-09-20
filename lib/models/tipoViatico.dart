class TipoViatico {
  final int codigoTipoViatico;
  final String nombreTipoViatico;

  const TipoViatico(this.codigoTipoViatico, this.nombreTipoViatico);

  static const FACTURA_A = const TipoViatico(1, "Factura A");
  static const FACTURA_B = const TipoViatico(2, "Factura B");
  static const FACTURA_C = const TipoViatico(3, "Factura C");
}