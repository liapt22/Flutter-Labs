import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TemperatureConverter(),
    debugShowCheckedModeBanner: false,
  ));
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();

  double? result;

  String sourceUnit = 'Celsius';
  String targetUnit = 'Fahrenheit';
  final List<String> units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  double convert(double value, String from, String to) {
    double celsius;

    // mai întâi convertim la Celsius
    switch (from) {
      case 'Fahrenheit':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = value - 273.15;
        break;
      default:
        celsius = value;
    }

    // apoi convertim la unitatea țintă
    switch (to) {
      case 'Fahrenheit':
        return celsius * 9 / 5 + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        return celsius;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversie Temperaturi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink[400],
      ),
      body: Container(
        color: Colors.pink[200], // fundal roz mai închis
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white), // textul introdus alb
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Introdu valoarea',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // unitatea sursă
              Text(
                'Unitate sursă:',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: units.map((unit) {
                  return Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.white,
                        value: unit,
                        groupValue: sourceUnit,
                        onChanged: (val) {
                          setState(() {
                            sourceUnit = val!;
                          });
                        },
                      ),
                      Text(unit, style: TextStyle(color: Colors.white)),
                    ],
                  );
                }).toList(),
              ),

              SizedBox(height: 10),

              // unitatea destinație
              Text(
                'Unitate destinație:',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: units.map((unit) {
                  return Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.white,
                        value: unit,
                        groupValue: targetUnit,
                        onChanged: (val) {
                          setState(() {
                            targetUnit = val!;
                          });
                        },
                      ),
                      Text(unit, style: TextStyle(color: Colors.white)),
                    ],
                  );
                }).toList(),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  double? value = double.tryParse(_controller.text);
                  if (value != null) {
                    setState(() {
                      result = convert(value, sourceUnit, targetUnit);
                    });
                  }
                },
                child: Text(
                  'Convertește',
                  style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 20),

              if (result != null)
                Text(
                  'Rezultat: ${result!.toStringAsFixed(2)} $targetUnit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

              SizedBox(height: 40),

              // imagine cu soare
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/869/869869.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
