import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

Future<String> fetchSvg(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load SVG');
    }
  } catch (e) {
    throw Exception('Failed to load SVG');
  }
}

class SvgImageWidget extends StatelessWidget {
  final String imageUrl;

  SvgImageWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchSvg(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while fetching
        } else if (snapshot.hasError) {
          return Icon(Icons.error); // Show error icon if loading fails
        } else {
          return SvgPicture.string(
            snapshot.data!,
            width: 40,
            height: 40,
          ); // Display the fetched SVG
        }
      },
    );
  }
}
