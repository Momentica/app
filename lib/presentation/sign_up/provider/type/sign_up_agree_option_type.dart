enum SignUpAgreeOptionType {
  personal(
    caption: "개인정보 수집 및 활용 동의",
    essential: true,
  ),
  
  terms(
    caption: "서비스 이용약관",
    essential: true,
  );

  final String caption;
  final bool essential;

  const SignUpAgreeOptionType({
    required this.caption,
    required this.essential,
  });
}
