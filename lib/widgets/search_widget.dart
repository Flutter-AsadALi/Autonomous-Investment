import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';
import '../resources/session_controller/session_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class SearchWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController searchController;
  final Function(String)? onChanged;
  final Function()? onTap;
  final VoidCallback? clearPress;
  final Color? fillColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final double borderRadius;
  final double height;
  final IconData? prefixIcon;
  final IconData? clearIcon;
  final double iconSize;
  final bool useGradient;
  final Gradient? gradient;
  final bool useGlassMorphism;
  final double blurStrength;

  const SearchWidget({
    Key? key,
    required this.hintText,
    required this.searchController,
    this.onChanged,
    this.onTap,
    this.clearPress,
    this.fillColor = Colors.white,
    this.borderColor,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.borderRadius = 32.0,
    this.height = 8.0,
    this.prefixIcon = PhosphorIcons.magnifying_glass,
    this.clearIcon = PhosphorIcons.x_circle,
    this.iconSize = 20.0,
    this.useGradient = false,
    this.gradient,
    this.useGlassMorphism = false,
    this.blurStrength = 20.0,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _iconColorAnimation;
  late bool _isHovered;

  @override
  void initState() {
    super.initState();
    _isHovered = false;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _iconColorAnimation = ColorTween(
      begin: widget.iconColor,
      end: widget.iconColor!.withOpacity(0.7),
    ).animate(_animationController);

    // Start the animation on load
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor = widget.borderColor ?? SessionController.themeLightColor;
    final Color effectiveIconColor = widget.iconColor ?? SessionController.themeLightColor;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: Container(
          // height: widget.height.h,
          width: 100.0.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: widget.useGradient
                ? widget.gradient ??
                LinearGradient(
                  colors: [AppColors.linearGradientLight, AppColors.linearGradientDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                : null,
            color: widget.useGradient ? null : widget.fillColor,
            boxShadow: [
              BoxShadow(
                color: effectiveBorderColor.withOpacity(0.15),
                offset: const Offset(0, 8),
                blurRadius: 25,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Glassmorphism Background
              if (widget.useGlassMorphism)
                ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: widget.blurStrength,
                      sigmaY: widget.blurStrength,
                    ),
                    child: Container(
                      color: widget.fillColor!.withOpacity(0.2),
                    ),
                  ),
                ),

              // Search Field
              SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: 2.0.h, vertical: 1.0.h),
                child: TextField(
                  controller: widget.searchController,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  style: AppTextStyle.regularWhite12(context).copyWith(color: widget.textColor),
                  decoration: InputDecoration(
                    fillColor: widget.fillColor!.withOpacity(0.2),
                    filled: !widget.useGradient,
                    prefixIcon: AnimatedBuilder(
                      animation: _iconColorAnimation,
                      builder: (context, child) {
                        return Icon(
                          widget.prefixIcon,
                          color: _isHovered ? _iconColorAnimation.value : effectiveIconColor,
                          size: widget.iconSize,
                        );
                      },
                    ),
                    suffixIcon: IconButton(
                      onPressed: widget.clearPress,
                      icon: AnimatedBuilder(
                        animation: _iconColorAnimation,
                        builder: (context, child) {
                          return Icon(
                            widget.clearIcon,
                            color: _isHovered ? _iconColorAnimation.value : effectiveIconColor,
                            size: widget.iconSize,
                          );
                        },
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: effectiveBorderColor.withOpacity(0.2),
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: effectiveBorderColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: effectiveBorderColor,
                        width: 1.0,
                      ),
                    ),
                    hintStyle: AppTextStyle.regularGrey10(context),
                    hintText: widget.hintText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
