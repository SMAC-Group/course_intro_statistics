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

<exercise id="3" title="Introduction to vectors: Exercises">

### Guess the value of `d`:

```r
a = c(1,2,3)
b = c(4,5)
d = c(a,b,a)
```


<choice id="1">
<opt text="<code>[1] 1 2 3 4 5</code>" >
</opt>
<opt text="<code>[1] 4 5 1 2 3 4 5</code>" >
</opt>
<opt text="<code>[1] 1 2 3 4 5 1 2 3</code>" correct="true">
</opt>
</choice>


### Subset the elements 1, 2, 4 and 5 of the vector `x`:

<codeblock id="01_01">
To select with positive indices, you can simply use: <code>x[c(1, 2, 4, 5)]</code>
</codeblock>

### Find an easier way to subset `x`:

<codeblock id="01_02">
Try to decompose the problem... First, try to understand what is <code>x[c(1, 2, 4, 6)]</code>, then, <code>x[c(1, 2, 4, 6)][-2]</code> and so on.
</codeblock>


</exercise>

<exercise id="4" title="Attributes, simple functions applied to vectors and sequences" type = "slides">

<slides source="chapter2_03">
</slides>

</exercise>


<exercise id="5" title="Attributes, simple functions applied to vectors and sequences: Exercises">

</exercise>



<exercise id="6" title="Matrices, Lists and DataFrames" type = "slides">
<slides source="chapter2_05">
</slides>

</exercise>

<exercise id="7" title="Matrices, Lists and DataFrames: Exercises">

</exercise>
