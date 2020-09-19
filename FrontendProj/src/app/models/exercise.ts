import { Set } from './set';

export class Exercise {
  private id?: string;
  private name?: string;
  private musclegroups: string[];
  private sets: Set[];
  constructor(
    id?: string,
    name?: string,
    musclegroups?: string[],
    sets?: Set[]
  ) {
    this.id = id;
    this.name = name;
    this.musclegroups = musclegroups || [];
    this.sets = sets || [];
  }

  // setter

  public setID(id: string): void {
    this.id = id;
  }

  public setName(name: string): void {
    this.name = name;
  }

  public setMusclegroups(musclegroups: string[]): void {
    this.musclegroups = musclegroups;
  }

  public addMusclegroup(group: string): void {
    this.musclegroups.push(group);
  }

  public removeMusclegroup(group: string): void {
    this.musclegroups.splice(this.musclegroups.indexOf(group), 1);
  }

  public setSets(sets: Set[]): void {
    this.sets = sets;
  }

  public addSet(set: Set): void {
    this.sets.push(set);
  }

  public removeSet(set: Set): void {
    this.sets.splice(this.sets.indexOf(set), 1);
  }

  // getter

  public getID(): string | undefined {
    return this.id;
  }

  public getName(): string | undefined {
    return this.name;
  }

  public getMusclegroups(): string[] {
    return this.musclegroups;
  }

  public getSets(): Set[] {
    return this.sets;
  }
}
