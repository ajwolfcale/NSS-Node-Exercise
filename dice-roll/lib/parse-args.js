'use strict';

module.exports = ([num, sides]) => {
  const dieNums = {};
  dieNums.count = sides ? num : 1;
  dieNums.sides = sides || num || 6;

  return dieNums
}