function sort(str) {
  // sort the characters in ‘str’ in alphabetical order
      let strArray = str.split("")
      console.log(strArray);
      strArray.sort()
      let sortedStr = strArray.join("")
  // and return the sorted string
      return sortedStr
  }

console.log(sort("webmaster"))