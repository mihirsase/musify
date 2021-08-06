class Album {
  String? name;
  String? artist;
  String? albumArt;

  Album({
    this.name,
    this.artist,
    this.albumArt,
  });
}

List<Album> recommendations= [
  Album(name:'Illuminate',artist: 'Shawn Mendes',albumArt: 'https://upload.wikimedia.org/wikipedia/en/d/d2/Illuminate_%28Official_Album_Cover%29_by_Shawn_Mendes.png'),
  Album(name:'FOUR',artist: 'One Direction',albumArt: 'https://upload.wikimedia.org/wikipedia/en/e/e8/One_Direction_-_Four.png'),
  Album(name:'After Hours',artist: 'Weekend',albumArt: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png'),
  Album(name:'Romance',artist: 'Camila Cabello',albumArt: 'https://upload.wikimedia.org/wikipedia/en/2/23/Romance_%28Official_Album_Cover%29_by_Camila_Cabello.png'),
  Album(name:'Sweetener',artist: 'Ariana Grande',albumArt: 'https://upload.wikimedia.org/wikipedia/en/7/7a/Sweetener_album_cover.png'),
  Album(name:'Evolve',artist: 'Imagine Dragons',albumArt: 'https://upload.wikimedia.org/wikipedia/en/b/b5/ImagineDragonsEvolve.jpg'),
  Album(name:'folklore',artist: 'Taylor Swift',albumArt: 'https://upload.wikimedia.org/wikipedia/en/f/f8/Taylor_Swift_-_Folklore.png'),
  Album(name:'24K Magic',artist: 'Bruno Mars',albumArt: 'https://upload.wikimedia.org/wikipedia/en/2/2b/Bruno_Mars_-_24K_Magic_%28Official_Album_Cover%29.png'),
  Album(name:'Fine line',artist: 'Harry Styles',albumArt: 'https://upload.wikimedia.org/wikipedia/en/b/b1/Harry_Styles_-_Fine_Line.png'),
  Album(name:'Scorpion',artist: 'Drake',albumArt: 'https://upload.wikimedia.org/wikipedia/en/9/90/Scorpion_by_Drake.jpg'),
];
