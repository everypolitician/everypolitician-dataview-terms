# EveryPolitician Dataview Terms

Given an EveryPolitician Popolo file, this produces a simplified view of
each Term (Legislative Period) as CSV data.

This library is primarily for internal use in generating the term CSV files
that are included in the
[everypolitician-data](https://github.com/everypolitician/everypolitician-data)
repository. If you want to use this view of the data, you're almost
certainly going to be better getting those files directly from there.
See http://docs.everypolitician.org/technical.html for more information
on the different file formats we provide.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'everypolitician-dataview-terms', github: 'everypolitician/everypolitician-dataview-terms'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'everypolitician/dataview/terms'
view = EveryPolitician::Dataview::Terms.new(
  popolo: EveryPolitician::Popolo.read('popolo.json')
)

view.terms.each do |term|
  id   = term.id
  text = term.as_csv
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/everypolitician-dataview-terms

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
