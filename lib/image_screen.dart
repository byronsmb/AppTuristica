import 'dart:ui';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _previousImage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _nextImage() {
    if (_currentIndex < widget.imageUrls.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Hero(
                tag: 1,
                child: ClipPath(
                  clipper: CurvedClipper(),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: widget.imageUrls.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.imageUrls[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 60,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _previousImage,
                    child: Icon(Icons.arrow_left_sharp),
                  ),
                  ElevatedButton(
                    onPressed: _nextImage,
                    child: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.85,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button functionality here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.redAccent), // Change button color
                  ),
                  child: Text(
                    'IR',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(118, 255, 255, 255).withAlpha(40)),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 97, 95, 95).withAlpha(100),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  color: const Color.fromARGB(255, 87, 86, 86).withOpacity(0.4),
                ),
                child: Text(
                  'Tokio es una de las ciudades más bonitas del mundo, cuenta con 40 millones de habitantes repartidos en más de 23 barrios.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.75);
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height * 0.75);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CurvedClipper oldClipper) => false;
}
