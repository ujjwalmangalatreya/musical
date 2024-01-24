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

  Map<String, dynamic> toJson() {
    return {
      'linkedin': linkedin,
      'instagram': instagram,
    };
  }
}
