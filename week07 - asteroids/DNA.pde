class DNA {

  PVector[] genes;

  DNA() {
    genes = new PVector[lifeSpan];

    //gives random values to the genes
    //if no parameter is passed
    for (int i = 0; i < genes.length; i++) {
      genes[i] = PVector.random2D();
      genes[i].setMag(0.1);
    }
  }

  DNA(PVector[] newGenes) {
    //sets the old aray to the new parameter
    genes = newGenes;
  }

  //mix method
  //mixes the dna of the two parents by
  //splicing them into the child's dna
  DNA mix(DNA other) {
    PVector[] temp = new PVector[lifeSpan];
    for (int i = 0; i < genes.length; i++) {
      //selects a random number from 1 to 100
      int rand = (int)random(100);
      //if its even take from this parent
      //else take from the other
      if (rand % 2 == 0) {
        temp[i] = this.genes[i];
      } else {
        temp[i] = other.genes[i];
      }
    }
    //returns the reconstructed DNA sequence
    return new DNA(temp);
  }

  void mutation(int percent) {
    //selects random from  to 100
    for (int i = 0; i < genes.length; i++) {
      float num = random(100);
      if (num < percent) {
        genes[i] = PVector.random2D();
        genes[i].setMag(0.1);
      }
    }
  }
}
