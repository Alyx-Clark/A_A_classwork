Array.prototype.myEach = function(callback) {
    for(let i = 0; i < this.length; i++) {
        callback(this[i]);
    };
};

// array = [1,2,3];
// console.log(array.myEach((ele) => ele * 2))




Array.prototype.myMap = function(callback) {
    let output = [];
    this.myEach((ele) => output.push(callback(ele)));
    
    return output;
};

// array = [1,2,3];
// console.log(array.myMap((ele) => ele * 5));


Array.prototype.myReduce = function(callback, acc) {
    if (acc) {
        this.myEach(function(ele) {
            // debugger
            acc += (callback(ele))
            });
    } else {
        acc = this[0];
        this.shift()
        this.myEach((ele) => {acc += (callback(ele))});
    }
    return acc;
}

array = [1,2,3]

console.log(array.myReduce(((ele) => ele), 25))


