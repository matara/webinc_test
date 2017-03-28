# Hot to use:

## Setup

1. Install bundler `gem install bundler`
2. Install dependencies: `bundle install`

## Usage
  
Read from file: 
* `bundle exec ruby cli.rb calculate_ranking_table sample-input.txt`

Manual input:
* `bundle exec ruby cli.rb calculate_ranking_table`
* `cat sample-input.txt | bundle exec ruby cli.rb calculate_ranking_table`
* `bundle exec ruby cli.rb calculate_ranking_table < sample-input.txt`
  
## Tests
  
Run tests: `bundle exec rake`
