import 'package:flutter/material.dart';
import 'package:dreamflow/models/user_data.dart';
import 'package:dreamflow/screens/generator_screen.dart';
import 'package:dreamflow/utils/navigation_service.dart';
import 'package:dreamflow/widgets/robux_button.dart';
import 'package:dreamflow/widgets/robux_card.dart';

class RobuxSelectionScreen extends StatefulWidget {
  const RobuxSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RobuxSelectionScreen> createState() => _RobuxSelectionScreenState();
}

class _RobuxSelectionScreenState extends State<RobuxSelectionScreen> with SingleTickerProviderStateMixin {
  final List<int> _robuxOptions = [800, 1100, 2000, 4000];
  int? _selectedRobuxAmount;
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String _username = '';
  
  @override
  void initState() {
    super.initState();
    _loadUsername();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
  }
  
  Future<void> _loadUsername() async {
    final userData = await UserData.loadData();
    if (mounted) {
      setState(() {
        _username = userData.username;
      });
    }
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectRobuxAmount(int amount) {
    setState(() {
      _selectedRobuxAmount = amount;
    });
  }

  void _proceedToGeneration() async {
    if (_selectedRobuxAmount != null) {
      setState(() {
        _isLoading = true;
      });
      
      // Save selected amount
      final userData = UserData(username: _username, robuxAmount: _selectedRobuxAmount!);
      await userData.saveData();
      
      // Add a small delay to simulate processing
      await Future.delayed(const Duration(milliseconds: 500));
      
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        
        // Navigate to generator screen
        NavigationService.push(const GeneratorScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Robux Amount',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () => NavigationService.goBack(),
        ),
      ),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.surface,
                  theme.colorScheme.surface.withOpacity(0.9),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Username display
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.primary.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Username: ',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _username,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Instructions
                  Text(
                    'How many Robux do you want?',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select an amount from the options below',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Robux options grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: _robuxOptions.length,
                      itemBuilder: (context, index) {
                        final amount = _robuxOptions[index];
                        return RobuxCard(
                          amount: amount,
                          isSelected: _selectedRobuxAmount == amount,
                          onTap: () => _selectRobuxAmount(amount),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Generate button
                  RobuxButton(
                    text: 'GENERATE ROBUX',
                    icon: Icons.flash_on,
                    onPressed: _proceedToGeneration,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}