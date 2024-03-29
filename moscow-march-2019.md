---
title: "Landscapes in population genetics"
subtitle: "ecology, evolution, and simulation"
author: "Peter Ralph"
date: "Moscow, ID // March 2019"
---


# Overview

##

1. Two problems, about geography and evolution

2. Tree sequences 

    - for more and better simulations

3. Geographical methods, and some results


<!-- Tortoise intro -->

# Problem #1: geography

## the Mojave Desert Tortoise

*Gopherus agassizii:*

::: {.centered}
![a tortoise](figs/tortoise/tortoise-in-burrow.jpg){width=70%}
:::

## the Mojave Desert Tortoise

::: {.centered}
![range map](figs/tortoise/range-abundance-map.jpeg){width=70%}
:::

## the Mojave Desert Tortoise

::: {.centered}
![ivanpah](figs/tortoise/ivanpah-opens.png){width=70%}
:::

## the Mojave Desert Tortoise

::: {.centered}
![solar](figs/tortoise/latimes-torts-delay-solar.png){width=70%}
:::

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



<!-- Mimulus intro -->

# Problem #2: selection

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

<!--

-------------------

![Langley et al 2012](figs/from_the_literature/langley-et-al-2012-chr3-pi-and-rho.png)

-------------------

![McVicker et al 2009](figs/from_the_literature/mcvicker-2009-hu_chr1-landscape.png)
![](figs/from_the_literature/mcvicker-2009-hu_chr1-landscape-caption.png)

McVicker et al 2009
-->


--------------

linked selection

: The indirect effects of selection on genomic locations
  that are *linked* to the sites under selection by a lack of recombination.

::: {.centered}

![](figs/sweep_haps.png){.fragment width="40%"}
![](figs/background_haps.png){.fragment width="40%"}

:::

----------------------

- But, what *kind* of linked selection? 
- How strongly and frequently does it act? 
- On how many targets?

. . .

Consequences for: genetic load/disease,
speed of evolution,
trait architecture.





<!-- section SIMULATION -->

# Simulation: not as easy as you might think

## Simulations, to

> - make predictions
> 
> - guide theory
> 
> - train inference methods


-----------------------------

We need:

- large populations with long genomes
- many loci under selection
- geographic population structure

for long enough to reach equilibrium ($\sim 10N$ generations).

. . .

For instance: $10^4$ individuals with $2 \times 10^8$ base pairs each for $10^5$ generations;
nonneutral mutations possible at $10^5$ loci.


##

*First:*

- **large populations with long genomes**



<!-- 1. explain tree sequences and why they are so efficient (5min) -->

# The tree sequence

---------------

![](figs/treseq_preprint.png)

---------------

![](figs/treseq_preprint_peeps.png)


## History is a sequence of trees

For a set of sampled chromosomes,
at each position along the genome there is a genealogical tree
that says how they are related.

. . .

![Trees along a chromosome](figs/sim_ts.anim.gif)


----------------------

A **tree sequence** describes this, er, sequence of trees.

<!--
. . .

*Observations:*

1. The *pedigree* (parental relationships) plus crossover locations
    would give us the tree sequence for *everyone, ever*.

2. Much less can fully describe the history relevant to a *sample* of genomes.

3. This information is equivalent to the Ancestral Recombination Graph (ARG).
-->


-------------

[Kelleher, Etheridge, and McVean](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004842) 
introduced the **tree sequence** data structure
for a fast coalescent simulator, [msprime](https://github.com/jeromekelleher/msprime).

- stores sequence *and* genealogical data

- tree differences allow **very** efficient

    * subsetting
    * calculation of allele frequencies in arbitrary cohorts
    * linkage disequilibrium
    * log-time haplotype matching

- tree-based sequence storage closely related to haplotype-matching compression


## Simulated file sizes

::: {.centered}
![file sizes](figs/tsinfer_sizes.png){width=90%}
:::

from *Kelleher et al 2018, *Inferring the ancestry of everyone"*

<!-- Estimated sizes of files required to store the genetic variation data for a
simulated human-like chromosome (100 megabases) for up to 10 billion haploid
(5 billion diploid) samples. Simulations were run for 10 1 up to 10 7 haplotypes
using msprime [Kelleher et al., 2016], and the sizes of the resulting files plotted
(points). -->


## Example: three samples; two trees; two variant sites

![Example tree sequence](figs/example_tree_sequence.png)



## Nodes and edges

Edges 

:   Who inherits from who; only *necessary* for coalescent events.

    Records: interval (left, right); parent node; child node.

Nodes 

:   The ancestors those happen in.

    Records: time ago (of birth); ID (implicit).

-------------------

![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.0.png)

-------------------


![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.1.png)

-------------------


![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.2.png)

-------------------


![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.3.png)

-------------------


![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.4.png)

-------------------


![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.5.png)

-------------------

![Building a tree sequence](figs/nodes_edges_walkthrough/nodes_edges_walkthrough.6.png)


## Sites and mutations

Mutations

:   When state changes along the tree.

    Records: site it occured at; node it occurred in; derived state.

Sites 

:   Where mutations fall on the genome.

    Records: genomic position; ancestral (root) state; ID (implicit).


------------------

![Adding mutations](figs/sites_muts_walkthrough/sites_muts_walkthrough.0.png)

------------------

![Adding mutations](figs/sites_muts_walkthrough/sites_muts_walkthrough.1.png)

------------------

![Adding mutations](figs/sites_muts_walkthrough/sites_muts_walkthrough.2.png)

------------------

![Adding mutations](figs/sites_muts_walkthrough/sites_muts_walkthrough.3.png)

------------------

![Adding mutations](figs/sites_muts_walkthrough/sites_muts_walkthrough.4.png)



<!-- 4. explain application to fwds sim recording (5min) -->

# Forwards-time tree sequence recording

## The main idea

If we *record the tree sequence*
that relates everyone to everyone else,

after the simulation is over we can put neutral mutations down on the trees.

. . .

Since neutral mutations don't affect demography,

this is *equivalent* to having kept track of them throughout.

------------

This means recording the entire genetic history of **everyone** in the population, **ever**.

.  . .

It is *not* clear this is a good idea.


## Tree recording strategy

Every time an individual is born, we must:

::: incremental

1. add each contributing gamete to the Node Table,
2. add entries to the Edge Table
    recording which parental copy each inherited each bit of genome from, and
3. add any new non-neutral mutations to the Mutation Table 
    and (if necessary) their locations to the Site Table.

:::

. . .

::: {.columns}
:::::: {.column width=15%}

![Rightarrow](figs/finger_right.png){width="100%"}

:::
:::::: {.column width=5%}

:::
:::::: {.column width=75%}

This produces **waaaaay** too much data.

:::
::::::

-------------------

We won't end up needing the *entire* history
of *everyone ever*,

. . .

but we won't know *what* we'll need until later.

. . .

How do we get rid of the extra stuff?


## Simplification

*Question:* given a tree sequence
containing the history of many individuals,
how do we *simplify* it to only the history
of a subset?

-----------

Concretely, given an input tree sequence
and a subset of its nodes we call the *samples*,

we want a new *minimal* tree sequence
that contains the history of those samples.

<!--
1. All marginal trees match the corresponding subtree 
    in the input tree sequence.

2. Every non-sample node in marginal trees has at least two children.

3. All nodes and edges are ancestral to at least one sample.

4. No adjacent redundant edges 
    (e.g., $(\ell, x, p, c) + (x, r, p, c) \rightarrow (\ell, r, p, c)$).
-->

-----------

To simplify a tree sequence
to the history of the *samples*:

> 1. Paint each *sampled* chromosome a distinct color.
> 
> 2. Moving back up the tree sequence,
>     copy colors of each chromosome to the parental chromosomes
>     they inherited from.
> 
> 3. If two colors go in the same spot (*coalescence*),
>     replace with a new color (unique to that ancestor).
>     Output a node for the ancestor and an edge for the coalescence.
> 
> 4. Once all colors have coalesced in a given segment,
>     stop propagating it.

## An example: simplify these to J and K

![Simplify example](figs/simplify_walkthrough.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.0.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.1.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.2.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.3.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.4.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.5.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.6.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.7.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.8.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.9.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.10.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.11.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.12.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.13.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.14.png){ width="100%" }

-------------------

![Simplify example](figs/simplify_walkthrough/simplify_walkthrough.15.png){ width="100%" }


## Wright-Fisher, N=10: before simplification

![Wright-Fisher tree sequence](figs/sim_wf.anim.gif)

## Wright-Fisher, N=10: before simplification

![Wright-Fisher tree sequence](figs/sim_wf_unlabeled.anim.gif)

## ... and after simplification

![Simplified Wright-Fisher tree sequence](figs/sim_wf_simplified.anim.gif)


# Implementation and results

## *Revised* tree recording strategy

Every time an individual is born, we must:


1. add each gamete to the Node Table,
2. add entries to the Edge Table
    recording which parent each gamete inherited each bit of genome from
3. add any new **non-neutral** mutations to the Mutation Table 
    and (if necessary) their locations to the Site Table.

... and,

4. Every so often, *simplify* the tables so far,
    retaining the history of the current generation.

. . .

5. At the end, add neutral mutations.

. . .

*Result:* whole genome sequence *and* all the genealogical trees.



## Implementation

[`tskit`](https://github.com/tskit-dev/tskit)

: *many* tools for working with tree sequences

. . .

Benchmark implementation

- Simulation: [`fwdpp`](https://github.com/molpopgen/fwdpp), by Kevin Thornton (in `C++`) ([code](https://github.com/molpopgen/fwdpy11_arg_example))

- Glue: [`pybind11`](https://github.com/pybind/pybind11/) and [`numpy`](http://www.numpy.org/)

- Machine: Ubuntu / 2x 2.6 GHz Intel E5-2650 CPU


## Simulation parameters


- Wright-Fisher population of size $N$

- simulated for $10N$ generations

- neutral mutation rate $\mu$ equal to recombination rate $r$ per gamete

- many, weakly deleterious mutations: rate $\mu/100$ with
    $s$ exponentially distributed with mean $2.5/N$.

. . .

*Note:*
if we recorded tree sequences ("pedigree recording")
then the neutral mutation rate was *zero*
but neutral mutations were added *afterwards*.


--------------------------

<!--
Translation:
$$
\begin{aligned}
N=10^3 \text{ and } \rho=10^4 \\
\Rightarrow L \approx 2.5 \times 10^8 \text{bp}
\end{aligned}
$$

$$
\begin{aligned}
N=10^4 \text{ and } \rho=10^4 \\
\Rightarrow L \approx 2.5 \times 10^7 \text{bp}
\end{aligned}
$$

$$
\begin{aligned}
N=5 \times 10^4 \text{ and } \\
\qquad \rho=10^5 \\
\Rightarrow L \approx 5 \times 10^7 \text{bp}
\end{aligned}
$$
-->

![Total run time per single simulation as a function of region length.](figs/rawspeed.png){ width=80% }

--------------------------

![Relative speedup of simulations](figs/speedup.png){ width=80% }


# Geographic simulations

----------------

We **still** need simulations with:

- many loci under selection
- **geographic population structure**
- large populations with long genomes

for long enough to reach equilibrium ($\sim 10N$ generations).

. . .

::: {.columns}
:::::: {.column width=15%}

![Rightarrow](figs/finger_right.png){width="100%"}

:::
:::::: {.column width=5%}

:::
:::::: {.column width=75%}

SLiM v3.1 *(Haller and Messer)*

:::
::::::

## 

::: {.columns}
::::::: {.column width="50%"}


**S**election on **Li**nked **M**utations, v3.1:
a forwards-time, individual-based, explicitly genomic simulator,
now with:

- continuous space
- geographic maps
- locally, density-dependent demography (*non-Wright-Fisher*)

:::
::::::: {.column width="50%"}

![](figs/slim_logo.png)
<!-- ![](figs/slim_space.png) -->

:::
:::::::

. . .

**And a GUI!!!**




## ... and, tree sequence recording!


![](figs/slim_preprint.png)

## ... and, tree sequence recording!


![](figs/slim_preprint_peeps.png)


## A 100x speedup:

::: {.centered}
![](figs/slim_timing.png){width=60%}
:::

## What else can you do with the tree sequence?

> - record ancient samples 
> - true ancestry reconstruction 
> - *recapitation*: fast, post-hoc initialization with coalescent simulation 


---------------------

**For example:**


- genome as human chr7 ($1.54 \times 10^8$bp)
- $\approx$ 10,000 diploids
- 500,000 overlapping generations
- continuous, square habitat
- selected mutations at rate $10^{-10}$
- neutral mutations added afterwards

*Runtime:* 8 hours


# Geography


## 

$$ \text{Wright-Fisher} + \text{geography} $$

. . .

$$ \qquad {} = \text{a pain in the torus} $$

. . .

*Felensestein, 1975*

## The pain

<center>
<video width="600" height="600" controls>
  <source src="figs/spaceness/pain.500.anim.mp4" type="video/mp4">
</video>
</center>

## A related pain

**Coalescent theory** requires *exchangeability* in large populations,
because:

> 1. Lineages must move *independently* until the coalesce, and
> 2. if we know one offspring came from a certain location,
> 3. that location may be more likely to be the source of others.

. . .

::: {.columns}
::::::: {.column width="25%"}

![](figs/spaceness/finger_right.png){width=90%}

:::
::::::: {.column width="75%"}

We need **forward simulation** for realistic geography.

:::
:::::::

## The promise

Geography could add a *lot* of information.

. . .

With $n$ samples and no geography, there are $n$ informative entries in the SFS.

. . .

With georeferenced data, each of the $n(n-1)/2$ different pairwise divergences
provide different information.

-------------

![](figs/torts/pwp_etort-191_shaded.png)

-------------

![](figs/torts/pwp_etort-229_shaded.png)

-------------

![](figs/torts/pwp_etort-240_shaded.png)

-------------

![](figs/torts/pwp_etort-253_shaded.png)

-------------

![](figs/torts/pwp_etort-273_shaded.png)

-------------

![](figs/torts/pwp_etort-27_shaded.png)

-------------

![](figs/torts/pwp_etort-283_shaded.png)

-------------

![](figs/torts/pwp_etort-285_shaded.png)

-------------

![](figs/torts/pwp_etort-35_shaded.png)

-------------

![](figs/torts/pwp_etort-57_shaded.png)

-------------

![](figs/torts/pwp_etort-71_shaded.png)

-------------

![](figs/torts/pwp_etort-78_shaded.png)


# Modeling

## 

<center>

The earth is not flat.

</center>

. . .

<center>

barriers, currents, microclimates ...

</center>


. . .

<center>

Population regulation is **local**.

</center>





## Interactions


::: {.columns}
::::::: {.column width="50%"}

Based on *interaction kernels*, e.g.
$$
    \rho(r) = \frac{1}{2 \pi \sigma^2} e^{- r^2 / 2 \sigma^2}
$$

applied to the distance to the other individual.

:::
::::::: {.column width="50%"}

![](figs/spaceness/koopas.png){width=100%}

:::
:::::::


## Interactions


::: {.columns}
::::::: {.column width="50%"}

Based on *interaction kernels*, e.g.
$$
    \rho(r) = \frac{1}{2 \pi \sigma^2} e^{- r^2 / 2 \sigma^2}
$$

applied to the distance to the other individual.


:::
::::::: {.column width="50%"}

![](figs/spaceness/koopa_interactions.png){width=100%}

:::
:::::::


##  

::: {.columns}
::::::: {.column width="50%"}

1. **Mate choice:** 

    individual $i$ chooses partner $j$ at distance $d_{ij}$ 
    with probability proportional to $\rho(d_{ij})$.

:::
::::::: {.column width="50%"}

![](figs/spaceness/koopas_mates.png){width=100%}

:::
:::::::


##  

::: {.columns}
::::::: {.column width="50%"}

2. **Dispersal:** 

    offspring live near their parents.

:::
::::::: {.column width="50%"}

![](figs/spaceness/koopas_dispersal.png){width=100%}

:::
:::::::


##  

::: {.columns}
::::::: {.column width="50%"}

3. **Population regulation:**

    with local density
    $$ D_i = \sum_j \rho(d_{ij}) , $$

    - *survival*, 
    - *fecundity*, and/or 
    - *establishment* 

    decrease with $D$.

:::
::::::: {.column width="50%"}

![](figs/spaceness/koopas_density.png){width=100%}

:::
:::::::


## Computation

To do this, we need to know
$$ \rho(\|x_i - x_j\|) $$
for each pair $(i,j)$ of individuals.

. . .

This is...

. . .

<center>
*(cue dramatic music)*
</center>

. . .

$$ O(N^2) $$


## Computation

To do this, we need to know
$$ \rho(\|x_i - x_j\|) $$
for each pair of **nearby** individuals.

. . .

... say, for all pairs with $\|x_i - x_j\| \le 3 \sigma$.

. . .

A $k$-d tree

: allows finding all points within distance $3\sigma$ in $\log(N)$-time.

Computation time scales with $N M \log(N)$, 
where $M$ is the number of neighbors within distance $3\sigma$.



# But does it matter?

## 

::: {.columns}
::::::: {.column width="50%"}

<center>

![](figs/spaceness/cjb.jpg){width=80%}

CJ Battey

</center>

:::
::::::: {.column width="50%"}

<center>

![](figs/spaceness/kern.jpg){width=80%}

Andy Kern

</center>

:::
:::::::


## Simulations

> 1. Flat, square habitat.
> 2. Neutral.
> 3. Mate choice: proportional to $e^{-d_{ij}^2 /2 \sigma_m^2}$.
> 4. Poisson(1/4) offspring each time step.
> 5. ... which disperse a Normal$(0, \sigma_d)$ distance.
> 6. Local density for $i$ computed as:
>     $$ D_i = \frac{1}{2 \pi \sigma_i^2} \sum_{j \neq i} e^{-d_{ij}^2 /2 \sigma_i^2} , $$
> 7. Probability of survival: with $K=5$,
>     $$ \min(0.95, 1/(1 + D_i / 5 K) . $$
> 8. $10^8$ bp with recomb rate $10^{-9}$; neutral mutations on the tree sequence after.


## An important parameter

Wright's neighborhood size

: the mean number of individuals in a circle of radius $2 \sigma$ .

## Sampling schemes matter!

::: {.centered}
![](figs/spaceness/sampling_maps.png){width=90%}
:::

## Popgen statistics

::: {.centered}
![](figs/spaceness/het_by_ns.png){width=80%}
:::


## Trait distributions


::: {.centered}
![](figs/spaceness/gwas_traits.png){width=80%}
:::


## GWAS false positives

::: {.centered}
![](figs/spaceness/gwas_snps.png){width=80%}
:::


# Wrap-up

## 

> 1. Learning about geography
> 2. and/or ubiquitous selection
> 3. is hard.
> 4. But, it matters!
> 5. And, now we have better tools!
> 6. Also, tree sequences are great.

##

Thank you!!


# Spatial simulations

## $\sigma_d = \sigma_i = \sigma_m = 2$

<center>
<video width="600" height="600" controls>
  <source src="figs/spaceness/flat.500.anim.mp4" type="video/mp4">
</video>
</center>

## $\sigma_d = \sigma_i = \sigma_m = 2$

::: {.columns}
::::::: {.column width="50%"}

![](figs/spaceness/flat.500.anim.last.png){width=600}

:::
::::::: {.column width="50%"}

![](figs/spaceness/waves.100000.ibd.png)

:::
:::::::

## $\sigma_d = 0.15$, $\sigma_i = \sigma_m = 0.5$

<center>
<video width="600" height="600" controls>
  <source src="figs/spaceness/metapops.500.anim.mp4" type="video/mp4">
</video>
</center>

## $\sigma_d = 0.15$, $\sigma_i = \sigma_m = 0.5$

::: {.columns}
::::::: {.column width="50%"}

![](figs/spaceness/metapops.500.anim.last.png){width=600}

:::
::::::: {.column width="50%"}

![](figs/spaceness/metapops.100000.ibd.png)

:::
:::::::


## $\sigma_d = 0.25$, $\sigma_i = \sigma_m = 0.2$

<center>
<video width="600" height="600" controls>
  <source src="figs/spaceness/patchy.500.anim.mp4" type="video/mp4">
</video>
</center>


## $\sigma_d = 0.25$, $\sigma_i = \sigma_m = 0.2$

::: {.columns}
::::::: {.column width="50%"}

![](figs/spaceness/patchy.500.anim.last.png){width=600}

:::
::::::: {.column width="50%"}

![](figs/spaceness/patchy.100000.ibd.png)

:::
:::::::




# Landscapes over time

The *Mimulus aurantiacus* species complex
-----------------------------------------

::: {.centered}
![](figs/aurantiacus/phylogeny.png)
:::


<!--

------------------

::: {.centered}
![](figs/aurantiacus/stankowski-color-cline.png){width=70%}
:::

-->

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

::: {.centered}
![](figs/aurantiacus/dxy-pi-cor-by-time.png){width=60%}
:::


## 

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





## The data

![](figs/aurantiacus/divergence_by_node_LG1.png)

## Simulations

::: {.columns}
::::::: {.column width="70%"}

- $N=10,000$ diploids
- burn-in for $10N$ generations
- population split followed by period sampling, with:
    
    * neutral
    * background selection
    * selection against introgressed alleles

:::
::::::: {.column width="30%"}

![](figs/murillo.jpeg)

:::
:::::::


------------------

![](figs/aurantiacus/murillo_neutral.png)

------------------

![](figs/aurantiacus/murillo_selected.png)

