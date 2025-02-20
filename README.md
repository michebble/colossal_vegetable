# Turnip

Formally Colossal Vegetable

## Description

This is a project for experimenting with different Ruby tech.

- RBS, Steep, & RBS-inline for typing
- Overcommit for managing githooks
- Minitest for testing
- Foreman for watching file to run specs and generating rbs files
- Bundler for organising and running gems

Also, this project will let me play with the structural organisation.

The project itself if for loading data into a model, performing actions on it, and then presenting it to the result. Initially this will be a cli app, but I would like to expand the scope to GUI and web server in the future. It is doing too much and probably over complicated, but it's just for fun.

Sample data can be found in the [sample_data](/sample_data/) directory. PLease use it to try out the functionality.

## CLI application

The cli is run with `bin/turnip` followed one of the following actions

### Commands

The commands tell the cli what action to perform on the records

#### Search

Search the records by `full_name`, allows for partial matches and is case insensitive.

```
bin/turnip search <search-term> -i sample_data/clients.json
```

#### Duplicates

Finds all entries with the `email` value duplicated across records.

```
bin/turnip duplicates -i sample_data/clients.json
```

### Options

#### Input

Specifies the location of the JSON file containing the records.
`-i --input=FILENAME`

```
bin/turnip duplicates -i sample_date/staff.json
```

## Development

The required Ruby version is 3.4.1 as defined in [.tool-versions](.tool-versions).

Once the project has been cloned, run `bundle install` to ensure the required gems are present for the project.

Tests can then be run with `bin/rake test`

Running `bin/forman start` will start processes to watch for file changes and either generate type signature files, or run tests. This will require fswatch to be present on the system.
