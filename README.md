# Which Programming Language Best Supports Data-Driven SDG Impact Analysis?

## A Comparative Study Using SDG No Poverty

This repository contains the implementation files for a comparative research task that evaluates Python and SQL + TypeScript for data-driven Sustainable Development Goal (SDG) impact analysis.

## Selected SDG Indicator

**SDG Title:** No Poverty  
**Indicator:** Proportion of the population living below the international poverty line  
**Dataset Source:** World Bank Open Data  
**Indicator Code:** SI.POV.DDAY  

This indicator matters because poverty data helps policymakers monitor poverty reduction progress and identify regions that need stronger intervention.

## Dataset

The dataset used in this project is a small working subset based on the World Bank poverty indicator format. It contains at least 10 rows and 5 columns.

| Column | Description |
|---|---|
| Country | Name of the country |
| Region | Geographic region |
| Year | Observation year |
| Poverty_Rate | Percentage of population below the poverty line |
| Income_Group | Country income classification |

## Languages Compared

| Group | Language |
|---|---|
| Group A | Python |
| Group B | SQL + TypeScript |

## Python Implementation

The Python script loads the CSV file, removes missing values, computes the mean poverty rate by region and year, generates a chart, and saves the summary table.

### Run Python

```bash
pip install -r requirements.txt
python python/analyze_poverty.py
