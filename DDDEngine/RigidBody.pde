class RigidBody {
  boolean isKinematic;
  boolean useGravity;
  PVector colliderA; //colliderA and colliderB are RELATIVE to position. They are the leastmost and greatest points on the collision rectangle
  PVector colliderB;
  PVector position;
  PVector velocity;
  PVector dimensions;
  float mass;
  float bounciness;
  RigidBody(boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass, float bounciness){
      this.isKinematic = isKinematic;
      this.useGravity = useGravity;
      this.colliderA = colliderA;
      this.colliderB = colliderB;
      this.position = position;
      this.velocity = velocity;
      this.mass = mass;
      this.dimensions = this.colliderB;
      this.bounciness = bounciness;
  }
  
  void RenderHitbox(color c){
    fill(c);
    
    //Use the line below for Z-axis visualization
    //PVector dims = new PVector(dimensions.x / constrain(position.z / 30f, 1f/30f, 30f), dimensions.y / constrain(position.z / 30f, 1f/30f, 30f));
    //Use the line below for no Z-azis visualization
    PVector dims = dimensions;
    rect(colliderA.x + position.x, colliderA.y + position.y, dims.x, dims.y);
  }
  
  RigidBody DeepCopy(){
    return new RigidBody(isKinematic, useGravity, colliderA.copy(), colliderB.copy(), position.copy(), velocity.copy(), mass, bounciness);
  }
}
