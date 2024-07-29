import 'package:uaskipot/common/app_info.dart';
import 'package:uaskipot/data/source/user_source.dart';
import 'package:uaskipot/presentation/widgets/app_button.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final edtName = TextEditingController();
  final edtEmail = TextEditingController();

  addNewEmployee() {
    UserSource.addEmployee(edtName.text, edtEmail.text).then((value) {
      var (success, message) = value;
      if (success) {
        AppInfo.success(context, message);
      } else {
        AppInfo.failed(context, message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Employee'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DInput(
            controller: edtName,
            title: 'Name',
            hint: 'type name...',
            fillColor: Color.fromARGB(255, 243, 240, 240),
            radius: BorderRadius.circular(12),
          ),
          const Gap(16),
          DInput(
            controller: edtEmail,
            title: 'Email',
            hint: 'type email...',
            fillColor: Color.fromARGB(255, 248, 245, 245),
            radius: BorderRadius.circular(12),
          ),
          const Gap(16),
          AppButton.primary('Add', () => addNewEmployee()),
        ],
      ),
    );
  }
}
