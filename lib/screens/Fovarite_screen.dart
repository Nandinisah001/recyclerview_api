import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_service.dart';

class AddFavoriteScreen extends StatelessWidget {
  const AddFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Favorite Users',style: TextStyle(color: Colors.white),),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          final favoriteUsers = provider.favoriteUsers;

          if (favoriteUsers.isEmpty) {
            return const Center(child: Text('No favorite users.'));
          } else {
            return Padding(padding: const EdgeInsets.all(8.0),
             child:  ListView.builder(
              itemCount: favoriteUsers.length,
              itemBuilder: (context, index) {
                final user = favoriteUsers[index];
                return Padding(padding: const EdgeInsets.only(top: 17),
                child: Container(
                  height: 100,
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 33,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          provider.toggleFavorite(user);
                        },
                      ),
                    ),
                  ),
                )
                );
              },
             )
            );
          }
        },
      ),
    );
  }
}
