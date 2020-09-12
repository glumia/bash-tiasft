# TODOs

- Consider rewrite in C or other better performing language of the alias 
  search algorithm. The bash implementation is really slow and the performance
  hit is noticeable and grows exponentially with command's length and number
  of defined aliases.

- Make the algorithm smarter, the result should not depend on the order of
  command's options.
