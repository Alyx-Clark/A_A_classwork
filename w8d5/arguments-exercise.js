// function sum(...args) {
//     // let result = 0;
//     // args.forEach(function(ele) {
//     //     result += ele;
//     // })
    
//     // return result;
//     return args.reduce((acc, el) => acc + el);
// }

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));



class Cat {
    constructor(name) {
        this.name = name;
    }
    
    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

Function.prototype.myBind = function(context, ...bindArgs){
    const that = this;
    return function(...callArgs){ // this is not necessarily a CB but can be used as one
        return that.apply(context, bindArgs.concat(callArgs)); // #apply(context, [array of add'l args]) A:apply:array
    };
}

// Function.prototype.myBind = function(context, b1, b2) {
//     const that = this;
//     return function() {
//         return that.call(context, b1, b2);
//     };
// }
  
  // bind time args are "meow" and "Kush", no call time args
//   markov.says.myBind(pavlov, "meow", "Kush")();
  // Pavlov says meow to Kush!
  // true

//   Function.prototype.myBind = function(context) {
//     const that = this;
//     return function(b1, b2) {
//         return that.call(context, b1, b2);
//     };
// }

//   no bind time args (other than context), call time args are "meow" and "a tree"
//   markov.says.myBind(pavlov)("meow", "a tree");
//   Pavlov says meow to a tree!
//   true

// Function.prototype.myBind = function(context, b1) {
//     const that = this;
//     return function(b2) {
//         return that.call(context, b1, b2);
//     };
// }

//   bind time arg is "meow", call time arg is "Markov"
//   markov.says.myBind(pavlov, "meow")("Markov");
//   // Pavlov says meow to Markov!
//   // true
  
// Function.prototype.myBind = function(context) {
//     const that = this;
//     return function(b1, b2) {
//         return that.call(context, b1, b2);
//     };
// }

//   // no bind time args (other than context), call time args are "meow" and "me"
  const notMarkovSays = markov.says.myBind(pavlov); // #myBind returns new func that has context bound to pavlov
  notMarkovSays("meow", "me");
//   // Pavlov says meow to me!
//   // true




function curriedSum(numArgs){
    const args = [];
    return function _curriedSum(n){
        args.push(n);
        // debugger
        if(args.length === numArgs){
            // debugger
            return args.reduce((acc, el) => acc + el);
        } else {
            //  debugger
            return _curriedSum;
            //  return 'numArgs not yet reached';
        }
    }
}

// const sum = curriedSum(4);
// console.log(sum(5)); // => _curriedSum
// console.log(sum(30)); // => _curriedSum
// console.log(sum(20)); // => _curriedSum
// console.log(sum(1)); // => 56


// this version uses that = this
// Function.prototype.curry = function(numArgs) {
//     const args = [];
//     const that = this;
//     debugger
//     return function(n) {
//         debugger // why can't we access that from in here?
//         args.push(n);
//         if(args.length === numArgs) {
//             debugger
//             return that();
//         } else {
//             debugger
//         }
//     };
// }


// Function.prototype.curry = function(numArgs) {
//     const args = [];
//     debugger
//     return function _curry(n) {
//         debugger // why can't we access that from in here?
//         args.push(n);
//         if(args.length === numArgs) {
//             debugger
//             return this();
//         } else {
//             debugger
//             return 'not reached numArgs yet'
//         }
//     };
//     // return _curry.apply(this);
// }

// const tester = () => console.log('you reached the end!');
// const test = tester.curry(3);
// console.log(test.apply(tester,[1,]));
// console.log(test.apply(tester,[1]));
// console.log(test.apply(tester,[1]));

Function.prototype.curry = function(numArgs, ...m) {
    const args = [];
    // debugger
    return function _curry(...n) {
        // debugger 
        let arr = m.concat(n);
        arr.forEach(function(el) {
            args.push(el);
        });

        if(args.length === numArgs) {
            // debugger
            return this();
        } else {
            // debugger
            return 'not reached numArgs yet'
        }
    };
}

const tester = () => 'you reached the end!';

// const test = tester.curry(3);
// console.log(test.call(tester, 1, 1, 1));

const test2 = tester.curry(3, 1);
console.log(test2.call(tester, 1 , 1));