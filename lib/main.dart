import 'package:diseno_images/image_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.home,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 52, 66, 52),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Parte superior de la interfaz con las imágenes
              _TopImagesSection(),

              // Texto descriptivo y botones de inicio de sesión
              _DescriptionSection(),

              // Indicadores de página
            ],
          ),
        ),
      ),
    );
  }
}

class _TopImagesSection extends StatelessWidget {
  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1681888899354-ed09f939bfd4?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://cdn.betterwalls.com/pim/pr/WP/30010351/photo-wallpaper-tokyo-night-view_big01.jpg',
    'https://m.media-amazon.com/images/I/81HNmpCT+iL.jpg',
    'https://c0.wallpaperflare.com/preview/900/707/759/shinjuku-japan-night-tokyo.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width +
              (MediaQuery.of(context).size.width * 0.28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            //color: Colors.red,
          ),
        ),
        Positioned(
          left: 0.0,
          top: 0.0,
          child: ClipPath(
            clipper: TriangleClipper3(),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageScreen(imageUrls: imageUrls),
                    ));
              },
              child: Hero(
                tag: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1681888899354-ed09f939bfd4?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          //top: 30.0,
          bottom: 20,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.width * 0.8 - 30,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage('images/paisaje.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 50.0,
          child: ClipPath(
            clipper: TriangleClipper2(),
            child: Container(
              width: MediaQuery.of(context).size.width - 55,
              height: MediaQuery.of(context).size.width * 0.8 - 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage('images/flor.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPLORA CIUDADES',
          style: TextStyle(
            fontSize: 12.0,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Explora Cientos de Locaciones',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          '¡Explora el mundo con nosotros! Descubre destinos únicos, encuentra las mejores actividades locales y sumérgete en la cultura de cada lugar. Ya sea que busques aventura, relajación o inspiración, nuestra app te guiará para hacer de cada viaje una experiencia inolvidable.',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(2, 0); // Vértice superior

    path.lineTo(size.width, size.height); // Vértice inferior derecho

    path.lineTo(0, size.height); // Vértice inferior izquierdo

    path.close(); // Cierra el camino
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TriangleClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Define los vértices del triángulo en la parte derecha
    path.moveTo(size.width, 0); // Vértice superior derecho
    path.lineTo(size.width, size.height); // Vértice inferior derecho
    path.lineTo(size.width / 2, size.height / 2); // Vértice central

    // Cierra el triángulo
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TriangleClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Define los vértices del triángulo en la parte derecha
    //path.moveTo(0, size.height / 2); // Vértice superior derecho
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width / 2, size.height); // Vértice inferior derecho
    path.lineTo(size.width, size.height / 2); // Vértice central
    path.lineTo(size.width, 0);
    // Cierra el triángulo
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
