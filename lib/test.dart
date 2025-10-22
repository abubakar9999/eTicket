import 'package:flutter/material.dart';



class TicketHomePage extends StatefulWidget {
  const TicketHomePage({super.key});

  @override
  State<TicketHomePage> createState() => _TicketHomePageState();
}

class _TicketHomePageState extends State<TicketHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const TicketSalesPage(),
      const Center(child: Text("📅 Booking Page", style: TextStyle(fontSize: 20))),
      const Center(child: Text("↩️ Return Page", style: TextStyle(fontSize: 20))),
      const Center(child: Text("📊 Summary Page", style: TextStyle(fontSize: 20))),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Sales System"),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Ticket Sales'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_return), label: 'Return'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Summary'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// ✅ Ticket Sales Page
class TicketSalesPage extends StatefulWidget {
  const TicketSalesPage({super.key});

  @override
  State<TicketSalesPage> createState() => _TicketSalesPageState();
}

class _TicketSalesPageState extends State<TicketSalesPage> {
  String? _from;
  String? _to;
  DateTime? _journeyDate;
  bool _showBusList = false;

  final List<String> _locations = ["Dhaka", "Rajshahi", "Chittagong", "Khulna"];
  final List<Map<String, String>> _busList = [
    {"name": "Green Line", "time": "08:00 AM"},
    {"name": "Shohag", "time": "09:30 AM"},
    {"name": "Hanif", "time": "10:00 AM"},
    {"name": "Desh Travels", "time": "11:00 AM"},
  ];

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _journeyDate = picked;
      });
    }
  }

  void _searchBus() {
    if (_from != null && _to != null && _journeyDate != null) {
      setState(() {
        _showBusList = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Going From
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: "Going From"),
            value: _from,
            items: _locations.map((loc) {
              return DropdownMenuItem(value: loc, child: Text(loc));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _from = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Going To
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: "Going To"),
            value: _to,
            items: _locations.map((loc) {
              return DropdownMenuItem(value: loc, child: Text(loc));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _to = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Journey Date
          Row(
            children: [
              Expanded(
                child: Text(
                  _journeyDate == null
                      ? "Select Journey Date"
                      : "Journey Date: ${_journeyDate!.day}-${_journeyDate!.month}-${_journeyDate!.year}",
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: _pickDate,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Search Button
          ElevatedButton.icon(
            onPressed: _searchBus,
            icon: const Icon(Icons.search),
            label: const Text("Search Bus"),
          ),
          const SizedBox(height: 20),

          // Bus List
          if (_showBusList)
            Expanded(
              child: ListView.builder(
                itemCount: _busList.length,
                itemBuilder: (context, index) {
                  final bus = _busList[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.directions_bus, color: Colors.blue),
                      title: Text(bus["name"]!),
                      subtitle: Text("Departure: ${bus["time"]}"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // TODO: Navigate to seat selection or details
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
