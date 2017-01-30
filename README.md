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

     docker run -t --name explore-drug-database vanessa/explore-drug-database

You will want to use the `-t` argument to ensure that any kill signals (eg, Control C) to stop the server are sent to the container. The `--name` argument will make it easy to stop and remove the container:

        docker stop explore-drug-database
        docker rm explore-drug-database

Otherwise, you will need to find the id for your container with `docker ps` and then replace the name above with that id.

Running the container, after the content builds, will tell you the address to open in your browser. What you will see happen is a redirect to port `9999` on that address. This is a simple and stupid strategy, actually. The web content is being served by python's [Simple http server](https://docs.python.org/2/library/simplehttpserver.html), and a page to redirect to this address is written on the fly in [run.sh](run.sh). If you want to build the container yourself:

     docker build -t vanessa/explore-drug-database .

or run with an interactive shell into it, to poke around:

     docker run -it vanessa/explore-drug-database bash

There are many ways to skin a cat, and there are many ways to deploy static web content via a container. This is just one!


# General steps for R analysis

1. Import the data
2. Save as Rda
3. Produce some reports
