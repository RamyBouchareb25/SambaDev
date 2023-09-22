import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sambadev/Pages/conversation.dart';
import 'package:sambadev/widgets/widgets.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> getRooms() {
    return _firestore.collection('Rooms').snapshots();
  }

  Widget renderMessages() {
    return StreamBuilder(
      stream: getRooms(),
      builder: (context, snapshot) {
        return Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: 10,
                      (context, index) {
                return ListTile(
                  leading: Image.asset("Assets/avatar.png"),
                  title: const Text('Mr Rami'),
                  subtitle: const Text('this is a message'),
                  trailing: const Text(
                    "10min ago",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  onTap: () {
                    Navigator.of(context).push(CustomPageRoute(
                        child: const Conversation(), axis: AxisDirection.left));
                  },
                );
              })),
              const SliverFillRemaining()
            ],
          ),
        );
      },
    );
  }

  Widget horizontalMessages() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset("Assets/avatar.png"),
                        const Text("Mr Rami")
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: Column(
        children: [
          
          horizontalMessages(),
          renderMessages(),
        ],
      ),
    );
  }
}
