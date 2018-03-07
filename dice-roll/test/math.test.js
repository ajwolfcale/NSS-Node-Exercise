const { assert: {isFunction, isNumber, isNotNaN}} = require('chai');
const { randomInt } = require('../lib/math.js');
describe('randomInt', () => {
    describe('randomInt is a function', () => {
        it('should exist', () => {
            isFunction(randomInt);
        })
        it("should return a number", () =>{
            isFunction(randomInt(1, 6));
            isNumber(randomInt("fred", 6));
            isNotNaN(randomInt("fred", 6));
            for (let i = 0; i < 1000; i++) {
            oneOf( randomInt(1, 6), [1,2,3,4,5,6])
            }
        })
    });
});