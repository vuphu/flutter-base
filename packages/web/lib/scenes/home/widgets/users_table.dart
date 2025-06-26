import 'package:core/modules/github/github_module.dart';
import 'package:flutter/material.dart';

class UsersTable extends StatefulWidget {
  UsersTable({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<UserResponse> users;

  @override
  _UsersTableState createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        showBottomBorder: true,
        dividerThickness: 0,
        dataRowMaxHeight: 75,
        columnSpacing: 16,
        columns: [
          DataColumn(label: _buildDataColumn('ID')),
          DataColumn(label: _buildDataColumn('Login')),
        ],
        rows: widget.users
            .map((user) => DataRow(cells: [
                  DataCell(Text(user.id.toString())),
                  DataCell(_buildUserLogin(user)),
                ]))
            .toList(),
      ),
    );
  }

  Widget _buildDataColumn(String title) {
    return Expanded(
      child: Center(
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildUserLogin(UserResponse user) {
    return ListTile(
      title: Text(user.login),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
    );
  }
}
