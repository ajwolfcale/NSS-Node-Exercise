'use strict';

const { assert: { isFunction, isNotNaN, oneOf, isString } } = require('chai');
const { roll, toDiceNotation } = require('../lib/dice.js');

describe('dice module', () => {
    describe("toDiceNotation", () => {
        it('should be a function', () => {
            isFunction(toDiceNotation);
        });
        it('should return a string', () => {
            isString(toDiceNotation({count: 4, sides: 4}));
        });
    });
    describe("roll", () => {
        it('should be a function', () => {
           isFunction(roll); 
        });
        // should return a number
        it('should return a number', () => {
            let result = roll("2d20");
            isNotNaN(result);
        });
        it('should accept a string and return a computed number', () => {
            for(let i = 1; i < 10; i++){
                let diceNotation = `${i}d6`;
                oneOf(roll(diceNotation), Array.from(Array(61).keys()));
            }
        });
    });
});