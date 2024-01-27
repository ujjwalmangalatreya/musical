class UserProfile {
  String userId;
  String fullName;
  String location;
  MusicalDetails musicalDetails;
  String bio;
  Portfolio portfolio;
  AvailabilityPreferences availabilityPreferences;
  ConnectionsCollaborations connectionsCollaborations;
  SocialMediaLinks socialMediaLinks;

  UserProfile({
    required this.userId,
    required this.fullName,
    required this.location,
    required this.musicalDetails,
    required this.bio,
    required this.portfolio,
    required this.availabilityPreferences,
    required this.connectionsCollaborations,
    required this.socialMediaLinks,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userId'],
      fullName: json['fullName'],
      location: json['location'],
      musicalDetails: MusicalDetails.fromJson(json['musicalDetails']),
      bio: json['bio'],
      portfolio: Portfolio.fromJson(json['portfolio']),
      availabilityPreferences: AvailabilityPreferences.fromJson(json['availabilityPreferences']),
      connectionsCollaborations: ConnectionsCollaborations.fromJson(json['connectionsCollaborations']),
      socialMediaLinks: SocialMediaLinks.fromJson(json['socialMediaLinks']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'location': location,
      'musicalDetails': musicalDetails.toJson(),
      'bio': bio,
      'portfolio': portfolio.toJson(),
      'availabilityPreferences': availabilityPreferences.toJson(),
      'connectionsCollaborations': connectionsCollaborations.toJson(),
      'socialMediaLinks': socialMediaLinks.toJson(),
    };
  }
}

class MusicalDetails {
  List<String> instruments;
  List<String> genres;
  List<String> influences;
  String skillLevel;

  MusicalDetails({
    required this.instruments,
    required this.genres,
    required this.influences,
    required this.skillLevel,
  });

  factory MusicalDetails.fromJson(Map<String, dynamic> json) {
    return MusicalDetails(
      instruments: List<String>.from(json['instruments']),
      genres: List<String>.from(json['genres']),
      influences: List<String>.from(json['influences']),
      skillLevel: json['skillLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instruments': instruments,
      'genres': genres,
      'influences': influences,
      'skillLevel': skillLevel,
    };
  }
}

class Portfolio {
  String soundcloudLink;
  List<String> musicSamples;

  Portfolio({
    required this.soundcloudLink,
    required this.musicSamples,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      soundcloudLink: json['soundcloudLink'],
      musicSamples: List<String>.from(json['musicSamples']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soundcloudLink': soundcloudLink,
      'musicSamples': musicSamples,
    };
  }
}

class AvailabilityPreferences {
  bool rehearsals;
  bool gigs;
  String preferences;

  AvailabilityPreferences({
    required this.rehearsals,
    required this.gigs,
    required this.preferences,
  });

  factory AvailabilityPreferences.fromJson(Map<String, dynamic> json) {
    return AvailabilityPreferences(
      rehearsals: json['rehearsals'],
      gigs: json['gigs'],
      preferences: json['preferences'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rehearsals': rehearsals,
      'gigs': gigs,
      'preferences': preferences,
    };
  }
}

class ConnectionsCollaborations {
  List<String> currentBands;
  List<String> collaborations;

  ConnectionsCollaborations({
    required this.currentBands,
    required this.collaborations,
  });

  factory ConnectionsCollaborations.fromJson(Map<String, dynamic> json) {
    return ConnectionsCollaborations(
      currentBands: List<String>.from(json['currentBands']),
      collaborations: List<String>.from(json['collaborations']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentBands': currentBands,
      'collaborations': collaborations,
    };
  }
}

class SocialMediaLinks {
  String linkedin;
  String instagram;

  SocialMediaLinks({
    required this.linkedin,
    required this.instagram,
  });

  factory SocialMediaLinks.fromJson(Map<String, dynamic> json) {
    return SocialMediaLinks(
      linkedin: json['linkedin'],
      instagram: json['instagram'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'linkedin': linkedin,
      'instagram': instagram,
    };
  }
}
