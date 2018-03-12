'use strict';

const { assert: { isFunction, isObject } } = require('chai');
const args = require('../lib/parse-args.js');

describe("args", () => {
    it('should exist', () => {
        isFunction(args);
    });
    it('should return an object', () => {   
        isObject(args([2, 2]));
    });
  });