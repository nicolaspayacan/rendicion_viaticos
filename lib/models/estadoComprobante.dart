class EstadoComprobante {
  final int codigoEstadoComprobante;
  final String nombreEstadoComprobante;

  const EstadoComprobante(this.codigoEstadoComprobante, this.nombreEstadoComprobante);

  static const PENDIENTE = const EstadoComprobante(1, "Pendiente");
  static const RENDIDO = const EstadoComprobante(2, "Rendido");
  static const ANULADO = const EstadoComprobante(3, "Anulado");
}