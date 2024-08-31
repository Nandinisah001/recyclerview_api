import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_service.dart';
import 'Fovarite_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blueGrey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        title: const Text('Users',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddFavoriteScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
            child: ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];
                final isFavorite = provider.isFavorite(user);
                return Padding(padding: const EdgeInsets.only(top: 18),
                child: Container(
                  height: 80,
                  child: Card(
                      margin: const EdgeInsets.only(),
                      elevation: 8,
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text(user.email),
                        trailing: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            provider.toggleFavorite(user);
                          },
                        ),
                      )
                  ),
                )
                );
              },
            ),
            );
          }
        },
      ),
    );
  }
}
