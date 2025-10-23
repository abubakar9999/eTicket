import 'package:flutter/material.dart';


// --- MOCK DATA STRUCTURES ---

class KpiData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trendText;
  final IconData trendIcon;
  final Color trendColor;

  KpiData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trendText,
    required this.trendIcon,
    required this.trendColor,
  });
}

class RouteData {
  final String route;
  final int trips;
  final int revenue;
  final int loadFactor;

  RouteData({
    required this.route,
    required this.trips,
    required this.revenue,
    required this.loadFactor,
  });
}

class BusStatus {
  final String busId;
  final String route;
  final String status;
  final Color color;
  final IconData icon;
  final String tag;
  final Color tagColor;

  BusStatus({
    required this.busId,
    required this.route,
    required this.status,
    required this.color,
    required this.icon,
    required this.tag,
    required this.tagColor,
  });
}

// --- DATA SIMULATION ---

final List<KpiData> todayKpis = [
  KpiData(
    title: 'Total Revenue',
    value: 'BDT 20,000',
    icon: Icons.account_balance_wallet_outlined,
    color: const Color(0xFF818CF8), // Indigo-400
    trendText: '+11.1%',
    trendIcon: Icons.arrow_upward,
    trendColor: Colors.green.shade400,
  ),
  KpiData(
    title: 'Total Trips',
    value: '4',
    icon: Icons.directions_bus_filled_outlined,
    color: const Color(0xFF60A5FA), // Blue-400
    trendText: '+33.3%',
    trendIcon: Icons.arrow_upward,
    trendColor: Colors.green.shade400,
  ),
  KpiData(
    title: 'Total Passengers',
    value: '100',
    icon: Icons.people_outline,
    color: const Color(0xFF4EEAD5), // Teal-400
    trendText: 'N/A',
    trendIcon: Icons.remove,
    trendColor: Colors.grey.shade400,
  ),
  KpiData(
    title: 'Avg Load Factor',
    value: '75%',
    icon: Icons.speed_outlined,
    color: const Color(0xFF4ADE80), // Green-400
    trendText: '+3.2%',
    trendIcon: Icons.arrow_upward,
    trendColor: Colors.green.shade400,
  ),
  KpiData(
    title: 'Maintenance Alerts',
    value: '2',
    icon: Icons.warning_amber_outlined,
    color: Colors.red.shade500,
    trendText: 'N/A',
    trendIcon: Icons.remove,
    trendColor: Colors.grey.shade400,
  ),
];

final List<RouteData> routePerformanceData = [
  RouteData(route: 'Dhaka - Chittagong', trips: 2, revenue: 12000, loadFactor: 85),
  RouteData(route: 'Dhaka - Rajshahi', trips: 1, revenue: 5000, loadFactor: 70),
  RouteData(route: 'Dhaka - Sylhet', trips: 1, revenue: 3000, loadFactor: 60),
];

final List<BusStatus> busStatusData = [
  BusStatus(
    busId: 'B-001',
    route: 'Dhaka-Ctg',
    status: 'On Route',
    icon: Icons.check_circle_outline,
    color: Colors.green.shade400,
    tag: 'On',
    tagColor: Colors.green.shade600,
  ),
  BusStatus(
    busId: 'B-002',
    route: 'Dhaka-Sylhet',
    status: 'Delayed (30m)',
    icon: Icons.alarm_on_outlined,
    color: Colors.yellow.shade400,
    tag: 'Delayed',
    tagColor: Colors.yellow.shade600,
  ),
  BusStatus(
    busId: 'B-003',
    route: 'Maintenance',
    status: 'Engine Check',
    icon: Icons.build_outlined,
    color: Colors.red.shade400,
    tag: 'Engine',
    tagColor: Colors.red.shade600,
  ),
  BusStatus(
    busId: 'B-004',
    route: 'Idle',
    status: 'At Terminal',
    icon: Icons.location_on_outlined,
    color: Colors.blue.shade400,
    tag: 'At',
    tagColor: Colors.indigo.shade600,
  ),
];


// --- HELPER WIDGETS ---

class _KpiCard extends StatelessWidget {
  final KpiData data;

  const _KpiCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 120, // Fixed height for visual consistency
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(data.icon, color: data.color, size: 24),
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.value,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(data.trendIcon, color: data.trendColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      data.trendText,
                      style: TextStyle(fontSize: 12, color: data.trendColor),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'vs Last Period',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BusStatusItem extends StatelessWidget {
  final BusStatus status;

  const _BusStatusItem({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF4A5568), // Slightly darker gray for the item background
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(status.icon, color: status.color, size: 20),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${status.busId} - ${status.route}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    status.status,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status.tagColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status.tag,
              style: const TextStyle(
                  color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoutePerformanceTable extends StatelessWidget {
  final List<RouteData> routes;

  const _RoutePerformanceTable({required this.routes});

  String _formatCurrency(int amount) {
    return 'BDT ${amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  Color _getLoadFactorColor(int factor) {
    if (factor >= 80) return Colors.green.shade400;
    if (factor >= 65) return Colors.yellow.shade400;
    return Colors.red.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.show_chart_outlined, color: Colors.green.shade400, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Top Route Performance',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 24,
                headingTextStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
                dataTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 14),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.shade700, width: 0.5)),
                ),
                columns: const [
                  DataColumn(label: Text('ROUTE')),
                  DataColumn(label: Text('TRIPS'), numeric: true),
                  DataColumn(label: Text('REVENUE'), numeric: true),
                  DataColumn(label: Text('LOAD FACTOR'), numeric: true),
                ],
                rows: routes.map((route) {
                  return DataRow(cells: [
                    DataCell(Text(route.route)),
                    DataCell(Text(route.trips.toString())),
                    DataCell(Text(_formatCurrency(route.revenue))),
                    DataCell(
                      Text(
                        '${route.loadFactor}%',
                        style: TextStyle(color: _getLoadFactorColor(route.loadFactor), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- MAIN DASHBOARD WIDGET ---

class BusDashboard extends StatelessWidget {
  const BusDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3748), // Dark gray background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A202C),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hanif Transport LTD', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white)),
            Text('Operational & Financial Overview', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
          ],
        ),
        actions: [
          _buildFilterButton('Today', true),
          _buildFilterButton('This Week', false),
          _buildFilterButton('This Month', false),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // KPI Section (Responsive Grid)
              GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 5 : MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: todayKpis.map((kpi) => _KpiCard(data: kpi)).toList(),
              ),
              const SizedBox(height: 24),

              // Main Content Grid (Bus Status & Financials)
              LayoutBuilder(
                builder: (context, constraints) {
                  // For smaller screens, stack the two columns
                  if (constraints.maxWidth < 900) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _buildMainContentWidgets(),
                    );
                  }
                  // For wider screens, use a 1/2 split Row
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Real-Time Operational Status (1/3 width)
                      Expanded(
                        flex: 1,
                        child: _buildRealTimeStatusCard(),
                      ),
                      const SizedBox(width: 16),
                      // Financials and Charts (2/3 width)
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: _buildFinancialsAndChartsWidgets(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the filter buttons in the AppBar
  Widget _buildFilterButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          // In a real app, this would trigger a state change and re-render the data.
        },
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF4F46E5) : Colors.grey.shade700,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade200,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Helper method for the Real-Time Status Card
  Widget _buildRealTimeStatusCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.directions_bus_outlined, color: Colors.indigo.shade400, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Real-Time Bus Status',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: busStatusData.map((status) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _BusStatusItem(status: status),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for the Financials and Charts section (Route Performance and Trend)
  List<Widget> _buildFinancialsAndChartsWidgets() {
    return [
      // Route Performance Table
      _RoutePerformanceTable(routes: routePerformanceData),
      const SizedBox(height: 16),
      // Monthly Booking Trend (Placeholder)
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, color: Colors.yellow.shade400, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Monthly Booking Trend',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 256,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '[Placeholder for Revenue Trend Chart, e.g., using flutter_charts]',
                    style: TextStyle(color: Colors.grey.shade400, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  // Combines the main content widgets for small screens (Column layout)
  List<Widget> _buildMainContentWidgets() {
    return [
      _buildRealTimeStatusCard(),
      const SizedBox(height: 16),
      ..._buildFinancialsAndChartsWidgets(),
    ];
  }
}
