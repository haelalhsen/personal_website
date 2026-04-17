import 'package:personal_intro/data/datasources/local_data_source.dart';
import 'package:personal_intro/data/models/article.dart';
import 'package:personal_intro/data/models/experience.dart';
import 'package:personal_intro/data/models/expertise.dart';
import 'package:personal_intro/data/models/project.dart';
import 'package:personal_intro/data/models/repo.dart';
import 'package:personal_intro/data/models/skill.dart';
import 'package:personal_intro/data/models/testimonial.dart';

class PortfolioRepository {
  PortfolioRepository({LocalDataSource? dataSource})
      : _dataSource = dataSource ?? const LocalDataSource();

  final LocalDataSource _dataSource;

  Future<List<Project>> getProjects() => _dataSource.loadProjects();
  Future<List<Expertise>> getExpertise() => _dataSource.loadExpertise();
  Future<List<Experience>> getExperience() => _dataSource.loadExperience();
  Future<List<Repo>> getRepos() => _dataSource.loadRepos();
  Future<List<Testimonial>> getTestimonials() => _dataSource.loadTestimonials();
  Future<List<Article>> getArticles() => _dataSource.loadArticles();
  Future<List<SkillCategory>> getSkills() => _dataSource.loadSkills();
}
