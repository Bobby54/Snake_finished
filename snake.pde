ArrayList<Integer> px = new ArrayList<Integer>(), py = new ArrayList<Integer>();

float w = 30, h = 30;
float size = 20;
int dir = 2;
int fx = (int)random(0, w);
int fy = (int)random(0, h);
int [] dx = {0, 0, 1, -1}, dy = {1, -1, 0, 0};

boolean dead = false;

void setup(){
  size(600, 600);
  px.add(5);
  py.add(5);
}

void draw(){
  background(127);
  for (int i = 0; i < w; i++) line(i*size, 0, i*size, height);
  for(int i = 0; i < h; i++) line(0, i*size, width, i*size);
  for(int i = 0; i< px.size(); i++){
    fill(#DEAB3C);
    rect(px.get(i)*size, py.get(i)*size, size, size);
  }
  if(!dead){
  fill(255, 0, 0);
  rect(fx*size, fy*size, size, size);
  
  if(frameCount%5 == 0){
      px.add(0, px.get(0) + dx[dir]);
      py.add(0, py.get(0) + dy[dir]);
      if(px.get(0) < 0 || py.get(0) < 0 || px.get(0) >= w || py.get(0) >= h) dead = true;
      for(int i = 1; i < px.size(); i++) if(px.get(0) == px.get(i) && py.get(0) == py.get(i)) dead = true;
      if(px.get(0) == fx && py.get(0) == fy){
        fx = (int)random(0, w);
        fy = (int)random(0, h);
      }else{
        px.remove(px.size()-1);
        py.remove(py.size()-1);      
      }
    }
  }else{
    fill(0);
    textSize(30);
    text("GAME OVER. Press Space", width/4, height/2);
    if(keyCode == ' '){
      px.clear();
      py.clear();
      px.add(5);
      py.add(5);
      dead = false;
    }
  }
}

void keyPressed(){
    int newdir = keyCode == DOWN ? 0 : (keyCode == UP ? 1 : (keyCode == RIGHT ? 2 : (keyCode == LEFT ? 3 : -1)));
    if(newdir != -1 && (px.size() <= 1 || !(px.get(1) == px.get(0) + dx[newdir] && py.get(1) == py.get(0) + dy[newdir]))) dir = newdir;
}
