import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dreamflow/models/user_data.dart';
import 'package:dreamflow/screens/offer_screen.dart';
import 'package:dreamflow/utils/navigation_service.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({Key? key}) : super(key: key);

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Timer _timer;
  int _currentStepIndex = 0;
  double _progressValue = 0.0;
  String _username = '';
  int _robuxAmount = 0;
  
  final List<String> _generationSteps = [
    'Connecting to Roblox servers...',
    'Authenticating username...',
    'Bypassing security...',
    'Generating Robux packages...',
    'Adding Robux to account...',
    'Finalizing process...',
    'Verifying human user...',
  ];
  
  @override
  void initState() {
    super.initState();
    _loadUserData();
    
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
    
    // Start the fake generation process
    _startGenerationProcess();
  }
  
  Future<void> _loadUserData() async {
    final userData = await UserData.loadData();
    if (mounted) {
      setState(() {
        _username = userData.username;
        _robuxAmount = userData.robuxAmount;
      });
    }
  }
  
  void _startGenerationProcess() {
    // Update progress every 100ms
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_progressValue < 1.0) {
        setState(() {
          _progressValue += 0.01;
        });
      } else {
        _timer.cancel();
        NavigationService.pushReplacement(const OfferScreen());
      }
      
      // Update the current step message every ~1.5 seconds
      if (timer.tick % 15 == 0 && _currentStepIndex < _generationSteps.length - 1) {
        setState(() {
          _currentStepIndex++;
        });
      }
    });
  }
  
  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return WillPopScope(
      onWillPop: () async => false, // Prevent going back during generation
      child: Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Robux icon
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.monetization_on,
                        size: 60,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Generation title
                    Text(
                      'GENERATING ROBUX',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // User details
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Username',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _username,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 32),
                          Column(
                            children: [
                              Text(
                                'Amount',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    size: 18,
                                    color: theme.colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$_robuxAmount',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Current operation text
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        _generationSteps[_currentStepIndex],
                        key: ValueKey<int>(_currentStepIndex),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Progress bar
                    LinearProgressIndicator(
                      value: _progressValue,
                      backgroundColor: theme.colorScheme.surface,
                      valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                      borderRadius: BorderRadius.circular(10),
                      minHeight: 12,
                    ),
                    const SizedBox(height: 8),
                    // Progress percentage
                    Text(
                      '${(_progressValue * 100).toInt()}%',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Warning message
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.error.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: theme.colorScheme.error,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Do not close this page or navigate away. Your Robux are being generated.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}