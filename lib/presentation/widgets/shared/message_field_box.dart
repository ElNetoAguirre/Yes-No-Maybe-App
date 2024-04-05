import "package:flutter/material.dart";

class MessageFieldBox extends StatelessWidget {
  // esto permite notificar cuando se haya realizado algun cambio en  value
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // esto permite guardar el valor del input
    final textController = TextEditingController();
    // esto permite mantener el focus despues de accionar una accion en el input text
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      //esto permite agregarle un placeholder
      hintText: 'End your message with a "?"',
      // esta clase sirve para modificar border el textform
      enabledBorder: outlineInputBorder,
      // esto permite agregarle un border al focus
      focusedBorder: outlineInputBorder,
      // esto para que sea el contendido background del text field
      filled: true,
      suffixIcon: IconButton(
        // esto permite agregarle un icono al input text
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          // retorna el valor del caja de texto
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      // permite disparar un evento cuando estas fuera de caja de texto
      onTapOutside: (event) {
        // esto permite salir del focus
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // esto limpia la caja de texto
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
