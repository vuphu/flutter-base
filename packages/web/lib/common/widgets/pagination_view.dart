import 'package:flutter/material.dart';

class PaginationView extends StatelessWidget {
  final int currentPage;
  final int startPage;
  final int endPage;
  final int totalPages;
  final Function(int page) onPageChanged;
  final Color primaryColor;

  const PaginationView({
    Key? key,
    required this.currentPage,
    required this.startPage,
    required this.endPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.first_page),
            onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
          ),
          ...List.generate(endPage - startPage + 1, (index) {
            int page = startPage + index;
            bool isCurrent = currentPage == page;
            return GestureDetector(
              onTap: () => onPageChanged(page),
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: isCurrent ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  '$page',
                  style: TextStyle(
                    color: isCurrent ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }),
          if (endPage < totalPages) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('...', style: TextStyle(fontSize: 16)),
            ),
            GestureDetector(
              onTap: () => onPageChanged(totalPages),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: currentPage == totalPages ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  '$totalPages',
                  style: TextStyle(
                    color: currentPage == totalPages ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
          IconButton(
            icon: const Icon(Icons.last_page),
            onPressed: currentPage < totalPages ? () => onPageChanged(totalPages) : null,
          ),
        ],
      ),
    );
  }
}
