class UserDTO {
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final List<String> roles;

  UserDTO(this.firstName, this.lastName, this.password, this.email, this.roles);
}
