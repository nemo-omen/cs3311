---
title: Assignment 02
---
Jeff Caldwell

CS 3311

Assignment 02

November 20, 2021

<h1 style="text-align: center">Implementing a Hash Table in C++</h1>


```bash
Table empty. Beginning insertion.

Full Table: 
[0] --> { ID: 110, tag: XYZ }
[1] --> { ID: 121, tag: ABC } --> { ID: 221, tag: DEF }
[2] --> { ID: 222, tag: HJK }
[3] --> { ID: 333, tag: FUI }
[4] --> { ID: 444, tag: RYU }
[5] --> { ID: 555, tag: ODU }
[6] --> { ID: 556, tag: GHI } --> { ID: 666, tag: JKL }
[7] --> { ID: 777, tag: ERW }
[8] --> { ID: 888, tag: UTI }
[9] --> { ID: 999, tag: FDH }

Items with colliding IDs: 
{121, ABC}
{221, DEF}
{556, GHI}
{666, JKL}

Removing items with colliding IDs 121 & 556

Items after removal of one colliding item: 
{666, JKL}
{221, DEF}

Table after colliding item removal: 
[0] --> { ID: 110, tag: XYZ }
[1] --> { ID: 221, tag: DEF }
[2] --> { ID: 222, tag: HJK }
[3] --> { ID: 333, tag: FUI }
[4] --> { ID: 444, tag: RYU }
[5] --> { ID: 555, tag: ODU }
[6] --> { ID: 666, tag: JKL }
[7] --> { ID: 777, tag: ERW }
[8] --> { ID: 888, tag: UTI }
[9] --> { ID: 999, tag: FDH }

Table not empty. Operations successful.
```