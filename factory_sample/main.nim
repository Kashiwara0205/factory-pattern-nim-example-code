type AnimalKind {.pure.} = enum
  DOG, CAT, BIRD

type Animal = ref object of RootObj
  name: string
  kind: AnimalKind

method getKind(animal: Animal): string {.base.} = "ANIMAL"

type Dog = ref object of Animal
method getKind(dog: Dog): string = "DOG"

type Cat = ref object of Animal
method getKind(cat: Cat): string = "CAT"

type Bird = ref object of Animal
method getKind(bird: Bird): string = "BIRD"

type AnimalFactory = object
func create*(factory: AnimalFactory, kind: AnimalKind): Animal = 
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