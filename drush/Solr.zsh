local-solr () {
  # Start a Solr server on your local machine.
  cd /path/to/solr-x.x.x/example && java -jar start.jar
}

local-solr-multicore () {
  # Same, but for a multicore setup.
  cd /path/to/solr-x.x.x/example && java -Dsolr.solr.home=multicore -jar start.jar
}
