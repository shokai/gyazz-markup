gyazz-markup
============
convert Gyazz.com syntax to HTML.

* https://github.com/shokai/gyazz-markup


Installation
------------

    % gem install gyazz-markup


Usage
-----

```ruby
require 'rubygems'
require 'gyazz-markup'
puts GyazzMarkup.markup(open("input.txt").read)
```

or

```ruby
puts GyazzMarkup.markup(open("input.txt").read, "shokai")
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
