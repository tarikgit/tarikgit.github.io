# Chapitre 1: Comment crée-t-on des richesses et comment les mesure-t-on?

Après avoir étudié ce chapitre, vous devriez être en mesure d'expliquer les concepts suivants:

    revenu national, propriété privée, production marchande, 
    production non-marchande, facteurs de production, substitution,
    complémentarité, productivité, productivité du travail,
    productivité globale des facteurs, gains de productivité,
    progrès technique, compétitivité des entreprises, 
    croissance économique, valeur ajoutée, bénéfice,
    PIB réel, PIB nominal, taux de croissance, récession, expansion,
    PIB par habitant, indicateurs complémentaires.

![Components of chapter 1](https://gitlab.com/econmediadb/economics-course/-/raw/main/concept-maps/20220524-year1-overview-chapter1.png "Concepts - Chapter 1")


## 1. Introduction: le revenu national

### 1.a. Revenu national

```mermaid
graph TD;
A[bien-être] --> |lié à la| B[richesse d'un pays];
B --> |accroissement de la| C[production des biens & services];
C --> D[The Wealth of Nations Adam Smith, 1776];
D --> |analyse l'| E[origine de la prospérité récente];
E --> F[revenu];
F --> |fruit du capital| F1[intérêt/dividende];
F --> |rémunération d'une activité| F2[profit];
F --> |rémunération du travail| F3[salaire];
F2 --> G[revenu national];
F1 --> |provient de la contribution des acteurs économiques| G;
F3 --> G;
G --> |provient de la| H[production nationale];
G --> |sera distribué aux| I[acteurs qui ont participé à la création]
```

- [An Inquiry into the Nature and Causes of the Wealth of Nations by Adam Smith](https://www.gutenberg.org/ebooks/3300)
- [La richesse des nations par Adam Smith](https://gallica.bnf.fr/ark:/12148/bpt6k75319v.pdf)



## 2. La diversité de la production

### 2.a. Les différents types de bien et services

```mermaid
graph TD;
A[propriété privée] --> |est essentielle au fonctionnement des| B[marchés];
B --> |rend possible la| C[production au sens économique];
C --> D1[biens de consommation];
C --> D2[biens intermédiaires];
C --> D3[services];
```

### 2.b. Production marchande et non-marchande

```mermaid
graph TD;
A[production] --> B1[marchande];
B1 --> C[biens];
C --> |vendus à des| C1[prix économiquement significatifs];
A --> B2[non-marchande];
B2 --> D1[biens];
B2 --> D2[services];
D1 --> |vendus à des| E[prix bas ou gratuit];
D2 --> |vendus à des| E;
```

- **production marchande** :  vendue sur le marché des biens et services à un prix en principe supérieur aux coûts de production
- **production non-marchande** : les biens et services qui sont soit gratuits, soit vendus à un prix inférieur aux coûts de production



## 3. Comment produire et mesurer la production

### 3.a. Les facteurs de production

```mermaid
graph TD;
A[facteurs de production ou intrants/input] --> B1[travail];
A --> B2[capital];
A --> B3[ressources naturelles];
B1 --> |activités de nature| B11[physiques & intellectuelles];
B2 --> |biens de nature| B21[technique];
B3 --> B31[renouvelables];
B3 --> B32[non-renouvelables];
```

### 3.b. Substitution ou complémentarité des facteurs de production

```mermaid
graph TD;
A[combiner les facteurs de production] --> B1[complémentaires];
B1 --> |augmenter simultanément| B11[capital & travail]; 
A  --> B2[substituables];
B2 --> |remplacer un facteur par l'autre| B21[capital ou travail];
B11 --> |choix d'une| C[combinaison optimale];
B21 --> |choix d'une| C;
C --> |produire afin de| D1[maximiser les profits];
C --> |produire afin de| D2[minimiser les coûts];
```

- **fonction de production** : décrit la relation entre la quantité produite et les quantités de facteurs de production utilisées à cette fin.
- **intensif en travail** : se dit de l'utilisation d'une plus grande quantité de travail dans la production, comparativement aux machines et autres facteurs de production.


## 4. Comment mesurer la création de richesses d'une nation?

```math
taux\ \ de\ \ croissance = \frac{ variation\ \ du \ \ PIB }{ valeur\ \ initiale\ \ du \ \ PIB }
```

### 4.a. PIB réel annuel (somme annuelle): Luxembourg (source: FRED)

[Produit intérieur brut réel pour le Luxembourg](https://fred.stlouisfed.org/graph/?g=QYll)

[LaTeX source code](https://www.overleaf.com/read/bbgdjfqzrqkp)

![PIB (ANUUALSUM-LUX)](https://gitlab.com/econmediadb/economics-course/-/raw/main/images/20220626-annual-gdp-annualsum.png "PIB (ANUUALSUM-LUX)")

Source: Eurostat  Release: National Accounts - GDP (Eurostat)  
Units:  Millions of Chained 2010 Euros, Seasonally Adjusted

Frequency:  Quarterly

Eurostat unit ID: CLV10_MNAC
Eurostat item ID = B1GQ
Eurostat country ID: LU

Seasonally and calendar adjusted data.

For euro area member states, the national currency series are converted into euros using the irrevocably fixed exchange rate. This preserves the same growth rates than for the previous national currency series. Both series coincide for years after accession to the euro area but differ for earlier years due to market exchange rate movements.

Copyright, European Union, http://ec.europa.eu, 1995-2016.Complete terms of use are available at http://ec.europa.eu/geninfo/legal_notices_en.htm#copyright

Suggested Citation:
Eurostat, Real Gross Domestic Product for Luxembourg [CLVMNACSCAB1GQLU], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/CLVMNACSCAB1GQLU, June 26, 2022.

### 4.b. PIB réel annuel (moyenne trimestrielle): Luxembourg (source: FRED)

[Produit intérieur brut réel pour le Luxembourg](https://fred.stlouisfed.org/graph/?g=QYiN)

[LaTeX source code](https://www.overleaf.com/read/bbgdjfqzrqkp)

![PIB (ANUUAL-LUX)](https://gitlab.com/econmediadb/economics-course/-/raw/main/images/20220626-annual-gdp.png "PIB (ANUUAL-LUX)")

Source: Eurostat  Release: National Accounts - GDP (Eurostat)  
Units:  Millions of Chained 2010 Euros, Seasonally Adjusted

Frequency:  Quarterly

Eurostat unit ID: CLV10_MNAC
Eurostat item ID = B1GQ
Eurostat country ID: LU

Seasonally and calendar adjusted data.

For euro area member states, the national currency series are converted into euros using the irrevocably fixed exchange rate. This preserves the same growth rates than for the previous national currency series. Both series coincide for years after accession to the euro area but differ for earlier years due to market exchange rate movements.

Copyright, European Union, http://ec.europa.eu, 1995-2016.Complete terms of use are available at http://ec.europa.eu/geninfo/legal_notices_en.htm#copyright

Suggested Citation:
Eurostat, Real Gross Domestic Product for Luxembourg [CLVMNACSCAB1GQLU], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/CLVMNACSCAB1GQLU, June 26, 2022.

### 4.c. Taux de croissance du PIB réel annuel: Luxembourg (source FRED)

[Produit intérieur brut réel pour le Luxembourg](https://fred.stlouisfed.org/graph/?g=QR0p)

[LaTeX source code](https://www.overleaf.com/read/bbgdjfqzrqkp)

![PIB-GROWTH (ANUUAL-LUX)](https://gitlab.com/econmediadb/economics-course/-/raw/main/images/20220623-annual-gdp-growth.png "PIB-GROWTH (ANUUAL-LUX)")

Produit intérieur brut réel pour le Luxembourg

Variation en pourcentage, corrigé des variations saisonnières

Annuel, Moyenne

Source : Communiqué d'Eurostat : Comptes nationaux - PIB (Eurostat)  

Unités :  Millions d'euros chaînés 2010, corrigés des variations saisonnières

Données corrigées des variations saisonnières et des effets de calendrier.

Pour les États membres de la zone euro, les séries en monnaie nationale sont converties en euros en utilisant le taux de change irrévocablement fixé. Cela permet de conserver les mêmes taux de croissance que pour les séries en monnaie nationale précédentes. Les deux séries coïncident pour les années postérieures à l'adhésion à la zone euro mais diffèrent pour les années antérieures en raison des mouvements des taux de change du marché.


### 4.d. Taux de croissance du PIB réel annuel: Luxembourg (source FRED)

(cf. catégorie précédente pour les sources)

![PIB-GROWTH (ANUUAL-LUX-RECESSION)](https://gitlab.com/econmediadb/economics-course/-/raw/main/images/20220623-annual-gdp-growth-recession.png "PIB-GROWTH (ANUUAL-LUX-RECESSION)")

| Période       | Description                     |
| ------------- | ------------------------------- |
| 2001Q2-2003Q2 | éclatement de la bulle internet |
| 2008Q2-2009Q2 | crise des subprimes             |
| 2011Q3-2013Q1 | crise grecque, crise espagnole  |
| 2018Q1-2020Q2 | crise économique du COVID-19.   |

[source des crises](https://fr.wikipedia.org/wiki/Liste_des_crises_mon%C3%A9taires_et_financi%C3%A8res)




[INSERT annual real GDP of LUXEMBOURG (with value boxes) here]

[INSERT annual real GDP GROWTH of LUXEMBOURG here]

```math
PIB\ \ par\ \ habitant = \frac{ valeur\ \ du\ \ PIB }{ population\ \ du\ \ pays }
```

### 4.e. Taux de croissance du PIB réel (en %) pour la Chine, les Etats-Unis, la France et le Luxembourg

[source des données (FRED)](https://fred.stlouisfed.org/graph/?g=R2gT)

[code source LaTeX](https://www.overleaf.com/read/bbgdjfqzrqkp)

![PIB-GROWTH-COMPARISON](https://gitlab.com/econmediadb/economics-course/-/raw/main/images/20220628-growth-rates-comparison.png "PIB-GROWTH-COMPARISON")



**!!TBC!!**

## 5. Comment le PIB a-t-il évolué dans le monde à long terme?

### 5.a. Crosse de hockey (avec Luxembourg)


[GDP per capita, 1 to 2018 (Source: Our World in Data)](https://ourworldindata.org/grapher/gdp-per-capita-maddison-2020?time=1252..2018&country=LUX~GBR~USA~DEU~FRA~JPN~CHN~IND)

PIB par habitant, de 1252 à 2018
Ces données sont ajustées pour tenir compte des différences du coût de la vie entre les pays et de l'inflation. Il est mesuré en dollars internationaux constants de 2011.

OurWorldInData.org/economic-growth • CC BY

Source: Maddison Project Database 2020 (Bolt and van Zanden, 2020)

![Crosse de hockey (avec Luxembourg)](https://gitlab.com/econmediadb/economics-course/-/raw/main/images/20220623-crosse-de-hockey.png "Crosse de hockey (avec Luxembourg)")




## 6. Les indicateurs complémentaires

...



