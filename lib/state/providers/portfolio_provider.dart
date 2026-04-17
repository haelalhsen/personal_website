import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/data/models/article.dart';
import 'package:personal_intro/data/models/experience.dart';
import 'package:personal_intro/data/models/expertise.dart';
import 'package:personal_intro/data/models/project.dart';
import 'package:personal_intro/data/models/repo.dart';
import 'package:personal_intro/data/models/skill.dart';
import 'package:personal_intro/data/models/testimonial.dart';
import 'package:personal_intro/data/repositories/portfolio_repository.dart';

final portfolioRepositoryProvider = Provider<PortfolioRepository>(
  (_) => PortfolioRepository(),
);

final experienceProvider = FutureProvider<List<Experience>>((ref) {
  return ref.read(portfolioRepositoryProvider).getExperience();
});

final projectsProvider = FutureProvider<List<Project>>((ref) {
  return ref.read(portfolioRepositoryProvider).getProjects();
});

final expertiseProvider = FutureProvider<List<Expertise>>((ref) {
  return ref.read(portfolioRepositoryProvider).getExpertise();
});

final reposProvider = FutureProvider<List<Repo>>((ref) {
  return ref.read(portfolioRepositoryProvider).getRepos();
});

final testimonialsProvider = FutureProvider<List<Testimonial>>((ref) {
  return ref.read(portfolioRepositoryProvider).getTestimonials();
});

final articlesProvider = FutureProvider<List<Article>>((ref) {
  return ref.read(portfolioRepositoryProvider).getArticles();
});

final skillsProvider = FutureProvider<List<SkillCategory>>((ref) {
  return ref.read(portfolioRepositoryProvider).getSkills();
});
