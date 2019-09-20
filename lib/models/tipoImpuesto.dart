class TipoImpuesto {
  final int codigoTipoImpuesto;
  final bool esPorcentual;
  final double porcentaje;
  final bool esBasePrincipal;

  const TipoImpuesto(this.codigoTipoImpuesto, this.esPorcentual, this.porcentaje,
      this.esBasePrincipal);

  static const IVA = const TipoImpuesto(1, true, 0.21, true);
  static const IIBB = const TipoImpuesto(2, false, 100, true);
  static const FOO = const TipoImpuesto(3, true, 0.10, true);
}