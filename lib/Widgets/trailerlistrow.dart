import 'package:flutter/material.dart';

class Trailerlistrow extends StatelessWidget {
  const Trailerlistrow({
    super.key,
    required this.trailers,
    required this.context,
  });

  final List<Map<String, String>> trailers;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: trailers.map((trailer) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(trailer['title']!,
                style: const TextStyle(
                  color: Colors.purple,
                ),),
                content: 
                Text(trailer['description']!),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          ),
          child: Text(
            trailer['title']!,
            style: const TextStyle(
              color: Colors.purple,
              fontSize: 12,
              decoration: TextDecoration.underline,
              
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      );
    }).toList(),
        );
  }
}

