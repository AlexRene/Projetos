import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasa_apod_app/data/http/http_client.dart';
import 'package:nasa_apod_app/data/repositories/pictures_repository.dart';
import 'package:nasa_apod_app/pages/stores/nasa_store.dart';
import 'package:nasa_apod_app/widgets/drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NasaStore store = NasaStore(
    repository: NasaImagesRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getNasaImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/nasa_icon_svg.svg'),
              const Text(
                'Astronomy Picture of the Day',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                store.isLoading,
                store.erro,
                store.state,
              ]),
              builder: (context, child) {
                if (store.isLoading.value == true) {
                  return const Center(child: Text('chegou nessa bagaca'));
                }

                if (store.erro.value.isEmpty) {
                  return Center(
                    child: Text(
                      store.erro.value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (store.erro.value.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nehnum item na lista',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, index) {
                        final item = store.state.value[index];
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: item.url.isEmpty
                                  ? const Center(
                                      child: Text('Sem imagens disponiveis'),
                                    )
                                  : Image.network(
                                      item.url,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Center(
                                        child: Icon(Icons.error),
                                      ),
                                    ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 32),
                      padding: const EdgeInsets.all(16),
                      itemCount: store.state.value.length);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
