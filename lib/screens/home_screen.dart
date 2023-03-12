import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if(productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

            authService.logout(); 
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);         

          }, 
          icon: const Icon(Icons.login_outlined)
        ),
        centerTitle: true,
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => {
            productsService.selectedProduct = productsService.products[index],
            Navigator.pushNamed(context, ProductScreen.routeName)
          },
          child: ProductCard(product: productsService.products[index],)
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          productsService.selectedProduct = Product(
            avaliable: false, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, ProductScreen.routeName);
        }
      ),
    );
  }
}