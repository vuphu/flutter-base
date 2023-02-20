import 'package:core/config/app/build_config.dart';

// Header queries: q, per_page, page
String searchGithubUsers = "${BuildConfig.baseUrl}/search/users?q=\${q}&per_page=\${per_page}&page=\${page}";
