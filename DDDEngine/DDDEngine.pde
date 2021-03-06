HashMap<String, Object> objects = new HashMap<String, Object>();

HashMap<String, Object> scene0 = new HashMap<String, Object>();

HashMap<String, Object> scene1 = new HashMap<String, Object>();

HashMap<String, Object> scene3 = new HashMap<String, Object>();

HashMap<String, Object> scene4 = new HashMap<String, Object>();

Scene[] scenes;
SceneManager sm;

Renderer renderer = new Renderer();
PhysicsEngine pe = new PhysicsEngine();
Platformer plat;

void setup(){
  fullScreen();
  //size(1200, 700);
  background(255);

  scene1.put("Enemy", new Object("", false, true , true, new PVector(0, 0, 0), new PVector(200, 200, 200), new PVector(width/2, 200f, 50f), new PVector(0, 0), 5, 1));
  scene1.put("Enemy3", new Object("", false, false , true, new PVector(0, 0, 0), new PVector(200, 200, 200), new PVector(width/2, -100f, 50f), new PVector(0, 0), 5, 1));
  scene1.put("Player", new Object("./Images/fiend.png", true, true, true, new PVector(0, 0, 0), new PVector(200, 200, 10), new PVector(width/2, 200f, 1f), new PVector(0, 0), 5, 0.2));

  scene1.put("Enemy2", new Object("", false, true , true, new PVector(0, 0, 0), new PVector(200, 200, 200), new PVector(width/2, 200f, 1000f), new PVector(0, 0), 5, 0.8));
  scene1.put("Floor", new Object("", false, true , true, new PVector(0, 0, 0), new PVector(width, 200, width), new PVector(0, height-10, 0), new PVector(0, 0), 5, 0.8));
  
  scene0.put("Enemy", new Object("", false, false, true, new PVector(), new PVector(20, 20, 20), new PVector(70f, 0f, 10f), new PVector(0, 0), 5, .8));
  scene0.put("Player", new Object("./Images/fiend.png", false, false, false, new PVector(), new PVector(20, 20, 20), new PVector(60f, 50f, 10f), new PVector(0, 0), 5, 1));
  scene0.put("Pirate", new Object("", true, true, false, new PVector(), new PVector(990, 100, 30), new PVector(20f, 600f, 10f), new PVector(0, 0), 5, 1));

  scene3.put("wall", new Object("", true, true, false, new PVector(), new PVector(20, 100, 20), new PVector(700, 300, 10), new PVector(0, 0), 5, 1));
  scene3.put("ball", new Object("", true, false, true, new PVector(), new PVector(20, 20, 20), new PVector(mouseX, mouseY, 10), new PVector(random(5, 20), 0), 5, 1));
  scene3.put("Pirate", new Object("", true, true, false, new PVector(), new PVector(990, 100, 30), new PVector(20f, 600f, 10f), new PVector(0, 0), 5, 1));
  scene3.put("target", new Object("", true, false, false, new PVector(), new PVector(20, 20, 20), new PVector(800, 350, 10), new PVector(0, 0), 5, 1));
  
  for(int i = 0; i < 20; i++){
    scene4.put("Enemy" + String.valueOf(i), new Object("", false, false, false, new PVector(), new PVector(20, 20, 20), new PVector(random(0, 1200), random(0, 700), 10f), new PVector(0, 0), 5, .8));

  }
    scene4.put("Player", new Object("./Images/fiend.png", false, false, false, new PVector(), new PVector(20, 20, 20), new PVector(60f, 50f, 10f), new PVector(0, 0), 5, 1));
  
  
  
  
  plat = new Platformer();
  plat.start();
  HashMap<String, Object> scene2 = plat.scene3;
  
  scenes = new Scene[]{
    new Scene(scene0),
    new Scene(scene1),
    new Scene(scene2),
    new Scene(scene3),
    new Scene(scene4)
  };
  sm = new SceneManager(scenes);
  }

void keyPressed(){
  Object player = objects.get("Player");
  Scene s = sm.switchSceneWithKey(key);
  if(s != null){
    objects = s.objects;
  }

  if(sm.loadedScene == 0 && key == 'q'){
    objects.put(String.valueOf(random(0, 10000)), new Object("", false, false, true, new PVector(), new PVector(20, 20, 20), new PVector(mouseX, mouseY, 10), new PVector(0, 0), 5, 1));
  }
  if(sm.loadedScene == 0 && key == 'w'){
    objects.put(String.valueOf(random(0, 10000)), new Object("", false, false, false, new PVector(), new PVector(20, 20, 20), new PVector(mouseX, mouseY, 10f), new PVector(0, 0), 5, 1));
  }
  if(sm.loadedScene == 2){
    float x = 0;
    float y = 0;
    float z = 0;
    if(key == 'd'){
      x = 1.0;
    }
    else if(key == 'a'){
      x = -1.0;
    }
    else if(key == 'w'){
      y = 1.0;
    }
    else if(key == 'q'){
      z = -1.0;
    }
    else if(key == 'e'){
      z = 1.0;
    }
    plat.input(x, y, z);
  }
  if(sm.loadedScene == 1){
    if(key == 'w'){
      player.rb.position.z -= 10;
    }
    else if(key == 's'){
      player.rb.position.z += 10;
    }
    else if(key == 'a'){
      player.rb.position.x -= 10;
    }
    else if(key == 'd'){
      player.rb.position.x += 10;
    }

  }
}

void mousePressed(){
  if(sm.loadedScene == 3){
    objects.put(String.valueOf(random(0, 100000)), new Object("", true, false, true, new PVector(), new PVector(20, 20, 20), new PVector(0, mouseY, 10), new PVector(mouseX / 50, 5), 5, 1));

  }
}

void draw(){
  clear();

  background(sm.loadedScene == 4 ? 0 : 255);  
  noFill();
  if(sm.loadedScene == -1)
    objects = new HashMap<String, Object>();;
  if(sm.loadedScene == 2){
    background(0);
    objects = plat.scene3;
    if(plat.player.rb.position.y > height){
      sm.loadedScene = -1;
      plat = new Platformer();
      plat.start();
    }
  }
  objects = pe.SimulatePhysics(objects);
  
  if(sm.loadedScene == 1 || sm.loadedScene == 2){
    Object player = objects.get("Player");
    if(player != null){
      player.rotation = new PVector(map(mouseX, 0, width, 0, 180), map(mouseY, 0, height, 0, 180));
    }
    renderer.render(objects);
  }
  
  final String instructions = "Press keys 0 - 4 to select game\n0: Trampoline\n1: 3D Demonstration\n2: Platformer\n3: Ball Cannon\n4: Space Rocket";
  final String[] gameInstructions = {
    "Press Q for a new gravity ball, W for an antigravity ball",
    "Use WASD to move camera",
    "Use WASD to move. Use Q and E to change Z axis position (forward and backward)",
    "Click to shoot balls. Use mouse position to aim!",
    "Control the rocket with WASD."
  };
  
  textSize(12);
  fill(0, 100, 255);
  text(instructions, 10, 60);
  textSize(20);
  fill(0, 0, 255);
  if(sm.loadedScene >= 0)
    text(gameInstructions[sm.loadedScene], 10, 40);
    
  if(sm.loadedScene == 0){
    RigidBody playerRB = objects.get("Player").rb;
    playerRB.velocity.x += (playerRB.position.x < mouseX ? .05 : -.05);
    playerRB.velocity.y += (playerRB.position.y < mouseY ? .05 : -.05);
  }
  
  Object player = objects.get("Player");
  if(sm.loadedScene == 2){
    plat.update();
  }
  if(player != null){
    player.rotation = new PVector(map(mouseX, 0, width, -180/10, 180/10), map(mouseY, 0, height, -180, 180));
  }
  
  
  
  if(keyPressed && sm.loadedScene == 4){
    RigidBody playerRB = objects.get("Player").rb;
    if(key == 'w')
          playerRB.velocity.y -= .08;
    if(key == 's')
      playerRB.velocity.y += .08;
      
    if(key == 'a')
      playerRB.velocity.x -= .08;
    if(key == 'd')
      playerRB.velocity.x += .08;
  }
  
  if(sm.loadedScene == 0 || sm.loadedScene == 3 || sm.loadedScene == 4){
      for(String k : objects.keySet()){
      objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : (k.contains("target") ? color(0, 0, 255) : color(0, 255, 0))); 
    }
  }

}
