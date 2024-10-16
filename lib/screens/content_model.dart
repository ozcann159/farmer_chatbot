class OnboardingContent {
  String image;
  String description; // Yazım hatası düzeltildi

  // Yapıcı metod
  OnboardingContent(
      {required this.image,
      required this.description}); // Named parametreler kullanıldı
}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: "assets/images/image1.png",
    description: 'Lorem ipsum odor amet, consectetuer adipiscing elit. '
        'Porttitor consectetur volutpat montes ipsum duis ac nibh, ex euismod.',
  ),
  OnboardingContent(
    image: "assets/images/image1.png",
    description: 'Lorem ipsum odor amet, consectetuer adipiscing elit.'
        'Porttitor consectetur volutpat montes ipsum duis ac nibh, ex euismod.',
  ),
  OnboardingContent(
    image: "assets/images/image1.png",
    description: 'Lorem ipsum odor amet, consectetuer adipiscing elit.'
        'Porttitor consectetur volutpat montes ipsum duis ac nibh, ex euismod.',
  ),
];
