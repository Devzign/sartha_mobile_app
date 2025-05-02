import 'package:flutter/material.dart';
import '../themes/app_color.dart';
import '../themes/custom_text_style.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(imagePath, height: 30, width: 30),
        label: Text(
          text,
          style: CustomTextStyle.style(
            context: context,
            color: AppColor.color59606E,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.colorDADADA, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradientColors = const [Colors.pinkAccent, Colors.purpleAccent],
  });

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: InkWell(
        onTap: () {
          setState(() {
            _isPressed = !_isPressed;
          });
          widget.onPressed();
        },
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(
            gradient:
                !_isPressed
                    ? LinearGradient(
                      colors: widget.gradientColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                    : null,
            color: _isPressed ? widget.gradientColors[0] : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderWidth;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor = AppColor.color93287f,
    this.borderWidth = 1.5,
    this.textColor = AppColor.color93287f,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 6),
            blurRadius: 8,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: borderColor, width: borderWidth),
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            backgroundColor: Colors.white,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}

class TertiaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  const TertiaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColor.color93287f,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}