


// Function.prototype.inherits1 = function(parent) {
//     // const child = this;
//     function Surrogate () {}
//     Surrogate.prototype = parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };
// Function.prototype.inherits1 = function (ParentClass) {
//     function Surrogate () {}
//     Surrogate.prototype = ParentClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
//   };
// inherits(Animal);

Function.prototype.inherits1 = function (ParentClass) {
    this.prototype = Object.create(ParentClass.prototype);
    this.prototype.constructor = this;
}

function MovingObject() {}

function Ship(){};
Ship.inherits1(MovingObject);

function Asteroid(){};
Asteroid.inherits1(MovingObject);

const titanic = new Ship();
const iceberg = new Asteroid();

Asteroid.prototype.floats = function(){
    console.log("i am an asteroid");
}

const ball = new MovingObject();

iceberg.floats() // should print i am an asteroid
// ball.floats() // should be error
// titanic.floats() // s/b error

console.log(Asteroid.prototype instanceof MovingObject)
console.log(Ship.prototype instanceof MovingObject)

