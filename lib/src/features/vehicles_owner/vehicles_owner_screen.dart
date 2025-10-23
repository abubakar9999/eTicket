import 'package:flutter/material.dart';
import 'dart:async';

class VehiclesOwnerCreate extends StatefulWidget {
  const VehiclesOwnerCreate({super.key});

  @override
  State<VehiclesOwnerCreate> createState() => _VehiclesOwnerCreateState();
}

class _VehiclesOwnerCreateState extends State<VehiclesOwnerCreate> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? selectedCompany;
  final List<String> companies = ["MH Travels", "Green Line", "Hanif", "Desh Travels"];

  bool isSaving = false;

  Future<void> _saveOwner() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isSaving = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() => isSaving = false);

      // ✅ Use Flutter Snackbar instead of GetX
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Vehicle owner added successfully!'),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );

      // Clear form
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      addressController.clear();
      setState(() => selectedCompany = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vehicle Owner"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              _buildTextField(
                controller: nameController,
                label: "Owner Name",
                icon: Icons.person,
                validator: (value) => value!.isEmpty ? "Enter owner name" : null,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: phoneController,
                label: "Phone Number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? "Enter phone number" : null,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: emailController,
                label: "Email (optional)",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: addressController,
                label: "Address",
                icon: Icons.location_on,
                validator: (value) => value!.isEmpty ? "Enter address" : null,
              ),
              const SizedBox(height: 10),

              // ✅ Company Dropdown
              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Select Company',
                  prefixIcon: const Icon(Icons.business),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCompany,
                    hint: const Text("Choose company"),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() => selectedCompany = value);
                    },
                    items: companies
                        .map((company) => DropdownMenuItem(
                      value: company,
                      child: Text(company),
                    ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // ✅ Save Button
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: Text(isSaving ? "Saving..." : "Save"),
                onPressed: isSaving ? null : _saveOwner,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
