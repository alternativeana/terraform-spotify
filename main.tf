terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.5"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artists = ["Thank You Scientist"]
  album   = "Terraformer"
}

resource "spotify_playlist" "playlist" {
  name        = "Terraforming"
  description = "Playlist created by Terraform. Terraformers only 🙅🏼‍♀️"
  public      = true

  tracks = data.spotify_search_track.by_artist.tracks[*].id
}


output "tracks" {
  value = data.spotify_search_track.by_artist.tracks
}
