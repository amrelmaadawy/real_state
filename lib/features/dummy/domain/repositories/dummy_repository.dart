import 'package:real_state/core/network/api_client.dart';
import '../../data/models/dummy_post.dart';

class DummyRepository {
  final ApiClient apiClient;

  DummyRepository(this.apiClient);

  Future<List<DummyPost>> getPosts() async {
    final response = await apiClient.get('https://jsonplaceholder.typicode.com/posts');
    
    if (response.data is List) {
      return (response.data as List)
          .map((json) => DummyPost.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    
    throw Exception('Failed to load posts');
  }
}
