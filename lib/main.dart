import 'package:bmi/bmiCubit.dart';
import 'package:bmi/bmiStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocConsumer<BmiCubit, BmiStates>(
            builder: (context, State) {
              return Scaffold(
                backgroundColor: const Color(0xff0a0c21),
                appBar: AppBar(
                  title: const Text(
                    "BMI Calculator App",
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  backgroundColor: const Color(0xff0a0c21),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                height: 280,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1d1e33),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "weight",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.blueGrey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${BlocProvider.of<BmiCubit>(context).w} kg",
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FloatingActionButton(
                                            onPressed: () {
                                              BlocProvider.of<BmiCubit>(context)
                                                  .remove("weight");
                                            },
                                            mini: true,
                                            backgroundColor: Colors.blueGrey,
                                            child: const Icon(Icons.remove)),
                                        FloatingActionButton(
                                            onPressed: () {
                                              BlocProvider.of<BmiCubit>(context)
                                                  .add("weight");
                                            },
                                            mini: true,
                                            backgroundColor: Colors.blueGrey,
                                            child: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                height: 280,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff1d1e33)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "height",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.blueGrey),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${BlocProvider.of<BmiCubit>(context).h} cm",
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              BlocProvider.of<BmiCubit>(context)
                                                  .remove("height");
                                            },
                                            mini: true,
                                            backgroundColor: Colors.blueGrey,
                                            child: const Icon(Icons.remove),
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {
                                              BlocProvider.of<BmiCubit>(context)
                                                  .add("height");
                                            },
                                            mini: true,
                                            backgroundColor: Colors.blueGrey,
                                            child: const Icon(Icons.add),
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<BmiCubit>(context).calc();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffeb1555),
                              ),
                              child: const Text(
                                "calculate",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Result: ${BlocProvider.of<BmiCubit>(context).r}",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            " ${BlocProvider.of<BmiCubit>(context).status}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.green),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            listener: (context, State) {},
          )),
    );
  }
}
