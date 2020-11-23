type AnimalKind {.pure.} = enum
  DOG, CAT, BIRD

type Animal = ref object of RootObj
  name: string
  kind: AnimalKind

method getKind(animal: Animal): string {.base.} = return "ANIMAL"

type Dog = ref object of Animal
method getKind(dog: Dog): string = 
  return "DOG"

type Cat = ref object of Animal
method getKind(cat: Cat): string = 
  return "CAT"

type Bird = ref object of Animal
method getKind(bird: Bird): string = 
  return "BIRD"

type AnimalFactory = object
proc create*(factory: AnimalFactory, kind: AnimalKind): Animal = 
  case kind
    of AnimalKind.DOG: return Dog(name: "xxx", kind: kind)
    of AnimalKind.CAT: return Cat(name: "ooo", kind: kind)
    of AnimalKind.BIRD: return Bird(name: "iii", kind: kind)

let factory = AnimalFactory()

let dog = factory.create(AnimalKind.DOG)
echo dog.getKind()

let cat = factory.create(AnimalKind.CAT)
echo cat.getKind()

let bird = factory.create(AnimalKind.BIRD)
echo bird.getKind()