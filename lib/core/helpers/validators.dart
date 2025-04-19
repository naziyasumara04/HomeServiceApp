String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one number';
  }

  if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    return 'Password must contain at least one special character (!@#\$&*~)';
  }

  return null; // valid
}



String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  // Regular expression for email validation
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  return null; // Email is valid
}


String? validateFullName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your full name';
  }

  // Remove extra spaces
  final trimmedValue = value.trim();

  // Check for at least two words
  if (!trimmedValue.contains(' ') || trimmedValue.split(' ').length < 2) {
    return 'Please enter both first and last name';
  }

  // Check for only letters and spaces
  final nameRegex = RegExp(r'^[a-zA-Z ]+$');
  if (!nameRegex.hasMatch(trimmedValue)) {
    return 'Name can only contain letters and spaces';
  }

  return null; // Name is valid
}
