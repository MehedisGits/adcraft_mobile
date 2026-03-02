import 'package:flutter/material.dart';

class PlatformMeta {
  final String id;
  final String label;
  final String abbreviation;
  final Color brandColor;

  const PlatformMeta({
    required this.id,
    required this.label,
    required this.abbreviation,
    required this.brandColor,
  });
}

const List<PlatformMeta> kPlatforms = [
  PlatformMeta(
    id: 'facebook',
    label: 'Facebook',
    abbreviation: 'FB',
    brandColor: Color(0xFF1877F2),
  ),
  PlatformMeta(
    id: 'google',
    label: 'Google Ads',
    abbreviation: 'GG',
    brandColor: Color(0xFF4285F4),
  ),
  PlatformMeta(
    id: 'instagram',
    label: 'Instagram',
    abbreviation: 'IG',
    brandColor: Color(0xFF833AB4),
  ),
  PlatformMeta(
    id: 'linkedin',
    label: 'LinkedIn',
    abbreviation: 'LI',
    brandColor: Color(0xFF0A66C2),
  ),
  PlatformMeta(
    id: 'twitter',
    label: 'Twitter / X',
    abbreviation: 'TW',
    brandColor: Color(0xFF1DA1F2),
  ),
  PlatformMeta(
    id: 'tiktok',
    label: 'TikTok',
    abbreviation: 'TT',
    brandColor: Color(0xFFFE2C55),
  ),
];

class ToneMeta {
  final String id;
  final String label;
  final String emoji;
  final Color accentColor;

  const ToneMeta({
    required this.id,
    required this.label,
    required this.emoji,
    required this.accentColor,
  });
}

const List<ToneMeta> kTones = [
  ToneMeta(
    id: 'professional',
    label: 'Professional',
    emoji: '💼',
    accentColor: Color(0xFF6C63FF),
  ),
  ToneMeta(
    id: 'casual',
    label: 'Casual',
    emoji: '😊',
    accentColor: Color(0xFF00D09C),
  ),
  ToneMeta(
    id: 'urgent',
    label: 'Urgent',
    emoji: '⚡',
    accentColor: Color(0xFFFFB800),
  ),
  ToneMeta(
    id: 'inspirational',
    label: 'Inspirational',
    emoji: '✨',
    accentColor: Color(0xFFFF6B9D),
  ),
  ToneMeta(
    id: 'humorous',
    label: 'Humorous',
    emoji: '😄',
    accentColor: Color(0xFFF9A825),
  ),
  ToneMeta(
    id: 'empathetic',
    label: 'Empathetic',
    emoji: '🤝',
    accentColor: Color(0xFF4FC3F7),
  ),
];

PlatformMeta? platformById(String id) {
  try {
    return kPlatforms.firstWhere((p) => p.id == id);
  } catch (_) {
    return null;
  }
}

ToneMeta? toneById(String id) {
  try {
    return kTones.firstWhere((t) => t.id == id);
  } catch (_) {
    return null;
  }
}
