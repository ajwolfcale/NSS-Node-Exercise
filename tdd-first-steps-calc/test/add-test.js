const { add } = require ('../js/add');
const { assert: { isFunction, isNumber } = require('chai');

describe('add', () => {
    it('should be a function', () => {
      isFunction(add);
    });
  });

