Array.prototype.uniq = function() {

    let output = [];

    this.forEach((ele)=>{
        if (!output.includes(ele)) {
            output.push(ele);
        }
    });

    return output;
};
[1,2,2,3,3,4].uniq()

array1 = [1,2,2,3,3,4];
// console.log(array1.uniq());



Array.prototype.twoSum = function() {
    let output = [];

    for(let i = 0; i < this.length; i++) {
        for(let j = 0; j < this.length; j++) {
            if ((this[i] + this[j] === 0) && (i > j)) {
                output.push([i,j]);
            }
        };
    };
    return output;
};

array2 = [3,-3,4,2,-2]
// console.log(array2.twoSum());


// [
//     [1,4,7],
//     [2,5,8],
//     [3,6,9]
// ]

Array.prototype.transpose = function() {
    let output = [];
    for(let i = 0; i < this.length; i++) {
        let inner = [];
        for (let j = 0; j < this.length; j++) {
            inner.push(this[j][i]);
        }
        output.push(inner);
    }
    return output;
};

arrays = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

console.log(arrays.transpose())
console.log(arrays)