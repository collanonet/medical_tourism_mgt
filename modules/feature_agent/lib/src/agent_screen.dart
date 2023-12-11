import 'package:flutter/cupertino.dart';

import 'filter_agent.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AgentFilter(),
        const Center(
          child: Text(
            'Agent Screen',
          ),
        ),
      ],
    );
  }
}
