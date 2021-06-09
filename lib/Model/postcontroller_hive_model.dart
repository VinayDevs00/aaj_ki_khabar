import 'package:aaj_ki_khabar/Model/posts_model.dart';
import 'package:hive/hive.dart';
part 'postcontroller_hive_model.g.dart';

@HiveType(typeId: 0)
class PostControllerHiveModel{
  @HiveField(0)
  final List<PostsModel> postsHive;

  PostControllerHiveModel(this.postsHive);
}