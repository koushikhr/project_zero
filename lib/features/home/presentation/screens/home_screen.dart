// import 'package:flutter/material.dart';
// import 'package:project_zero/core/constants/app_colors.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<Map<String, dynamic>> _posts = [];
//   final ScrollController _scrollController = ScrollController();
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadMockData();
//     _setupScrollListener();
//   }

//   void _loadMockData() {
//     final mockPosts = List.generate(10, (index) => {
//       'id': index,
//       'username': 'User ${index + 1}',
//       'profileImage': 'https://picsum.photos/200?random=$index',
//       'postImage': 'https://picsum.photos/400/600?random=$index',
//       'likes': (index + 1) * 100,
//       'comments': (index + 1) * 10,
//       'caption': 'Sample post caption ${index + 1}',
//     });
//     setState(() => _posts.addAll(mockPosts));
//   }

//   void _setupScrollListener() {
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _loadMockData();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Project-0',
//           style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.send),
//             onPressed: () {},
//             color: AppColors.textPrimary,
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async => _loadMockData(),
//         child: CustomScrollView(
//           controller: _scrollController,
//           slivers: [
//             SliverToBoxAdapter(child: _buildStories()),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) => _PostItem(post: _posts[index]),
//                 childCount: _posts.length,
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: AppColors.navigationBarBackground,
//         selectedItemColor: AppColors.navigationBarSelected,
//         unselectedItemColor: AppColors.textSecondary,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outline),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.video_library),
//             label: 'Reels',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStories() {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 15,
//         itemBuilder: (context, index) => _StoryItem(index: index),
//       ),
//     );
//   }
// }

// class _StoryItem extends StatelessWidget {
//   final int index;
//   const _StoryItem({required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.primary, width: 2),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(2),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(35),
//                 child: Image.network(
//                   'https://picsum.photos/200?story=$index',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text('User ${index + 1}',
//             style: const TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

// class _PostItem extends StatelessWidget {
//   final Map<String, dynamic> post;
//   const _PostItem({required this.post});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(post['profileImage']),
//           ),
//           title: Text(post['username'],
//             style: const TextStyle(fontWeight: FontWeight.bold)),
//           trailing: IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () {},
//           ),
//         ),
//         AspectRatio(
//           aspectRatio: 1,
//           child: Stack(
//             children: [
//               Image.network(
//                 post['postImage'],
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//               const Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Icon(Icons.video_library, color: Colors.white),
//               ),
//               Positioned.fill(
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.transparent,
//                         Colors.black.withOpacity(0.3),
//                       ],
//                       stops: const [0.6, 1],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.favorite_border),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.comment_outlined),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               Text('${post['likes']} likes',
//                 style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               RichText(
//                 text: TextSpan(
//                   style: const TextStyle(color: Colors.black),
//                   children: [
//                     TextSpan(
//                       text: post['username'],
//                       style: const TextStyle(fontWeight: FontWeight.bold)),
//                     const TextSpan(text: ' '),
//                     TextSpan(text: post['caption']),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(height: 1),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:project_zero/core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _posts = [];
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadMockData();
    _setupScrollListener();
  }

  void _loadMockData() {
    final mockPosts = List.generate(10, (index) => {
      'id': index,
      'username': 'User ${index + 1}',
      'profileImage': 'https://picsum.photos/200?random=$index',
      'likes': (index + 1) * 100,
      'comments': (index + 1) * 10,
      'caption': 'Sample reel caption ${index + 1}',
    });
    setState(() => _posts.addAll(mockPosts));
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMockData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Project-0',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
            color: AppColors.textPrimary,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadMockData(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(child: _buildStories()),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _ReelItem(post: _posts[index]),
                childCount: _posts.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.navigationBarBackground,
        selectedItemColor: AppColors.navigationBarSelected,
        unselectedItemColor: AppColors.textSecondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildStories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) => _StoryItem(index: index),
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final int index;
  const _StoryItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.network(
                  'https://picsum.photos/200?story=$index',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('User ${index + 1}',
              style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _ReelItem extends StatefulWidget {
  final Map<String, dynamic> post;
  const _ReelItem({required this.post});

  @override
  State<_ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<_ReelItem> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    _videoController = VideoPlayerController.asset('assets/videos/demo_reel_1.mp4');
    
    await _videoController.initialize();
    
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: false,
      looping: true,
      aspectRatio: 1,
      showControls: false,
    );
    
    setState(() {});
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying 
          ? _chewieController?.play()
          : _chewieController?.pause();
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.post['profileImage']),
          ),
          title: Text(
            widget.post['username'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              if (_chewieController != null)
                Chewie(controller: _chewieController!),
              Positioned.fill(
                child: GestureDetector(
                  onTap: _togglePlay,
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: AnimatedOpacity(
                        opacity: _isPlaying ? 0 : 1,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(
                          Icons.play_arrow, 
                          size: 50, 
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Row(
                  children: [
                    const Icon(Icons.thumb_up, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.post['likes']}', 
                      style: const TextStyle(color: Colors.white)
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.comment, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.post['comments']}', 
                      style: const TextStyle(color: Colors.white)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: widget.post['username'],
                      style: const TextStyle(fontWeight: FontWeight.bold)
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(text: widget.post['caption']),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}