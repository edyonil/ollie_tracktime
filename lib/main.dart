import 'package:flutter/material.dart';
import 'package:ollie_tracktime/application/app.dart';
import 'package:ollie_tracktime/application/dependency_resolve.dart';

void main() {
  DependencyResolve();

  return runApp(App());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ActionListenerDemo(),
//     );
//   }
// }

// class ActionListenerDemo extends StatefulWidget {
//   const ActionListenerDemo({Key? key}) : super(key: key);

//   @override
//   State<ActionListenerDemo> createState() => _ActionListenerDemoState();
// }

// class _ActionListenerDemoState extends State<ActionListenerDemo> {
//   bool _on = false;
//   late final MyAction _myAction;

//   @override
//   void initState() {
//     super.initState();
//     _myAction = MyAction();
//   }

//   void _toggleState() {
//     setState(() {
//       _on = !_on;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.cyan,
//           title: Text("Flutter ActionListener Demo")),
//       body: Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: 100,
//                 height: 38,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     primary: Colors.cyan,
//                   ),
//                   onPressed: _toggleState,
//                   child: Text(_on ? 'Disable' : 'Enable'),
//                 ),
//               ),
//             ),
//             if (_on)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ActionListener(
//                   listener: (Action<Intent> action) {
//                     if (action.intentType == MyIntent) {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         backgroundColor: Colors.blueGrey,
//                         content: Text('Action Listener Call'),
//                       ));
//                     }
//                   },
//                   action: _myAction,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.cyan),
//                     ),
//                     onPressed: () => const ActionDispatcher()
//                         .invokeAction(_myAction, const MyIntent()),
//                     child: const Text('Call Action Listener'),
//                   ),
//                 ),
//               ),
//             if (!_on) Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyAction extends Action<MyIntent> {
//   @override
//   void addActionListener(ActionListenerCallback listener) {
//     super.addActionListener(listener);
//     print('Action Listener was add');
//   }

//   @override
//   void removeActionListener(ActionListenerCallback listener) {
//     super.removeActionListener(listener);
//     print('Action Listener was remove');
//   }

//   @override
//   void invoke(covariant MyIntent intent) {
//     notifyActionListeners();
//   }
// }

// class MyIntent extends Intent {
//   const MyIntent();
// }
