# App Overview

Lexi is a command line application that helps users find the meanings for slang words and phrases from the crowdsourced online dictionary, https://www.urbandictionary.com/.  The app takes a user supplied word or phrase, looks it up in the dictionary and returns the word's meaning.

## Built With

Ruby version ???
ActiveRecord version ???
SQLite3

### Directory Structure(subset)

      .bin
        run.rb
        launches app, makes initial method calls
      .db
        development.db
        schema.rb
        seeds.rb
        migrate
           20190528223210_create_user_table.rb
           20190528234319_create_user_words_table.rb
           20190528234447_create_words_table.rb
           20190529203520_add_created_by_column_to_word_table.rb
      .lib
        api_communicator.rb
          grabs data from usrbandictionary.com and passes in a user-specified word as a query argument
        command_line_interface.rb
          welcomes user, prompts for info
          contains most of logic for the UI
        user.rb
          id, name
          has_many :user_words
          has_many :words, through: :user_words
        word.rb
          id, headword, definition, example,
          belongs_to :userword
        user_word.rb
          join: user_id, word_id
          belongs_to :user
          belongs_to :word


## prerequisites

###install gems

        command_line_prompt> bundle install
        command_line_prompt> gem install rest-client' (if you get a rest client error when you run the app)

###Run migrations to create tables in database

        command_line_prompt> rake db:migrate

### Running the app

        command_line_prompt> ruby bin/run.rb


### Break down user stories

Explain what these tests test and why

```
Give an example
```

### Describe coding logic of note

OTHER STUFF FROM THE TEMPLATE:

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
