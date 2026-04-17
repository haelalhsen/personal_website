import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:personal_intro/data/models/article.dart';
import 'package:personal_intro/data/models/experience.dart';
import 'package:personal_intro/data/models/expertise.dart';
import 'package:personal_intro/data/models/project.dart';
import 'package:personal_intro/data/models/repo.dart';
import 'package:personal_intro/data/models/skill.dart';
import 'package:personal_intro/data/models/testimonial.dart';

class LocalDataSource {
  const LocalDataSource();

  Future<List<Project>> loadProjects() async {
    final raw = await rootBundle.loadString('assets/data/projects.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .cast<Map<String, dynamic>>()
        .map(Project.fromJson)
        .toList();
  }

  Future<List<Expertise>> loadExpertise() async {
    final raw = await rootBundle.loadString('assets/data/expertise.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .cast<Map<String, dynamic>>()
        .map(Expertise.fromJson)
        .toList();
  }

  Future<List<Experience>> loadExperience() async {
    final raw = await rootBundle.loadString('assets/data/experience.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .cast<Map<String, dynamic>>()
        .map(Experience.fromJson)
        .toList();
  }

  Future<List<Repo>> loadRepos() async {
    final raw = await rootBundle.loadString('assets/data/repos.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .cast<Map<String, dynamic>>()
        .map(Repo.fromJson)
        .toList();
  }

  Future<List<Testimonial>> loadTestimonials() async {
    final raw = await rootBundle.loadString('assets/data/testimonials.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .cast<Map<String, dynamic>>()
        .map(Testimonial.fromJson)
        .toList();
  }

  Future<List<Article>> loadArticles() async {
    final raw = await rootBundle.loadString('assets/data/articles.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .cast<Map<String, dynamic>>()
        .map(Article.fromJson)
        .toList();
  }

  Future<List<SkillCategory>> loadSkills() async {
    final raw = await rootBundle.loadString('assets/data/skills.json');
    final map = json.decode(raw) as Map<String, dynamic>;
    final categories = map['categories'] as List<dynamic>;
    return categories
        .cast<Map<String, dynamic>>()
        .map(SkillCategory.fromJson)
        .toList();
  }
}
