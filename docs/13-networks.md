
# Networks {#networks}

This lecture uses the following packages:
```
tidyverse
geomnet
```

## Data

The basic data requirements for creating a network diagram is a listing of the edges. Each edge observation
should designate the two vertices it connects. In this lecture we will look at international trade flows.
Each edge will represent the amount of trade flowing between two countries.

### UN Comtrade Database

The [UN Comtrade Database](https://comtrade.un.org/) houses detailed global trade data.

1. Under "Type of product & Frequency" select **Goods** and **Annual**
2. Under "Classification" select **HS 12**
3. Under "Select desired data" change *Trade flows* to **Import**, *Partners* to **All** and 
change the *HS2012 commodity codes* list to include the following

* 1006 - Rice
* 1005 - Maize (corn)
* 0201 - Meat of bovine animals; fresh or chilled
* 0302 - Fish; fresh or chilled, excluding fish fillets and other fish meat of heading 0304

Next click on "Download CSV".


```r
library(tidyverse)
comtrade <- read_csv("data/comtrade.csv")
comtrade
```

```
## # A tibble: 57 x 35
##    Classification  Year Period `Period Desc.` `Aggregate Level`
##             <chr> <int>  <int>          <int>             <int>
##  1             H4  2016   2016           2016                 4
##  2             H4  2016   2016           2016                 4
##  3             H4  2016   2016           2016                 4
##  4             H4  2016   2016           2016                 4
##  5             H4  2016   2016           2016                 4
##  6             H4  2016   2016           2016                 4
##  7             H4  2016   2016           2016                 4
##  8             H4  2016   2016           2016                 4
##  9             H4  2016   2016           2016                 4
## 10             H4  2016   2016           2016                 4
## # ... with 47 more rows, and 30 more variables: `Is Leaf Code` <int>,
## #   `Trade Flow Code` <int>, `Trade Flow` <chr>, `Reporter Code` <int>,
## #   Reporter <chr>, `Reporter ISO` <chr>, `Partner Code` <int>,
## #   Partner <chr>, `Partner ISO` <chr>, `2nd Partner Code` <chr>, `2nd
## #   Partner` <chr>, `2nd Partner ISO` <chr>, `Customs Proc. Code` <chr>,
## #   Customs <chr>, `Mode of Transport Code` <chr>, `Mode of
## #   Transport` <chr>, `Commodity Code` <chr>, Commodity <chr>, `Qty Unit
## #   Code` <int>, `Qty Unit` <chr>, Qty <chr>, `Alt Qty Unit Code` <chr>,
## #   `Alt Qty Unit` <dbl>, `Alt Qty` <chr>, `Netweight (kg)` <dbl>, `Gross
## #   weight (kg)` <chr>, `Trade Value (US$)` <dbl>, `CIF Trade Value
## #   (US$)` <chr>, `FOB Trade Value (US$)` <chr>, Flag <int>
```

## Geomnet

```
install.packages('geomnet')
```

The basic requirements for using `geom_net()` are to identify the vertex columns labelled `from_id`
and `to_id`.

```r
library(geomnet)
trade_plot <- ggplot(comtrade, aes(from_id = `Partner ISO`, to_id = `Reporter ISO`))
trade_plot +
  geom_net()
```

<img src="13-networks_files/figure-html/unnamed-chunk-3-1.png" width="672" />




```r
trade_plot +
  geom_net(colour = "darkred", layout.alg = "circle", labelon = TRUE, 
           size = 15, directed = TRUE, vjust = 0.5, labelcolour = "white",
           arrowsize = 1.5, linewidth = 0.5, arrowgap = 0.05,
           selfloops = TRUE, ecolour = "green") +
  facet_wrap(~ `Commodity`)
```

<img src="13-networks_files/figure-html/unnamed-chunk-4-1.png" width="672" />

## ggnetwork

```
install.packages("ggnetwork")
```


```r
library(ggnetwork)
```
