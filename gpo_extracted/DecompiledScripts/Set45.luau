local v0 = {
    add = require(script.add), 
    copy = require(script.copy), 
    count = require(script.count), 
    delete = require(script.delete), 
    filter = require(script.filter), 
    fromArray = require(script.fromArray), 
    has = require(script.has), 
    intersection = require(script.intersection), 
    isSubset = require(script.isSubset), 
    isSuperset = require(script.isSuperset), 
    map = require(script.map), 
    merge = require(script.merge), 
    toArray = require(script.toArray)
};
v0.fromList = v0.fromArray;
v0.join = v0.merge;
v0.subtract = v0.delete;
v0.union = v0.merge;
return v0;