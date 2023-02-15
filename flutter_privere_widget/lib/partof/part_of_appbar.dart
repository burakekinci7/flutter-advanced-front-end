part of './part_of_learn.dart'; //bu sayfa extract widget olna sayfa
//bu widgeti hangi sayfada kullancaksak burada o syafyı "part of yapıyoruz"

class _AppBarPart extends StatelessWidget with PreferredSizeWidget {
  const _AppBarPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Part Of Kullnanımını"),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
