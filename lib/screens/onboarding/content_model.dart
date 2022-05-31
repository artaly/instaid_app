class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      title: 'Quality Food',
      image: 'assets/svg/first_onboard.svg',
      description: "Hay nako teh"
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnboardingContent(
      title: 'Fast Delevery',
      image: 'assets/svg/first_onboard.svg',
      description:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnboardingContent(
      title: 'Reward surprises',
      image: 'assets/svg/first_onboard.svg',
      description:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
];
