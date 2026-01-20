import 'package:bloc_state/Bloc/Counter/counter_bloc.dart';
import 'package:bloc_state/Bloc/Counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Bloc/Counter/counter_event .dart';

class CounterUi extends StatelessWidget {
  const CounterUi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C3A),
        title: const Text(
          "Tasbeeh Counter",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "سُبْحَانَ ٱللَّٰهِ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F4C3A),
                  ),
                ),

                const SizedBox(height: 20),

                // 
                Container(
                  width: size.width * 0.6,
                  height: size.width * 0.6,
                  constraints: const BoxConstraints(maxWidth: 260, maxHeight: 260),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0F4C3A), Color(0xFF2F7E65)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      state.counter.toString(),
                      style: TextStyle(
                        fontSize: isSmallScreen ? 48 : 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _TasbeehButton(
                      icon: Icons.remove,
                      color: const Color(0xFFB71C1C),
                      onTap: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                    ),
                    const SizedBox(width: 20),
                    _TasbeehButton(
                      icon: Icons.refresh,
                      color: const Color(0xFF8D6E63),
                      onTap: () {
                        context.read<CounterBloc>().add(Reset());
                      },
                    ),
                    const SizedBox(width: 20),
                    _TasbeehButton(
                      icon: Icons.add,
                      color: const Color(0xFF1B5E20),
                      onTap: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // 
                const Text(
                  "ذِكْرُ ٱللَّٰهِ طُمَأْنِينَةُ ٱلْقُلُوبِ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4E6E63),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class _TasbeehButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _TasbeehButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.16,
      height: size.width * 0.16,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const CircleBorder(),
          elevation: 6,
          alignment: Alignment.center,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }
}
