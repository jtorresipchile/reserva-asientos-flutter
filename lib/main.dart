import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MODELO DE DATOS
class Asiento {
  final int numero;
  bool estaOcupado;
  bool estaSeleccionado;

  Asiento({
    required this.numero,
    this.estaOcupado = false,
    this.estaSeleccionado = false,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva BHDP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
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
  // GENERACIÓN DE LOS 44 ASIENTOS
  final List<Asiento> misAsientos = List.generate(
    44,
    (index) => Asiento(numero: index + 1),
  );

  // AQUÍ VA EL BLOQUE QUE ME PREGUNTASTE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distribución Bus BHDP"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // 2 izq + 1 pasillo + 2 der
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 55, // 11 filas x 5 columnas
        itemBuilder: (context, index) {
          // Lógica del Pasillo (Columna central)
          if (index % 5 == 2) {
            return const SizedBox();
          }

          // Cálculo del índice real del asiento
          int asientoIndex = index - (index ~/ 5);

          if (asientoIndex >= 44) return const SizedBox();

          final asiento = misAsientos[asientoIndex];

          return GestureDetector(
            onTap: () {
              // setState le avisa a Flutter que debe repintar el color
              setState(() {
                asiento.estaSeleccionado = !asiento.estaSeleccionado;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: asiento.estaSeleccionado
                    ? Colors.green
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
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
