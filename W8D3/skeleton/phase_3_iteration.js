
Array.prototype.bubbleSort = function() {
    let sorted = false;

    while(!sorted) {
        sorted = true;
        for(let i = 0; i < this.length - 1; i++) {
            if(this[i] > this[i + 1]) {
                // let a = this[i + 1];
                // this[i + 1] = this[i];
                // this[i] = a;
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }

    return this;
}

console.log([5,2,4,7,9,1].bubbleSort());

String.prototype.subStrings = function() {
    let subs = [];
    for(let i=0; i<this.length-1; i++) {
        for(let j=0; j<this.length; j++) {
           let sub = this.slice(i,j+1);
            if((j>i) && !subs.includes(sub)) {
                subs.push(sub)
            }
        }
    }
    return subs;
}
console.log("jason".subStrings());