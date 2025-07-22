class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Info")),
      body: const Center(
        child: Text(
          "Weight & Height form goes here",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
