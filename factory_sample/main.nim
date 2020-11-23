type AnimalName {.pure.} = enum
 DOG, CAT, BIRD

type Animal = ref object of RootObj
  name: string
  kind: string

method getKind(animal: Animal): string {.base.} = return animal.kind

type Dog = ref object of Animal
method getKind(dog: Dog): string = 
  echo "[ dog.getKind ]"
  return dog.kind

type Cat = ref object of Animal
method getKind(cat: Cat): string = 
  echo "[ cat.getKind ]"
  return cat.kind

type Bird = ref object of Animal
method getKind(bird: Bird): string = 
  echo "[ bird.getKind ]"
  return bird.kind

type AnimalFactory = object
proc create*(factory: AnimalFactory, kind: AnimalName): Animal = 
  case kind
    of AnimalName.DOG: return Dog(name: "xxx", kind: "dog")
    of AnimalName.CAT: return Cat(name: "ooo", kind: "cat")
    of AnimalName.BIRD: return Bird(name: "iii", kind: "bird")

let factory = AnimalFactory()

let dog = factory.create(AnimalName.DOG)
echo dog.getKind()

let cat = factory.create(AnimalName.CAT)
echo cat.getKind()

let bird = factory.create(AnimalName.BIRD)
echo bird.getKind()