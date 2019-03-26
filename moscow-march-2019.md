---
title: "Spatial population genetics"
subtitle: "ecology, evolution, and simulation"
author: "Peter Ralph"
date: "Moscow, ID // March 2019"
---


# Overview

##

1. Two problems, about geography and evolution

2. The challenge: better simulations

3. Genomic landscapes, across time

4. Some steps forward for spatial population genetics


# Problem #1

## Genomic landscapes


![Langley et al 2012](figs/from_the_literature/langley-et-al-2012-chr3-pi-and-rho.png)


##


What causes variation in genetic diversity?



##

$$
\begin{aligned}
\pi &= \text{ (within-pop diversity) } \\
d_{xy} &= \text{ (between-pop divergence) } \\
F_{ST} &= \text{ (relative differentiation) }
\end{aligned}
$$

::: {.centered}

![](figs/fst_tree.png){width=60%}

:::

## Diversity correlates with recombination rate

![Corbett-Detig et al](figs/from_the_literature/corbett-detig-divergence-recomb-drosophila.png)

Corbett-Detig et al 2015; Cutter & Payseur 2013 

--------------------

![Corbett-Detig et al](figs/from_the_literature/corbett-detig-divergence-recomb-all-species.png){width=70%}

Corbett-Detig et al 2015

-------------------

![Langley et al 2012](figs/from_the_literature/langley-et-al-2012-chr3-pi-and-rho.png)

<!--
-------------------

![McVicker et al 2009](figs/from_the_literature/mcvicker-2009-hu_chr1-landscape.png)
![](figs/from_the_literature/mcvicker-2009-hu_chr1-landscape-caption.png)

McVicker et al 2009
-->

The *Mimulus aurantiacus* species complex
-----------------------------------------

::: {.centered}
![](figs/aurantiacus/phylogeny.png)
:::


------------------

::: {.centered}
![](figs/aurantiacus/stankowski-color-cline.png){width=70%}
:::

----------------------------------

![https://www.biorxiv.org/content/early/2018/06/21/342352](figs/aurantiacus/preprint.png)

----------------------------------

![https://www.biorxiv.org/content/early/2018/06/21/342352](figs/aurantiacus/preprint_peeps.png)



-------------------------

The data:

- chromosome-level genome assembly
- $20\times$ coverage of 8 taxa and outgroup (*M.clevelandii*)
- diversity ($\pi$), divergence ($d_{xy}$),
    and differentiation ($F_{ST}$) in windows
- 36 pairwise comparisons among 9 taxa
- estimates of recombination rate and gene density
    from map and annotation

<!--
## A spectrum of differentiation

![](figs/aurantiacus/distributions.png)
-->

-------------------

![](figs/aurantiacus/lg1.png)

---------------------

![](figs/aurantiacus/cor-across-time-0.png)

---------------------

![](figs/aurantiacus/cor-across-time-1.png)

---------------------

![](figs/aurantiacus/cor-across-time-2.png)


## Questions

selection? how much? what kind? other options?

## Conclusions

- Emergence of landscape of diversity across $\approx$ 1.5 million years!

- Shared targets of linked selection across taxa?

. . .

- But, what *kind* of linked selection? \
    How strongly and frequently does it act? \
    On how many targets?

. . .

Consequences for: genetic load/disease,
speed of evolution,
trait architecture.


<!-- Tortoise intro -->

# Problem #2

## the Mojave Desert Tortoise

  *Gopherus agassizii:*
  ![a tortoise](figs/tortoise/tortoise-in-burrow.jpg)

## the Mojave Desert Tortoise

  ![range map](figs/tortoise/range-abundance-map.jpeg)

## the Mojave Desert Tortoise

  ![ivanpah](figs/tortoise/ivanpah-opens.png)

## the Mojave Desert Tortoise

  ![solar](figs/tortoise/latimes-torts-delay-solar.png)

## The question(s)


::: {.columns}
::::::: {.column width="50%"}

1. How will changes to the landscape affect population viability and gene flow?

2. How do tortoises move around on the landscape?

:::
::::::: {.column width="50%"}

![](figs/tortoise/drecp-pref-alt-snapshot.png)

:::
:::::::






<!-- section SIMULATION -->

# Simulation: not as easy as you might think

-----------------------------------------

![](figs/aurantiacus/phylogeny.png)

------------------

![](figs/aurantiacus/stankowski-color-cline.png){width=70%}


-----------------------------

To check predictions, we need simulations with:

- many loci under selection
- geographic population structure
- large populations with long genomes

for long enough to reach equilibrium ($\sim 10N$ generations).

. . .

For instance: $10^4$ individuals with $2 \times 10^8$ base pairs each for $10^5$ generations;
nonneutral mutations possible at $10^5$ loci.


##

*First:*

- **large populations with long genomes**



