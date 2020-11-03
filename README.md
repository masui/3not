<h1>3not問題</h2>

<a href="https://www.facebook.com/yoshiyasu.takefuji/posts/1369615029912331"><img src="https://gyazo.com/03e5ddd609bf392dd7ee655bc5750504.png"></a>

<ul>
  <li>総当たりで頑張って計算すると解けるようだ</li>
  <li><code>01010101</code>, <code>00110011</code>, <code>00001111</code>からand/or/notで計算できるパタンを全部数えあげる</li>
  <li>notは2回だけしか使わない</li>
</ul>

<h2>計算方法</h2>

<ul>
  <li><code>% ruby 3not.rb > out.rb</code></li>
  <li><code>% ruby out.rb</code></li>
</ul>

<h2>アルゴリズム解説</h2>
<ul>
  <li>入力A〜Cは<code>000</code>から<code>111</code>までの8パタンがある</li>
  <li><code>000</code>から<code>111</code>までのそれぞれに対してどういう出力が出るかというパタンを考える</li>
  <li>入力Aそのままだとパタンは<code>01010101</code>になる</li>
  <li>入力Bは<code>00110011</code></li>, 入力Cは<code>00001111</code></li>
  <li>これらのみっつに対してnot, and, orを適用して not(A), not(B), not(C)を出力できればいい</li>
</ul>
