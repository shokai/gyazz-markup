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
str = File.open("input.txt").read

gm = GyazzMarkup::Markup.new
puts gm.markup str
```

config
```ruby
gm = GyazzMarkup::Markup.new(:host => 'http://gyazz.com', :wiki => 'shokai')
puts gm.markup str
```


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
