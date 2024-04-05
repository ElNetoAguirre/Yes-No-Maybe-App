import "dart:io";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_maybe_app/config/theme/app_them.dart";
import "package:yes_no_maybe_app/presentation/providers/chat_provider.dart";
import "package:yes_no_maybe_app/presentation/screens/chat/chat_screen.dart";

// void main() => runApp(const MyApp());

void main() { 
  HttpOverrides.global = MyHttpOverrides(); // Se agrega para evitar el error de certificados
  runApp(const MyApp());
}

// Se agrega para evitar el error de certificados
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: "Yes No Maybe App",
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen()
      ),
    );
  }
}