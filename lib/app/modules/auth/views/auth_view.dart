import 'package:getx_boilerplate/app/core/export.dart';

class AuthView extends GetView {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
