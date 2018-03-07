'use strict';

const { assert: { isFunction } } = require('chai');
const { roll, toDiceNotation } = require('../lib/dice.js');

describe('dice module', () => {
    describe("roll", () => {
        it('should be a function', () => {
           isFunction(roll); 
        });
    });

    // should return a number

});