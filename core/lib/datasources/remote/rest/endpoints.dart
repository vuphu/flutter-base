String baseURL = "https://api.github.com";

// Header queries: q, per_page, page
String searchGithubUsers = "$baseURL/search/users?q=\${q}&per_page=\${per_page}&page=\${page}";
