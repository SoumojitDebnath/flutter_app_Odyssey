import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({super.key});


  @override
  State<MenuPage> createState() => _MenuPageState();
}


class _MenuPageState extends State<MenuPage> {
  String selectedProfile = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profiles & more',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              if (kDebugMode) {
                print('Notifications');
              }
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileIcon('Emenalo', Colors.blue,
                          'https://i.pinimg.com/originals/1b/71/b8/1b71b85dd741ad27bffa5c834a7ed797.png'),
                      _buildProfileIcon('Onyeka', Colors.yellow,
                          'https://i.pinimg.com/originals/bd/ee/4c/bdee4c328550aaf21aa9f43fd19e2136.png'),
                      _buildProfileIcon('Thelma', Colors.red,
                          'https://i.pinimg.com/originals/30/db/47/30db479e1558c3ed46b4ed23b3cd98ae.png'),
                      _buildProfileIcon('Kids', Colors.black,
                          'https://tinypic.host/images/2024/07/07/WhatsApp-Image-2024-07-07-at-21.08.02_43aa6d5c.jpg'),
                      _buildProfileIcon('Add', Colors.black,
                          'https://assets.website-files.com/60d88f11017713440c0f1a9d/60d8c137d33b3921bbf9ae29_add-icon.png'),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  _buildManageProfilesButton(context),
                ],
              ),
            ),
            _buildShareSection(),
            _buildMenuItems(),
          ],
        ),
      ),
    );
  }


  Widget _buildProfileIcon(String name, Color color, String imageURL) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 64,
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
                color: color,
                border: Border.all(
                  color: selectedProfile == name
                      ? Colors.white
                      : Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            onTap: () {
              setState(() {
                selectedProfile = name;
              });
              if (kDebugMode) {
                print(name);
              }
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }


  Widget _buildManageProfilesButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, '/profile');
      },
      icon: const Icon(Icons.manage_accounts, color: Colors.white), //edit
      label: const Text(
        'Manage Profiles',
        style: TextStyle(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
      ),
    );
  }


  Widget _buildShareSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildShareIcon('Message', Colors.black,
                  'https://tinypic.host/images/2024/07/07/WhatsApp-Image-2024-07-08-at-01.55.20_51870247.jpg'),
              const SizedBox(width: 10.0),
              const Text(
                'Tell friends about ODYSSEY.',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis.',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              _buildShareButton(Icons.share, 'Copy Link'),
              const Spacer(),
              _buildShareIcon('WhatsApp', Colors.black,
                  'https://logos-marcas.com/wp-content/uploads/2020/05/WhatsApp-Logotipo.png'),
              const SizedBox(width: 16.0),
              _buildShareIcon('Facebook', Colors.black,
                  'https://clipartcraft.com/images/facebook-logo-blue.png'),
              const SizedBox(width: 16.0),
              _buildShareIcon('Gmail', Colors.black,
                  'https://vectorseek.com/wp-content/uploads/2021/02/Gmail-Logo-Vector-730x730.jpg'),
              const SizedBox(width: 16.0),
              _buildShareIcon('More', Colors.black,
                  'https://ak.picdn.net/shutterstock/videos/1033162241/thumb/1.jpg'),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildShareButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {
        if (kDebugMode) {
          print('Copy Link');
        }
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
      ),
    );
  }


  Widget _buildShareIcon(String name, Color color, String imageURL) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
                color: color,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            onTap: () {
              if (kDebugMode) {
                print(name);
              }
            },
          ),
        ),
      ],
    );
  }


  Widget _buildMenuItems() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          _buildMenuItemCard(
            icon: Icons.settings,
            title: 'App Settings',
            onTap: () {
              if (kDebugMode) {
                print('App Settings');
              }
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          _buildMenuItemCard(
            icon: Icons.account_circle,
            title: 'Account',
            onTap: () {
              if (kDebugMode) {
                print('Account');
              }
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          _buildMenuItemCard(
            icon: Icons.help,
            title: 'Help',
            onTap: () {
              if (kDebugMode) {
                print('Help');
              }
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          _buildMenuItemCard(
            icon: Icons.logout,
            title: 'Sign Out',
            onTap: () {
              if (kDebugMode) {
                print('Sign Out');
              }
            },
          ),
        ],
      ),
    );
  }


  Widget _buildMenuItemCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return Card(
      color: Colors.white12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        onTap: onTap,
        trailing: trailing,
      ),
    );
  }
}