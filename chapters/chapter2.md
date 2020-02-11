---
title: 'Chapter 2: Data Structures'
description:
  'Understand how to organizing data so that it can be used effectively. '
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---


<exercise id="1" title="General Information">

In this chapter we will consider an introduction to Data Structure with `R`

</exercise>


<exercise id="2" title="Introduction to vectors" type = "slides">

<slides source="chapter2_01"> 
</slides>



</exercise>

<exercise id="3" title="Introduction to vectors">

Multiple Choice: Guess the value of `d`:
  
```r
a = c(1,2,3)
b = c(4,5)
d = c(a,b,a)
```

<choice id="1">
<opt text=" [1] ">
`[1] "a" "b" "a"` over five, indicating it is nonlinear."
</opt>
<opt text="length" >
``[1] "a" "b" "a"`.
</opt>
<opt text="price" correct="true">
Correct! `price` is significant (p <0.05) and linear (`edf` near 1).
</opt>
<opt text="rpm">
`s(rpm)` has `edf` over five, indicating it is nonlinear.
</opt>
<opt text="width">
`s(width)` has a `p-value` over 0.05 and no stars, indicating it is not significant.
</opt>
</choice>

</exercise>
