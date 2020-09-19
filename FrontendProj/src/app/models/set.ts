export class Set {
  private number: number;
  private weight?: number;
  private reps?: number;

  constructor(number: number, weight?: number, reps?: number) {
    this.number = number;
    this.weight = weight;
    this.reps = reps;
  }

  // setter

  public setWeight(weight: number): void {
    this.weight = weight;
  }

  public setReps(reps: number): void {
    this.reps = reps;
  }

  // getter

  public getNumber(): number {
    return this.number;
  }

  public getWeight(): number | undefined {
    return this.weight;
  }

  public getReps(): number | undefined {
    return this.reps;
  }
}
