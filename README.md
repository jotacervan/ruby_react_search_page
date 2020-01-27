# Spocket Search Page
### Development

Want to contribute? Great!
The application requires Ruby on Rails, Postgres, React and ElasticSearch to run.

Install the dependencies.

```sh
$ cd ruby_react_search_page
$ bundle install
$ yarn install
```

Start elasticsearch server. If you don't have one you can use docker to start:

```sh
$ docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.5.2
```

Create, migrate, seed database and start the server.

```sh
$ rails db:create db:migrate db:seed
```

Execute the initial task to setup the environment:
```sh
rails search_page:initial_task
```

Start your server:
```sh
rails s
```

### Todos

Execute the command below to run the tests.

```sh
rspec spec
```


### Todos

 - Finish elasticsearch tests.
 - Create user authentication.
 - Create page to manage products, countries and tags.
 - Dockerize the application.
 - Finish price filters and sorting options.
 - Move callbacks to create the report view to a Job.

License
----

MIT

**Free Software, Hell Yeah!**

   

