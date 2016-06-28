var lodash = require("lodash")
var fs = require("fs")
var parser = require("./grammerParser.js").parser
var fileContent = fs.readFileSync("./test", 'utf8')
var fileJson = parser.parse(fileContent)

var uniqByProperty = function(property){
    return function(element){
        return element[property]
    }
}

var nouns = lodash.uniqBy(lodash.map(fileJson, uniqByProperty("noun")))
var verbs = lodash.uniqBy(lodash.map(fileJson, uniqByProperty("verb")))
// var likes = lodash.filter(fileJson, function(element){
//     return element["verb"] == "likes"
// })

// var likesForRam = lodash.uniqBy(lodash.map(likes, uniqByProperty("object")))
// console.log(likesForRam)

console.log(fileJson)