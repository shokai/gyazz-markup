gyazz-markup
============
convert Gyazz.com syntax to HTML.

* https://github.com/shokai/gyazz-markup
* http://gyazz.com/増井/Gyazz記法


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

gyazz-markup command
--------------------

    % cat samples/sample.txt

```
[[http://gyazo.com/f7b9ad3035e91e7c9d91aaa082ddb7f2.png]] こうすると、画像が入れられます
[[[強く表示]]]
新しいページへのリンクも作れる → [[ごはん]]
URLをリンク [[https://github.com/shokai/gyazz-markup]]
タイトル付きリンク [[http://shokai.org 私のホームページ]]
画像つきURLリンク [[https://shokai.org http://gyazo.com/b2c551db20c7ef6ad598b89e66be6517.png]]
wikilink [[shokai::かずすけ]]
インデント
 aaa
  aaa1
   aaa2
 bbb
  bbb2
```

    % gyazz-markup --help
    % gyazz-markup -i samples/sample.txt

<img src="http://shokai.org/archive/file/780a435810de562eed7fc4be802ca180.png">


Test
----

    % gem install bundler
    % bundle install
    % rake test


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
