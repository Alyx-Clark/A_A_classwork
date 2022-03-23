Array.prototype.bubbleSort = function() {

    let sorted = false;
    while(sorted === false) {
        sorted = true;
        for(let i = 0; i < this.length-1; i++){
            debugger
            if (this[i] > this[i+1]) {
                debugger
                [this[i], this[i+1]] = [this[i+1], this[i]];
                sorted = false;
            }
        };
    };
    return this;

};


array = [4,7,5,8,3];
console.log(array.bubbleSort());