import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Asiento {
  final int numero;
  bool estaSeleccionado;
  Asiento({required this.numero, this.estaSeleccionado = false});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PantallaBus(),
    );
  }
}

class PantallaBus extends StatefulWidget {
  const PantallaBus({super.key});
  @override
  State<PantallaBus> createState() => _PantallaBusState();
}

class _PantallaBusState extends State<PantallaBus> {
  // Creamos la lista de 44 asientos exactos
  final List<Asiento> misAsientos = List.generate(
    44,
    (i) => Asiento(numero: i + 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus BHDP - 44 Asientos Reales"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // 2 + pasillo + 2
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 55, // 11 filas x 5 columnas
        itemBuilder: (context, index) {
          // 1. Detectar el pasillo (Columna central)
          if (index % 5 == 2) return const SizedBox();

          // 2. NUEVA LÓGICA DE CONTEO:
          // Calculamos cuántos huecos de pasillo han pasado exactamente
          int filaActual = index ~/ 5;
          int posicionEnFila = index % 5;

          // Si estamos en las columnas 0 o 1, restamos los pasillos de las filas anteriores
          // Si estamos en las columnas 3 o 4, restamos los pasillos de las filas anteriores Y el de la fila actual
          int restaPasillo = (posicionEnFila > 2)
              ? (filaActual + 1)
              : filaActual;

          int realIdx = index - restaPasillo;

          // Evitar que el conteo se pase de 44
          if (realIdx < 0 || realIdx >= 44) return const SizedBox();

          final asiento = misAsientos[realIdx];

          return GestureDetector(
            onTap: () => setState(
              () => asiento.estaSeleccionado = !asiento.estaSeleccionado,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: asiento.estaSeleccionado
                    ? Colors.green
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black26),
              ),
              child: Center(
                child: Text(
                  "${asiento.numero}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
