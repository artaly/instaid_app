class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      title: 'Test po',
      image: 'assets/svg/first_onboard.svg',
      description: "Hay nako teh"
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnboardingContent(
      title: 'Isa pa po',
      image: 'assets/svg/second_onboard.svg',
      description:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnboardingContent(
      title: 'Last na po',
      image: 'assets/svg/third_onboard.svg',
      description:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
];
