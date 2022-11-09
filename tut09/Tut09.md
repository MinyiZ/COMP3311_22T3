# Tut09

## ******Q1b******

A → B could hold

B → A does not hold

A → C does not hold

C → B does not hold

## ****Q2****

1. A+ = {A, B}
2. ACEG+ = {A, B, C, E, F, G}
3. BD+ = {A, B, C, D, E, F, G}

## ****Q3****

1. ACD+ = {A, B, C, D, E}
    
    BCD
    
    CDE
    
2. in 3NF

c. not in BCNF

## ******Q4a******

1. B+ = {A, B, C, D}
2. BD
3. ABC, BCD
4. A+ = {A, B, C, D}
5. AB, CD, BC, AD
6. A

## ******Q4b******

1. not BCNF
2. not BCNF
3. not BCNF
4. not BCNF
5. not BCNF
6. BCNF

## ******Q4c******

1. not 3NF
2. not 3NF
3. 3NF
4. not 3NF
5. 3NF
6. 3NF

## ****Q5****

Team(name, captain)

candidate key: name

fd: {name → captain}

in BCNF

Player(name, teamPlayedFor)

candidate key: name

fd: {name → teamPlayedFor}

in BCNF

TeamColours(teamName, colour): no non-trivial fds

in BCNF

## **********Account Table Example**********

Acc(AccNo, balance, customer, branch, address, assets)

candidate key: AccNo

fd: {

AccNo → balance, customer, branch, address, assets

branch → assets

}

not in BCNF

not in 3NF

****************BCNF Normalisation****************

split table

(branch, assets) {branch → assets} key: branch ⇒ in BCNF

(AccNo, balance, customer, branch, address) {AccNo → balance, customer, branch, address} key: AccNo ⇒ in BCNF

result

(branch, assets)

(AccNo, balance, customer, branch, address)

## ******Q7 - 3NF******

**i.**

candidate key: B

fd: {C → D,   C → A,   B → C}

reduced minimal cover: {C → AD, B → C}

split into tables

CAD, BC

need relation with key?

no need to add extra table because candidate key B is in one of the resulting tables

result

CAD, BC

**ii.**

candidate key: BD

fd: {B → C,   D → A}

reduced minimal cover: {B → C,   D → A}

split into tables

BC, DA

need relation with key?

yes, BD

result

BC, DA, BD

**iv.**

candidate key: AB, CD, BC, AD

fd: {A → B,   BC → D,   A → C}

reduced minimal cover: {A → BC, BC → D}

split into tables

ABC, BCD

need relation with key?

no, ABC has candidate key AB

result

ABC, BCD

## ******************Q3 - BCNF******************

**i.**

candidate key: B

fd: {C → D,   C → A,   B → C}

reduced minimal cover: {C → AD, B → C}

**if we choose {C → AD}:**

split table ABCD (choose C → AD)

CAD {C → AD} key: C ⇒ in BCNF

BC {B → C} key: B ⇒ in BCNF

result

CAD, BC

**if we choose {B → C}**

spit table ABCD (choose B → C)

BC {B → C} key: B ⇒ BCNF

ABD {} key: ABD ⇒ BCNF

result

CD, ABD

**ii.**

candidate key: BD

fd: {B → C,   D → A}

reduced minimal cover: {B → C,   D → A}

split table ABCD (choose B → C)

BC {B → C} key: B ⇒ in BCNF

ABD {D → A} key: BD ⇒ not in BCNF

split table ABD (choose D → A)

AD {D → A} key: D ⇒ in BCNF

BD {} key: BD ⇒ in BCNF

result

BC, AD, BD

**iii.**

candidate keys: ABC, BCD

fd: {ABC → D,   D → A}

reduced minimal cover: {ABC → D,   D → A}

split table ABCD (choose D → A)

AD {D → A} key: D ⇒ in BCNF

BCD {} key: BCD ⇒ in BCNF

result

AD, BCD