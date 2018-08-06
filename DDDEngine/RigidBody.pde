class RigidBody {
  boolean isKinematic;
  boolean useGravity;
  PVector colliderA; //colliderA and colliderB are RELATIVE to position. They are two points of the collider rectangle
  PVector colliderB;
  PVector position;
  PVector velocity;
  PVector dimensions;
  float mass;
  RigidBody(boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass){
      this.isKinematic = isKinematic;
      this.useGravity = useGravity;
      this.colliderA = colliderA;
      this.colliderB = colliderB;
      this.position = position;
      this.velocity = velocity;
      this.mass = mass;
      this.dimensions = new PVector(colliderA.x-colliderB.x, colliderA.y - colliderB.y);
  
  }
}
