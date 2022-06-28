import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {


      return Scaffold(
          
              appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 189, 224, 56),
                  centerTitle: true,
                  title: const Text(
                    'Perfil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 45,
                    ),
                  )),
              backgroundColor: Color.fromARGB(255, 223, 223, 223),
              body: Container(
                padding: const EdgeInsets.all(25),
                child: Center(
                  child: SingleChildScrollView(
                      
                      
                            child: Column(
                              children: <Widget>[
                                
                                SizedBox(height: 20.0),
                                SizedBox(
                                  width: 350,
                                  height: 45,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: 'Nome',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.0),
                                SizedBox(
                                  width: 350,
                                  height: 45,
                                  child: TextFormField(
                                    
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: 'RA',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.0),
                                SizedBox(
                                  width: 350,
                                  height: 45,
                                  child: TextFormField(
                                    
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: 'Email - Domínio UNICAMP',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                SizedBox(
                                  width: 350,
                                  height: 45,
                                  child: TextFormField(
                                    
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: 'Celular',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                SizedBox(
                                  width: 350,
                                  height: 45,
                                  child: TextFormField(
                                    
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: 'Usuário',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                
                                const SizedBox(height: 26.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 189, 224, 56),
                                    shadowColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    minimumSize: const Size(200, 50),
                                    maximumSize: const Size(200, 50),
                                  ), onPressed: () {  }, 
                                  child: const Text(
                                  'Atualizar Perfil',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                )
                              ],
                            )))));
                      }
                    
                  
                
              
    }
  

