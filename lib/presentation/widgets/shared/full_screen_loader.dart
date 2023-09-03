import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  Stream<String> getLoadingMessages() {
    const messages = <String>[
      'Load movies',
      'Buying popcorn',
      'Load populates',
      'Call my girlfriend',
      'it\'s almost ready',
      'This is taking a long time :('
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please wait'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if( !snapshot.hasData ) return const Text('Loading....');
              return Text( snapshot.data! );
            },
          )
        ],
      ),
    );
  }
}
