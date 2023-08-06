import se.michaelthelin.spotify.SpotifyApi;
import java.util.Arrays;
import javax.swing.JOptionPane;


String input = "";
ArrayList<Artist> list = new ArrayList<>();
ArrayList<Artist> list_sub = new ArrayList<>();
ArrayList<String> name_list = new ArrayList<>();

void setup() {
  size(1400, 950);
  background(255, 255, 255);
  PFont font = createFont("Meiryo", 18);
  textFont(font);
  input = JOptionPane.showInputDialog("アーティストのIDを入力してください");
}

void draw() {
  //if(input=="a"){
  //  setup();
  //}
  if (input!="") {
    Spotify(input);
    //メインアーティスト
    fill(#e6acac);
    noStroke();
    int x_main = 700;
    int y_main = 470;
    ellipse(x_main, y_main, list.get(0).rad(), list.get(0).rad());

    //関連アーティスト
    stroke(0);
    strokeWeight(0.2);
    stroke(#6F6F6F);
    for (int i=1; i<9; i++) {
      line(x_main +list.get(i).x1(), y_main+list.get(i).y1(),
        x_main+list.get(i).x2(), y_main+list.get(i).y2());
    }
    
    int sub=0;
    for (int i=0; i<16; i++) {
      if(i%2==0){
        sub++;
      }
      line(x_main+list.get(sub).ex(),y_main+list.get(sub).ey()
      ,x_main+list_sub.get(i).ex(),y_main+list_sub.get(i).ey());
    }
    
    fill(#add8e6);
    noStroke();
    for (int i=1; i<9; i++) {
      ellipse(x_main+list.get(i).ex(), y_main+list.get(i).ey()
        , list.get(i).rad(), list.get(i).rad());
    }

    fill(#fffacd);
    for (int i=0; i<16; i++) {
      ellipse(x_main+list_sub.get(i).ex(), y_main+list_sub.get(i).ey()
        , list_sub.get(i).rad(), list_sub.get(i).rad());
    }

    //メインアーティストの名前表示
    fill(#3A3A3A);
    textAlign(CENTER, CENTER);
    text(list.get(0).name, x_main, y_main);

    //関連アーティストの名前表示
    for (int i=1; i<9; i++) {
      text(list.get(i).name, x_main+list.get(i).ex(), y_main+list.get(i).ey());
    }
    
    //関連の関連アーティストの名前表示
    for (int i=0; i<16; i++) {
      text(list_sub.get(i).name, x_main+list_sub.get(i).ex(), y_main+list_sub.get(i).ey());
    }
  }
}

void Spotify(String input) {
  try {
    var spotifyApi = new SpotifyApi.Builder()
      .setClientId("6f609ffb7bc64c61bcab0ef373b16854")
      .setClientSecret("a3a279cfe3ac42f1b6049ce86b5f2003")
      .build();

    var clientCredentialsRequest = spotifyApi.clientCredentials().build();
    var clientCredentials = clientCredentialsRequest.execute();
    spotifyApi.setAccessToken(clientCredentials.getAccessToken());

    //メインアーティスト
    var getArtist =spotifyApi.getArtist(input)
      .build();
    var artistid=getArtist.execute();
    list.add(new Artist(artistid.getName()
      , artistid.getPopularity()
      , artistid.getId()
      , 100));
    name_list.add(artistid.getName());

    //関連アーティスト
    var getArtistRequest=spotifyApi.getArtistsRelatedArtists(input)
      .build();
    var artistrequestid=getArtistRequest .execute();
    for (int i=0; i<8; i++) {
      list.add(new Artist(artistrequestid[i].getName()
        , artistrequestid[i].getPopularity()
        , artistrequestid[i].getId()
        , i));
      name_list.add(artistrequestid[i].getName());
    }
    //関連の関連アーティスト
    int sub_num=10;
    for (int i=1; i<9; i++) {
      var getArtistRequest_sub=
        spotifyApi.getArtistsRelatedArtists(list.get(i).id)
        .build();
      var artistrequestid_sub=getArtistRequest_sub.execute();
      int position=0;
      int count=0;
      while (count<2) {
        if (name_list.contains(artistrequestid_sub[position].getName())) {
          //println(artistrequestid_sub[count].getName());
        } else {
          list_sub.add(new Artist(artistrequestid_sub[position].getName()
            , artistrequestid_sub[position].getPopularity()
            , artistrequestid_sub[position].getId()
            , sub_num));
          name_list.add(artistrequestid_sub[position].getName());
          count++;
          sub_num++;
        }
        position++;
      }
    }
  }
  catch(Exception e) {
  }
}
