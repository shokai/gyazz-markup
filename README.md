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

    % gyazz-markup samples/sample.txt

<style type="text/css">
.gyazz_indent0{ margin-left : 0px; }
.gyazz_indent1{ margin-left : 20px; }
.gyazz_indent2{ margin-left : 40px; }
.gyazz_indent3{ margin-left : 60px; }
.gyazz_indent4{ margin-left : 80px; }
.gyazz_indent5{ margin-left : 100px; }
</style>
<div class="gyazz_indent0"><a href="http://gyazo.com/f7b9ad3035e91e7c9d91aaa082ddb7f2.png"><img src="http://gyazo.com/f7b9ad3035e91e7c9d91aaa082ddb7f2.png"></a> こうすると、画像が入れられます</div>
<div class="gyazz_indent0"><strong>強く表示</strong></div>
<div class="gyazz_indent0">新しいページへのリンクも作れる → <a href="http://gyazz.com/test/ごはん">ごはん</a></div>
<div class="gyazz_indent0">URLをリンク <a href="https://github.com/shokai/gyazz-markup">https://github.com/shokai/gyazz-markup</a></div>
<div class="gyazz_indent0">タイトル付きリンク <a href="http://shokai.org">私のホームページ</a></div>
<div class="gyazz_indent0">画像つきURLリンク <a href="https://shokai.org"><img src="http://gyazo.com/b2c551db20c7ef6ad598b89e66be6517.png"></a></div>
<div class="gyazz_indent0">wikilink <a href="http://gyazz.com/shokai/">shokai</a>::<a href="http://gyazz.com/shokai/かずすけ">かずすけ</a></div>
<div class="gyazz_indent0">インデント</div>
<div class="gyazz_indent1">aaa</div>
<div class="gyazz_indent2">aaa1</div>
<div class="gyazz_indent3">aaa2</div>
<div class="gyazz_indent1">bbb</div>
<div class="gyazz_indent2">bbb2</div>


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
