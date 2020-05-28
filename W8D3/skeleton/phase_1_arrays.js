
Array.prototype.uniq = function() {
    let new_arr = [];

    this.forEach(el => {
        if (!new_arr.includes(el)) {
            new_arr.push(el);
        }
    });

    return new_arr;    
}

// console.log([1,2,2,3,3,3].uniq());
Array.prototype.twoSum = function() {
    let newArr=[];
    for(let i = 0; i<this.length-1; i++) {
        for(let j = i+1; j<this.length; j++) {
            if (this[i]+this[j] === 0) {   newArr.push([i,j]) }

        }

    }
    return newArr;


}

// console.log([1,2,-1,-2,3,-1].twoSum());

Array.prototype.transpose = function() {
    let transposed = [];

    for(let i = 0; i < this.length; i++) {
        let new_row = [];
        for(let j = 0; j < this.length; j++) {
            new_row.push(this[j][i]);
        }
        transposed.push(new_row);
    }
    return transposed;
}

// console.log(
// [[0, 1, 2],
//  [3, 4, 5],
//  [6, 7, 8]
// ].transpose());



    
