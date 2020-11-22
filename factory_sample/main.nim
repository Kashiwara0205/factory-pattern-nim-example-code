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
proc createAnimal*(factory: AnimalFactory, kind: string): Animal = 
  case kind
    of "dog": return Dog(name: "xxx", kind: "dog")
    of "cat": return Cat(name: "ooo", kind: "cat")
    of "bird": return Bird(name: "iii", kind: "bird")
    else: discard

let factory = AnimalFactory()

let dog = createAnimal(factory, "dog")
echo dog.getKind()

let cat = createAnimal(factory, "cat")
echo cat.getKind()

let bird = createAnimal(factory, "bird")
echo bird.getKind()