import 'package:material_ui/material_ui.dart';
import 'package:mockup/mockup.dart';

/// Demonstrates infinite scrolling against a simulated backend:
/// paginated loading with latency, random failures and retry.
class ApiSimulationScreen extends StatefulWidget {
  const ApiSimulationScreen({super.key});

  @override
  State<ApiSimulationScreen> createState() => _ApiSimulationScreenState();
}

class _ApiSimulationScreenState extends State<ApiSimulationScreen> {
  static const _pageSize = 10;
  static const _totalUsers = 60;
  static const _failureRate = 0.2;

  final _users = <UserModel>[];
  final _scrollController = ScrollController();
  int? _nextPage = 1;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final position = _scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 200) _loadNextPage();
    });
    // The first build hasn't happened yet, so no setState is needed.
    _loading = true;
    _fetch(1);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadNextPage() async {
    final page = _nextPage;
    if (_loading || page == null) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    await _fetch(page);
  }

  Future<void> _fetch(int page) async {
    try {
      final result = await Mockup.user.fetchPage(
        page,
        pageSize: _pageSize,
        totalItems: _totalUsers,
        failureRate: _failureRate,
      );
      if (!mounted) return;
      setState(() {
        _users.addAll(result.items);
        _nextPage = result.nextPage;
      });
    } on MockupException catch (e) {
      if (!mounted) return;
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _users.clear();
      _nextPage = 1;
    });
    await _loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Simulation')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _users.length + 1,
          itemBuilder: (context, index) {
            if (index < _users.length) {
              final user = _users[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.occupation ?? ''),
              );
            }
            return _buildFooter();
          },
        ),
      ),
    );
  }

  Widget _buildFooter() {
    final Widget child;
    if (_error != null) {
      child = Column(
        children: [
          Text(_error!, style: const TextStyle(color: Colors.red)),
          TextButton(onPressed: _loadNextPage, child: const Text('Retry')),
        ],
      );
    } else if (_loading) {
      child = const CircularProgressIndicator();
    } else if (_nextPage == null) {
      child = Text('All ${_users.length} users loaded');
    } else {
      child = const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(child: child),
    );
  }
}
