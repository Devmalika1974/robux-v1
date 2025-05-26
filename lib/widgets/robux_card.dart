import 'package:flutter/material.dart';

class RobuxCard extends StatefulWidget {
  final int amount;
  final bool isSelected;
  final VoidCallback onTap;

  const RobuxCard({
    Key? key,
    required this.amount,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RobuxCard> createState() => _RobuxCardState();
}

class _RobuxCardState extends State<RobuxCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: widget.isSelected 
                    ? theme.colorScheme.primary 
                    : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: widget.isSelected 
                      ? theme.colorScheme.primary 
                      : theme.colorScheme.outline,
                  width: widget.isSelected ? 2 : 1,
                ),
                boxShadow: widget.isSelected ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ] : [],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Robux icon and amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: widget.isSelected 
                              ? theme.colorScheme.onPrimary 
                              : theme.colorScheme.primary,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.amount}',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: widget.isSelected 
                                ? theme.colorScheme.onPrimary 
                                : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ROBUX',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: widget.isSelected 
                            ? theme.colorScheme.onPrimary 
                            : theme.colorScheme.primary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Selection indicator
                    AnimatedOpacity(
                      opacity: widget.isSelected ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'SELECTED',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}