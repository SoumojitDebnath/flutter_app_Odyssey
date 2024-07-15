import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});


  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}


class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  final List<Map<String, dynamic>> profiles = [
    {'name': 'Emenalo', 'color': Colors.blue},
    {'name': 'Onyeka', 'color': Colors.yellow},
    {'name': 'Thelma', 'color': Colors.red},
    {'name': 'Kids', 'color': Colors.green},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Center(
          child: Text(
            'ODYSSEY',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w700,
              fontSize: 33,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              if (kDebugMode) {
                print('Notifications');
              }
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250, // Adjust the width to fit the grid
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: profiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: profiles[index]['color'],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.face,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        profiles[index]['name'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add profile functionality here
              },
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Add Profile',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}