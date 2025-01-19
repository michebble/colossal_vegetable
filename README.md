# Colossal Vegetable

## Description

This is a project for experimenting with different Ruby tech.

- RBS, Steep, & RBS-inline for typing
- Overcommit for managing githooks
- Minitest for testing
- Foreman for watching file to run specs and generating rbs files
- Bundler for organising and running gems

Also, this project will let me play with the structural organisation.

The project itself if for loading data into a model, performing actions on it, and then presenting it to the result. Initially this will be a cli app, but I would like to expand the scope to GUI and web server in the future.

## CLI application

The cli is run with `bin/cli` followed by the action; `search <search-term>`. This will search the name value of the clients to find those that partial match the search-term.

Later there will be flags to specify further behaviours, such as data source, output format, resource model.

## Development

The required Ruby version is 3.4.1 as defined in [.tool-versions](.tool-versions).

Once the project has been cloned, run `bundle install` to ensure the required gems are present for the project.

Tests can then be run with `bin/test`

Running `bin/forman start` will start processes to watch for file changes and either generate type signature files, or run tests. This will require fswatch to be present on the system.
