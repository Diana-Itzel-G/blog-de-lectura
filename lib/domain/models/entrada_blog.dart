/// Modelo de dominio: una entrada (resena) del blog de lectura.
class EntradaBlog {
  final int id;
  final String titulo;
  final String autor;
  final String genero;
  final String portada;
  final double calificacion;
  final int paginas;
  final String fecha; // formato ISO: 2026-10-12
  final bool destacada;
  final String sinopsis;
  final List<String> resenia;
  final List<String> etiquetas;
  final List<String> destacados;

  const EntradaBlog({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.genero,
    required this.portada,
    required this.calificacion,
    required this.paginas,
    required this.fecha,
    required this.destacada,
    required this.sinopsis,
    required this.resenia,
    required this.etiquetas,
    required this.destacados,
  });

  /// Mapeo estricto JSON -> objeto Dart.
  factory EntradaBlog.fromJson(Map<String, dynamic> json) {
    return EntradaBlog(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      autor: json['autor'] as String,
      genero: json['genero'] as String,
      portada: json['portada'] as String,
      // num cubre tanto 5 como 4.5 que vienen del JSON
      calificacion: (json['calificacion'] as num).toDouble(),
      paginas: json['paginas'] as int,
      fecha: json['fecha'] as String,
      destacada: json['destacada'] as bool? ?? false,
      sinopsis: json['sinopsis'] as String,
      resenia: List<String>.from(json['resenia'] as List),
      etiquetas: List<String>.from(json['etiquetas'] as List),
      destacados: List<String>.from(json['destacados'] as List),
    );
  }

  /// Fecha en formato corto en espanol, por ejemplo "12 oct 2026".
  String get fechaLegible {
    final f = DateTime.tryParse(fecha);
    if (f == null) return fecha;
    const meses = [
      'ene', 'feb', 'mar', 'abr', 'may', 'jun',
      'jul', 'ago', 'sep', 'oct', 'nov', 'dic',
    ];
    return '${f.day} ${meses[f.month - 1]} ${f.year}';
  }

  /// Estimacion: unos 2 minutos por pagina.
  int get horasDeLectura {
    final horas = (paginas * 2 / 60).ceil();
    return horas < 1 ? 1 : horas;
  }
}
