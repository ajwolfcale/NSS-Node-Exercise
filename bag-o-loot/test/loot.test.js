const { createTables } = require('../js/makeTable');
const { getKidsLoot, addKid, getSingleKid } = require ('../js/lootBag');
const { assert: {equal, isFunction, isObject, isArray, containsAllKeys} } = require('chai');

describe('first test', () => {
    it('should be equal', () => {
        equal(9, 6+3);
    });
});

describe('lootBag', () => {
    describe("get kid's loot", () => {
        it('should be a function', () => {
            isFunction(getKidsLoot);
        });
        it('should return an array of kids', () => {
            isArray(getKidsLoot());
        });
        it('should return a single kid', () => {
            return getSingleKid(11)
            .then((result) => {
                isObject(result);
            });
        });
    });
});

describe('adding a kid', () => {
    let newKid = {
        firstName: "Camryn",
        toy: "fidget spinner",
        delivered: "true",
        naughty: "false"
        };

    beforeEach( (done) => {
        createTables()
        .then( () => {
            done();
        })
    });

    it('should return an object', () => {
        return addKid(newKid)
        .then( (data) => {
            isObject(data);
        });
    });
    it('should add a new item to the db', () => {
        return addKid(newKid)
        .then(obj => {
            equal(11, obj.id);
        });
    });
});
