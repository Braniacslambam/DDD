// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();
Renderer renderer = new Renderer();

void setup(){
  //fullScreen();
  fullScreen();
  background(0);


  PVector[] vectors = new PVector[24];
  vectors[0] = new PVector(1, 1, 1);
  vectors[1] = new PVector(2,1, 1);
  vectors[2] = new PVector(2, 2, 1);
  vectors[3] = new PVector(1, 2, 1);
  
  vectors[4] = new PVector(1, 1, 1);
  vectors[5] = new PVector(2, 1, 1);
  vectors[6] = new PVector(1, 1, 1.5);
  vectors[7] = new PVector(2,1, 1.5);
  
  vectors[8] = new PVector(1, 2, 1);
  vectors[9] = new PVector(2, 2, 1);
  vectors[10] = new PVector(1, 2, 1.5);
  vectors[11] = new PVector(2, 2, 1.5);
  
  vectors[12] = new PVector(1, 1, 1);
  vectors[13] = new PVector(1, 2, 1);
  vectors[14] = new PVector(1, 1, 1.5);
  vectors[15] = new PVector(1, 2, 1.5);
  
  vectors[16] = new PVector(2, 1, 1);
  vectors[17] = new PVector(2, 2, 1);
  vectors[18] = new PVector(2, 1, 1.5);
  vectors[19] = new PVector(2, 2, 1.5);
  
  vectors[20] = new PVector(1, 1, 1.5); 
  vectors[21] = new PVector(2, 1, 1.5);
  vectors[22] = new PVector(2, 2, 1.5);
  vectors[23] = new PVector(1, 2, 1.5);
  
  objects.put("Enemy", new Object(null, false, true, new PVector(), new PVector(5, 5, 5), new PVector(20f, 20f, 15f), new PVector(0, 0), 5, vectors));
  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(5, 5, 5), new PVector(27f, 20f, 1f), new PVector(0, 0), 5, null));
  objects.put("Pirate", new Object(null, true, false, new PVector(), new PVector(100, 5, 5), new PVector(20f, 200f, 15f), new PVector(0, 0), 5, vectors));

}

void draw(){
  clear();

  println("Player: ", objects.get("Player").rb.position);
  println("Enemy: ", objects.get("Enemy").rb.position);
  println("Pirate: ", objects.get("Pirate").rb.position);
  println("");

  background(0);  
  //objects = PhysicsEngine.SimulatePhysics(objects);
  renderer.render(objects);
  
  for(String k : objects.keySet())
    objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : color(0, 255, 0)); 
}
