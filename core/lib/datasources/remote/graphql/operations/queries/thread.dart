const String searchThreads = """
  query {
    searchThreads(option: {}) {
      id
      createdBy
      title
      description
      language
      tag
    }
  }
""";
