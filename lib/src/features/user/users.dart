import 'package:eticket/src/data/models/login_model.dart';
import 'package:eticket/src/features/user/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameCtrl = TextEditingController(text: "Owner X");
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController(text: "01700000100");
  final emailCtrl = TextEditingController();
  int role = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create User"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// First Name
              _buildField(
                controller: firstNameCtrl,
                label: "First Name",
                hint: "Enter first name",
              ),

              const SizedBox(height: 15),

              /// Last Name
              _buildField(
                controller: lastNameCtrl,
                label: "Last Name",
                hint: "Enter last name (optional)",
              ),

              const SizedBox(height: 15),

              /// Phone
              _buildField(
                controller: phoneCtrl,
                label: "Phone Number",
                hint: "Enter phone number",
                keyboard: TextInputType.phone,
              ),

              const SizedBox(height: 15),

              /// Email
              _buildField(
                controller: emailCtrl,
                label: "Email",
                hint: "Enter email (optional)",
                keyboard: TextInputType.emailAddress,
              ),

              const SizedBox(height: 15),

              /// Role Dropdown
              Text(
                "Select Role",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<int>(
                value: role,
                decoration: _inputDecoration(),
                items: const [
                  DropdownMenuItem(value: 1, child: Text("Admin")),
                  DropdownMenuItem(value: 2, child: Text("Manager")),
                  DropdownMenuItem(value: 3, child: Text("Staff")),
                ],
                onChanged: (v) => setState(() => role = v!),
              ),

              const SizedBox(height: 30),

              /// Submit Button
              BlocConsumer<UsersBloc, UsersState>(
                listener: (context, state) {
                  // TODO: implement listener

                  if (state is UsersError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                    );
                  } else if (state is UserCreated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("User created successfully"), backgroundColor: Colors.green),
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final body = {
                            "firstName": firstNameCtrl.text,
                            "lastName":
                                lastNameCtrl.text.isEmpty
                                    ? null
                                    : lastNameCtrl.text,
                            "phone": phoneCtrl.text,
                            "email":
                                emailCtrl.text.isEmpty ? null : emailCtrl.text,
                            "role": role,
                          };

                          print("Sending body: $body");

                          context.read<UsersBloc>().add(CreateUser(body));

                          // You can send this body now through bloc/api/etc.
                        }
                      },
                      child: const Text(
                        "Create User",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom TextField Widget
  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration: _inputDecoration(label: label, hint: hint),
      validator: (v) {
        if (label == "Email" && v!.isNotEmpty) {
          if (!v.contains("@")) return "Enter a valid email";
        }
        if (label == "Phone Number" && v!.length < 10) {
          return "Enter a valid phone number";
        }
        if (label != "Last Name" && v!.trim().isEmpty) {
          return "$label is required";
        }
        return null;
      },
    );
  }

  /// Box Decoration
  InputDecoration _inputDecoration({String? label, String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
