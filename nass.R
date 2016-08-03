install.packages("jsonlite")

fromJSON("https://quickstats.nass.usda.gov/api/api_GET/?key=5A715EC0-2C83-365C-A050-BC1E21C390D5&source_desc=SURVEY&sector_desc=CROPS&group_desc=FIELD%20CROPS&commodity_desc=CORN&statisticcat_desc=PRICE%20RECEIVED&short_desc=CORN,%20GRAIN%20-%20PRICE%20RECEIVED,%20MEASURED%20IN%20$%20/%20BU&domain_desc=TOTAL&agg_level_desc=NATIONAL&state_name=US%20TOTAL&year_GE=1866&freq_desc=ANNUAL&reference_period_desc=YEAR")

