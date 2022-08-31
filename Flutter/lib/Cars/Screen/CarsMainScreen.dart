import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carapp/Cars/Bloc/bloc.dart';
import 'package:carapp/Cars/Screen/CarsCreateUpdateScreen.dart';
import 'package:carapp/Cars/Screen/screens.dart';
import 'dart:math';

class CarsMainScreen extends StatelessWidget {
  static const routeName = '/cars_screen';

  Widget buildSectionTile(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        '${text}',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(6);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Name'),
        actions: [
          PopupMenuButton(
            icon:const Icon(Icons.refresh),
            itemBuilder: (_) =>[
              PopupMenuItem(
                child: const Text('Refresh'),
                value: () {},
              ),
              const PopupMenuItem(
                value: null,
                child: Text('Show All'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSectionTile(context, 'Cars'),
            BlocBuilder<CarsBloc,CarsState>(builder: (_,state){
              if(state is CarsOperationFailure){
                return const Text('Could not do cars operation');
              }
              if(state is CarsLoadSuccess){
                final cars=state.cars;
                return buildContainer(
                  context,
                  ListView.builder(
                    itemCount: cars.length,
                    itemBuilder: ((context, index) => Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          color:Colors.white30,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        height: MediaQuery.of(context).size.height*0.5,
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(4),
                        child:  Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(cars[index].carImage),
                              ),
                              title: Text(
                                cars[index].carName,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(
                                cars[index].carModel,
                              ),
                              trailing: MediaQuery.of(context).size.width>450?
                                TextButton.icon(
                                  label: const Text('Delete'),
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: Theme.of(context).errorColor,
                                  ),
                                  onPressed: (){

                                  },
                              ):
                              IconButton(
                                icon: const Icon(Icons.star_border_outlined),
                                color: Theme.of(context).errorColor,
                                onPressed: (){

                                },
                                ),
                            ),
                          ),
                        ),
                      )
                    ],
                    )
                  )
                );
              }
              //return null;
            },)
          ],
        ),
      ),
    );
  }
}
