# Entre Páginas — blog de lectura (Práctica 3)

App Flutter que lee reseñas desde un JSON local y las muestra como un blog de lectura.
Basada en el recetario mixteco de referencia (mismo flujo: JSON → modelo → lista → detalle), ampliada a la rúbrica.

## Cómo correrla

```bash
cd blog_lectura
flutter create .        # genera android/ios/web sin pisar lib/ ni pubspec.yaml
flutter pub get
flutter analyze
flutter test
flutter run
```

## Arquitectura por capas

```
lib/
  core/theme/               app_theme.dart            paleta suave y estilos
  domain/models/            entrada_blog.dart         modelo + fromJson
  data/datasources/         blog_local_datasource.dart  lee assets/data/entradas.json
  data/repositories/        blog_repository.dart      JSON crudo -> modelos
  presentation/controllers/ blog_controller.dart      estado (favoritos, leídos, búsqueda)
                            blog_scope.dart           InheritedNotifier (sin paquetes)
  presentation/screens/     6 pantallas
  presentation/widgets/     16 widgets reutilizables
  main.dart
```

Regla de dependencias: `presentation → data → domain`. Las pantallas nunca leen el JSON directamente.

## Pantallas (Navigator.push / pop)

1. `SplashScreen` → `pushReplacement` a Home
2. `HomeScreen` → destacadas + todas las reseñas
3. `DetalleScreen` → recibe la `EntradaBlog` por constructor
4. `BuscarScreen` → texto + filtro por género
5. `FavoritosScreen`
6. `PerfilScreen` ("Mi estantería")

## Custom widgets (todos reciben parámetros por constructor)

`PortadaImagen`, `EntradaCard`, `EntradaDestacada`, `CalificacionEstrellas`, `EtiquetaChip`,
`SeccionTitulo`, `BotonFavorito`, `DatoLibro`, `CampoBusqueda`, `FiltroGenero`,
`DestacadoItem`, `EstadoVacio`, `EstadisticaTile`, `BotonPrincipal`, `ParrafoLectura`, `MenuLateral`.

## Para personalizar

- Edita `assets/data/entradas.json`: las reseñas, calificaciones y páginas son ejemplos; reescríbelas con tu opinión.
- Para usar portadas reales, cambia el campo `portada` por la URL de la imagen (la app ya muestra un icono si no carga).

## Plan de Git sugerido (2 integrantes)

Ramas por funcionalidad, siempre con Pull Request hacia `main`:

| Rama | Quién | Contenido |
|---|---|---|
| `feature/tema-y-modelo` | A | `app_theme.dart`, `entrada_blog.dart` |
| `feature/capa-datos` | B | datasource, repositorio, JSON |
| `feature/widgets-base` | A | widgets de `presentation/widgets` |
| `feature/home-detalle` | B | `home_screen`, `detalle_screen` |
| `feature/buscar-favoritos` | A | `buscar_screen`, `favoritos_screen` |
| `feature/perfil-y-menu` | B | `perfil_screen`, `menu_lateral` |

Cinco conflictos que se pueden provocar a propósito (cada quien edita la **misma línea** en su rama):

1. `AppColors.primario` en `app_theme.dart`
2. El `title:` de `MaterialApp` en `main.dart`
3. El texto de `SplashScreen` ("Un blog de lectura")
4. El `height:` del carrusel en `home_screen.dart`
5. Un campo de `entradas.json` (por ejemplo la `calificacion` de la entrada 1)

Documenten cada uno con captura del conflicto y del commit de resolución.
