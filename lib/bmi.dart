import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMaleSelected = true; // true = Male, false = Female
  double height = 170;
  int weight = 70;
  int age = 25;

  double bmiResult = 0;

  void calculateBMI() {
    setState(() {
      bmiResult = weight / ((height / 100) * (height / 100));
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF333244),
        title: const Text('BMI Result', style: TextStyle(color: Colors.white)),
        content: Text(
          'Your BMI is: ${bmiResult.toStringAsFixed(1)}',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2135),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color(0xFF333244),
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// ===== Row 1 : Male / Female =====
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isMaleSelected = true),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: isMaleSelected
                              ? const Color(0xFF333244)
                              : const Color(0xFF1C2135),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: 
                          Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      Icons.male,
      size: 50,
      color: Colors.white,
    ),
    SizedBox(height: 8),
    Text(
      'MALE',
      style: TextStyle(color:Color(0xFF8B8C9E),
),
    ),
  ],
),

                                 
                                  

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isMaleSelected = false),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: !isMaleSelected
                              ? const Color(0xFF333244)
                              : const Color(0xFF1C2135),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      Icons.female,
      size: 50,
      color: Colors.white,
    ),
    SizedBox(height: 8),
    Text(
      'FEMALE',
      style: TextStyle(color: Color(0xFF8B8C9E),
),
    ),
  ],
)

                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// ===== Height Container =====
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF333244),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(color: Color(0xFF8B8C9E),
 fontSize: 18),
                    ),
                    RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '${height.toInt()} ', // الرقم الكبير
        style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: 'cm', // كلمة cm صغيرة
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16, // الحجم الصغير
            fontWeight: FontWeight.normal),
      ),
    ],
  ),
),

                    Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      activeColor: Colors.red,
                      inactiveColor: Colors.white24,
                      onChanged: (val) => setState(() => height = val),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// ===== Row 2 : Weight / Age =====
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFF333244),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(color: Color(0xFF8B8C9E)
, fontSize: 18),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    setState(() => weight = weight > 1 ? weight - 1 : 1),
                                icon: const Icon(Icons.remove, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () => setState(() => weight++),
                                icon: const Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFF333244),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(color:Color(0xFF8B8C9E)
, fontSize: 18),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    setState(() => age = age > 1 ? age - 1 : 1),
                                icon: const Icon(Icons.remove, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () => setState(() => age++),
                                icon: const Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              /// ===== Calculate Button =====
              GestureDetector(
                onTap: calculateBMI,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF333244),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
