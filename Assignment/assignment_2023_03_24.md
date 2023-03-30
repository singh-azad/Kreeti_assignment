# Question 1

Determine the highest normal form of this relation scheme.

The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade)
has the following functional dependencies:


StudentName, courseNo → grade
EnrollmentNo, courseNo → grade
StudentName → EnrollmentNo
EnrollmentNo → StudentName


## Answer

(CourseNo, StudentName)<sup>+</sup> -> `{ CourseNo, StudentName, EntrollmentNo, Grade }`

(CourseNo, EntrollmentNo)<sup>+</sup> -> `{ CourseNo, EntrollmentNo, StudentName, Grade }`

Candidate key = `{CourseNo, StudentName}, {CourseNo, EntrollmentNo}`

primary attribute = `CourseNo, StudentName, EntrollmentNo`

non-primary attribute = `Grade`

The relation is in **1NF** because there is no data given.

The relation is in **2NF** because it is in **1NF** and there is no **partial dependencies**.

The relation is in **3NF** because their is no transitive dependencies .There is
no non prime attribute which is dependent on another non prime attribute.

The relation is not in **BCNF** because in the funcitional dependencies
`StudentName -> EnrollmentNo` and `EnrollmentNo -> StudentName`
`StudentName` or `EnrollmentNo` are not a super key.

**The highest normal form is 3NF for this relation**

# Question 2

Suppose you are given a relation `R= (A, B, C, D, E )` with the following functional
dependencies:`{CE → D, D → B, C → A}`

a. Find all candidate keys.

b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a
new relation, decompose and re-compute the keys and the normal forms they satisfy.

## Answer

### a. 

CE<sup>+</sup> = `{C,E,D,B,A}`

Candidate key = `CE`

primary attribute = `C, E`

non-primary attribute = `A, B, D`

### b.
The relation is in **1NF**.

The relation is not in **2NF** because the fd `C -> A` has a partial
dependency i.e `C` is a subset of a candidate key `CE` and `A` is a non-prime
attribute.

As the reletion is not in **2NF** that's why it is not in any higher normal form.

### c.

We have the relation `R(A, B, C, D, E)` in **1NF**.

We can decompose it to `R1(B, C, D, E)` and `R2(C, A)` to make it in **2NF**.

We can clearly see that `R2(C, A)` is in **BCNF** with `FD: { C -> A }`
and `C` as the primary key.

`R1(B, C, D, E)` is in **2NF** and has `FD: { CE -> D, D -> B }` but not in **3NF**

We can further divide `R1` into `R3(C, D, E)` `FD: { CE -> D }` and `R4(B, D)` `FD: { D -> B }` to make it in **3NF**.

`R3(C, D, E)` is in **BCNF** because in FD `CE -> D`, `CE` is a candidate key

`R4(B, D)` is in **BCNF** because in FD `D -> B`, `D` is a candidate key for this
relation.

# Question 3

You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):

F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}

a. Find all keys of R based on these functional dependencies.

b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers.

## Answer

### a.

ABC<sup>+</sup> = `ABCDEF`

ACD<sup>+</sup> = `ACDFBE`

Candidate key = `ABC, ACD`

keys = `ABC, ACD, ABCD, ABCF, ABCE, ACDE, ACDF, ABCDE, ABCDF, ABCEF, ACDEF, ABCDEF`

primary attribute = `{ A, B, C, D }`

non-primary attribute = `{ E, F }`

### b.

The relation is not in **2NF** because in dependencie `ABD -> E`, There is a partial dependencie as part of the prime 
attribute is determining a non prime attribute.

That's why the relation is also not in **3NF** And **BCNF**

# Question 4

Write the advantages and disadvantages of normalization.

## Answer

The *advantages* are as follows:

i. Data redundancy is removed as a result of normalization.

ii. Normalization helps in maintaining consistency and avoiding anomalies
in a database.

The *disadvantages* are as follows:

i. For a large database, normalization can be a very complex task.

ii. For a normalized database, maintenance can be an issue as we get a large
number of normalized tables.

iii.There can be performence issue as we have to do joins with multipile table to get desired result.

# Question 5

Determine the decomposition.

Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.
Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅.

## Answer

S<sup>+</sup> = `STUV`

T<sup>+</sup> = `STUV`

U<sup>+</sup> = `STUV`

V<sup>+</sup> = `STUV`

All the attributes of the relation `R` are candidate keys.

We can perform lossless decomposition of the relation `R` into `R1(S, T, U)` 
and `R2(U, V)`. Clearly, `R1 ∩ R2 ≠ ∅` because `R1 ∩ R2 = U` .
