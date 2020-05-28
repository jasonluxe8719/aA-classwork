
Array.prototype.myEach = function(callback) {
    for(let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

helper = function(el) {
    console.log(el);
}

// console.log([1, 2, 3].myEach(helper));

Array.prototype.myMap = function(callback) {
    let newArr = [];

   this.myEach(el => {
        newArr.push(callback(el));
   });

   return newArr;
        
}

two = function(ele) {
    return (ele*2);
}

// console.log([1,2,3].myMap(two));

// el => is the same thing as function(el)

Array.prototype.myReduce = function(callback, initialValue) {
    let arr = this;
    let acc = this[0];

    if(initialValue) {
        acc = initialValue;
    } else {
        arr = this.slice(1);
    }

    arr.myEach(el => {
        acc = callback(acc, el)
    });

    return acc;
}

inject = function(acc, el) {
    return acc + el;
}
console.log([1, 2, 3].myReduce(inject, 25));  