import 'package:fansvideo/graphql/graphql_api.dart';
import 'package:fansvideo/services/shared_preferences_service.dart';
import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: sharedPreferenceService.token,
      builder: (context, snapshot) {
        Widget children = Text('数据服务器出错！');
        if (snapshot.hasError) {
          children = Text('hasError => ' + snapshot.error);
        }
        if (snapshot.hasData) {
          children = DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text('Todo App'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () async {
                      sharedPreferenceService.clearToken();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  )
                ],
              ),
//                  bottomNavigationBar: TabBar(
//                    tabs: [
//                      Tab(
//                        text: 'Todos',
//                        icon: Icon(Icons.edit),
//                      ),
//                      Tab(
//                        text: 'Feeds',
//                        icon: Icon(Icons.message),
//                      ),
//                      Tab(
//                        text: 'Online',
//                        icon: Icon(Icons.people),
//                      ),
//                    ],
//                    labelColor: Colors.black,
//                    unselectedLabelColor: Colors.grey,
//                    indicatorSize: TabBarIndicatorSize.label,
//                    indicatorPadding: EdgeInsets.all(5),
//                    indicatorColor: Colors.blue,
//                  ),
              body: Stack(
                children: [
                  FansBlurHashImage(hash: "LGF5]+Yk^6#M@-5c,1J5@[or[Q6.",),
                  Query(
                      options: QueryOptions(
                        documentNode: VideosDataQuery().document,
                      ),
                      builder: (
                          QueryResult result, {
                            Future<QueryResult> Function() refetch,
                            FetchMore fetchMore,
                          }) {
                        if (result.hasException) {
                          return Text(result.exception.toString());
                        }
                        if (result.loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final allVideos =
                            VideosData$query_root.fromJson(result.data).videos;
                        return ListView.builder(
                          itemCount: allVideos.length,
                          itemBuilder: (_, index) => ListTile(
                            key: Key(allVideos[index].uuid),
                            leading: Icon(Icons.video_library, color: Colors.white,),
                            title: Text(allVideos[index].title, style: TextStyle(color: Colors.white),),
                            subtitle: Text(allVideos[index].user.name, style: TextStyle(color: Colors.white),),
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        }
        return children;
      },
    );
  }
}
