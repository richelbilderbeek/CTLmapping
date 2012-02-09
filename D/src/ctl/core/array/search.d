/**********************************************************************
 * src/ctl/core/array/search.d
 *
 * copyright (c) 2012 Danny Arends
 * last modified Feb, 2012
 * first written May, 2011
 **********************************************************************/
module ctl.core.array.search;

import std.math;

pure auto getIndex(T)(T[] haystack, T needle){
  foreach(size_t cnt, T s; haystack){
    if(s>=needle) return cnt;
  }
  return haystack.length;
}

pure bool searchArray(T)(T[] haystack, T needle){
  foreach(T s; haystack){
    if(s==needle) return true;
  }
  return false;
}

pure bool searchArrayBinary(T)(T[] haystack, T needle) {
  uint first = 0;
  uint last = (haystack.length-1);
  while (first <= last) {
    if(last==first) return (needle==haystack[first]);
    uint mid = (first + last) / 2;
    if (needle > haystack[mid]){
      first = mid + 1;
    }else if (needle < haystack[mid]){
      last = mid - 1;
    }else{
      return true;
    }
  }
  return false;
}
