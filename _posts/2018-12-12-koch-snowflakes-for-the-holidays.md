---
layout: post
title: Koch snowflakes for the holidays
date: 2018-12-12
name: 2018-12-12-koch-snowflakes-for-the-holidays
tags: julia fractal
image: /blog/assets/koch/koch-julia.png
---

[Code for these images](https://github.com/abelsiqueira/koch-holidays).

I hope you're familiar with the [Koch curve
fractal or snowflake](https://en.wikipedia.org/wiki/Koch_snowflake).
It essentially consists taking a line segment, splitting it in three, and substituting
the middle part by two segments that form an equilateral triangle without the base.
From one segment you obtain four. For each new segment, repeat the process.

Images:

![]({{site.baseurl}}/assets/koch/line-koch-0.png)
![]({{site.baseurl}}/assets/koch/line-koch-1.png)
![]({{site.baseurl}}/assets/koch/line-koch-2.png)
![]({{site.baseurl}}/assets/koch/line-koch-3.png)
![]({{site.baseurl}}/assets/koch/line-koch-4.png)
![]({{site.baseurl}}/assets/koch/line-koch-5.png)
![]({{site.baseurl}}/assets/koch/line-koch-6.png)
![]({{site.baseurl}}/assets/koch/line-koch-7.png)

The most important aspect of the koch line is that it looks awesome. Furthermore, you
can do it for any image that is a collection of segments. In particular, regular
polygons, both outward and inward.

![]({{site.baseurl}}/assets/koch/polygon-2.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-2.png)
![]({{site.baseurl}}/assets/koch/polygon-3.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-3.png)
![]({{site.baseurl}}/assets/koch/polygon-4.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-4.png)
![]({{site.baseurl}}/assets/koch/polygon-5.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-5.png)
![]({{site.baseurl}}/assets/koch/polygon-6.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-6.png)
![]({{site.baseurl}}/assets/koch/polygon-7.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-7.png)
![]({{site.baseurl}}/assets/koch/polygon-8.png)
![]({{site.baseurl}}/assets/koch/polygon-reverse-8.png)

Another way to define the four new segments is this: Given the endpoints of the segment
$P_1$ and $P_2$, we define $\vec{v} = \vec{P_1P_2}$. The five points that define the
four new segments, in order, are $P_1$, $P_1 + \frac{1}{3}\vec{v}$,
$P_1 + \frac{1}{2}\vec{v} + \alpha R\vec{v}$, $P1 + \frac{2}{3}\vec{v}$ and $P_2$,
where $\alpha = \sqrt{3}/6$.
A simple thing one can do is change the value of $\alpha$ to obtain different images:

![]({{site.baseurl}}/assets/koch/star.png)
Using a diamond with $\alpha = 1.25$.

![]({{site.baseurl}}/assets/koch/reverse-star.png)
Using a square with $\alpha = 1.2$.

![]({{site.baseurl}}/assets/koch/stargon-3.png)
![]({{site.baseurl}}/assets/koch/stargon-4.png)
![]({{site.baseurl}}/assets/koch/stargon-5.png)
Using polygons with $N$ equals to 3, 4 and 5 sides, and $\alpha = 3\sqrt{N}/5$.

![]({{site.baseurl}}/assets/koch/tri-3.png)
![]({{site.baseurl}}/assets/koch/tri-4.png)
![]({{site.baseurl}}/assets/koch/tri-5.png)
Using a line segment from the center to the vertex and back and to next vertex, etc.,
with $\alpha = 1$.

And to close off, here's a traditional triangle, repeated, with alternating colors.
![]({{site.baseurl}}/assets/koch/koch.png)

[Here a larger scale version]({{site.baseurl}}/assets/koch/koch-large.png)
![]({{site.baseurl}}/assets/koch/koch-large.png)

Happy holidays!
![]({{site.baseurl}}/assets/koch/koch-julia.png)
