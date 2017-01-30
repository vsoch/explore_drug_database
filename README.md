# Pet project: explore french's drug data

The objective of this [pet projet](http://blog.jom.link/data_science_pet_project.html) is to explore the official French's drug database. This database is freely available on the [government website](http://base-donnees-publique.medicaments.gouv.fr/telechargement.php). 

# Techniques to apply

On this project, I only want to explore this database and produce some markdown reports. Package I want to practice are the mains ones from tidyverse:

- [tidyr](https://github.com/tidyverse/tidyr)
- [dplyr](https://github.com/hadley/dplyr)
- [ggplot2](https://github.com/tidyverse/ggplot2)
- [rmarkdown](https://github.com/rstudio/rmarkdown)

For the complete list of dependencies, see the [Dockerfile](Dockerfile).

# Run using Docker
A [demo](https://vsoch.github.io/explore_drug_database/demo/) is included. First, you should [install Docker](https://docs.docker.com/engine/installation/). You can use the Docker image served on Docker Hub simply by doing:

     docker run vanessa/explore-drug-database

We would want a more elegant way to stop the container (other than killing the terminal and then doing `docker ps` to get the id and stop it) but this is the quick and dirty demo for now, because I want to go to sleep :)

It will tell you the address to open in your browser, and the port when the reports finish. Note that since you are just running the container, it will all go away when you stop it. If you want to build the container yourself:

     docker build -t vanessa/explore-drug-database .


# Steps to Run Locally

1. Import the data
2. Save as Rda
3. Produce some reports
