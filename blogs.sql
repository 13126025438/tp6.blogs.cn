-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-12-09 20:55:13
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blogs`
--

-- --------------------------------------------------------

--
-- 表的结构 `bl_article`
--

CREATE TABLE `bl_article` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_title` varchar(100) NOT NULL,
  `article_detail` varchar(550) NOT NULL,
  `read_count` int(11) NOT NULL DEFAULT '0',
  `is_top` int(11) NOT NULL DEFAULT '0' COMMENT '0正常 1置顶',
  `article_category` varchar(25) NOT NULL,
  `article_img` varchar(200) NOT NULL,
  `article_content` varchar(10000) DEFAULT NULL,
  `article_status` int(11) NOT NULL DEFAULT '0' COMMENT '默认0 公开，1私有',
  `article_read_icon` varchar(25) NOT NULL DEFAULT 'icon-redu' COMMENT '阅读数量icon',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `article_time_icon` varchar(25) NOT NULL DEFAULT 'icon-bolanggu' COMMENT '时间icon',
  `article_class_icon` varchar(25) NOT NULL DEFAULT 'icon--' COMMENT '类icon',
  `article_it_icon` varchar(25) NOT NULL DEFAULT 'icon-konglong' COMMENT '其它icon',
  `article_icon` varchar(25) DEFAULT 'icon-biaoqing' COMMENT 'titie icon'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_article`
--

INSERT INTO `bl_article` (`id`, `user_id`, `article_title`, `article_detail`, `read_count`, `is_top`, `article_category`, `article_img`, `article_content`, `article_status`, `article_read_icon`, `create_time`, `update_time`, `delete_time`, `article_time_icon`, `article_class_icon`, `article_it_icon`, `article_icon`) VALUES
(110, 5, ' 忘改 git config user，用公司邮箱提交到私人的github，如何挽救？', '各位打工人一定遇到过这种情况：电脑上存了一些公司代码，也存了一些私人代码（可能放在github上）。', 1, 0, '值得一看', 'http://blogs.xiaxianxian.top/toplic/20221122/c8b7c5b44ef7aac0d7a7572cb48dd72d.jpg', NULL, 0, 'icon-redu', 1669099781, 1669099781, NULL, 'icon-bolanggu', 'icon--', 'icon-yiziB', 'icon-biaoqing'),
(116, 5, ' 盘点Vue2和Vue3的10种组件通信方式', 'Vue中组件通信方式有很多，其中Vue2和Vue3实现起来也会有很多差异；本文将通过选项式API 组合式API以及setup三种不同实现方式全面介绍Vue2和Vue3的组件通信方式。其中将要实现的通信方式如下表所示', 2, 0, '值得一看', 'http://blogs.xiaxianxian.top/toplic/20221124/d4e71759c6690724fc13ba4d493a271c.jpg', NULL, 0, 'icon-yuan_huangguan', 1669222028, 1669222028, NULL, 'icon-bolanggu', 'icon--', 'icon-yuan_huangguan', 'icon-biaoqing'),
(124, 8, 'test 测试数据', '1638976938', 1, 0, '每日一练', 'http://blogs.xiaxianxian.top/toplic/20221208/e55724a01cec88ccca3e14666452f9f6.jpg', NULL, 0, 'icon-redu', 1638976938, 1670513026, NULL, 'icon-bolanggu', 'icon--', 'icon-yiziB', 'icon-biaoqing'),
(123, 7, '在 JavaScript 中，什么时候使用 Map 或胜过 Object', '在 JavaScript 中，对象是很方便的。它们允许我们轻松地将多个数据块组合在一起。 在ES6之后，又出了一个新的语言补充— Map。在很多方面，它看起来像是一个功能更强的对象，但接口却有些笨拙。', 3, 0, '值得一看', 'http://blogs.xiaxianxian.top/toplic/20221206/768fb74970bf359f7e6cfe14d673829d.jpg', NULL, 0, 'icon-redu', 1670332440, 1670332440, NULL, 'icon-bolanggu', 'icon--', 'icon-yiziB', 'icon-biaoqing');

-- --------------------------------------------------------

--
-- 表的结构 `bl_art_content`
--

CREATE TABLE `bl_art_content` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL COMMENT 'bl_article 的id',
  `cont_html_txt` varchar(9999) DEFAULT NULL COMMENT 'html 结构文本',
  `cont_md_txt` varchar(9999) DEFAULT NULL COMMENT 'md 文本',
  `cont_md_url` varchar(250) DEFAULT NULL COMMENT 'md 文件 地址',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_art_content`
--

INSERT INTO `bl_art_content` (`id`, `user_id`, `art_id`, `cont_html_txt`, `cont_md_txt`, `cont_md_url`, `create_time`, `update_time`, `delete_time`) VALUES
(86, 5, 110, '<h2>背景</h2>\n<p>各位打工人一定遇到过这种情况：</p>\n<p>电脑上存了一些公司代码，也存了一些私人代码（可能放在github上）。</p>\n<p>在这两种仓库上，需要配置不同的用户信息（用户名和邮箱）。</p>\n<p>针对当前仓库配置用户信息的方式很简单：</p>\n<pre><div class=\"hljs\"><code class=\"lang-js\">git config user.name 名字\ngit config user.email 邮箱\n</code></div></pre>\n<p>针对全局配置默认的用户信息也很简单：</p>\n<pre><div class=\"hljs\"><code class=\"lang-js\">git config --global user.name <span class=\"hljs-string\">\"John Doe\"</span>\ngit config --global user.email johndoe@example.com\n</code></div></pre>\n<p>但确实容易忘记呀。尤其是当你刚clone下来仓库，忘记改信息，就直接 add commit push了，你的用户信息就被放在远端仓库了。很难再改了。</p>\n<p>今天给大家介绍一个方法，可以批量替换 commit 记录中错误的用户信息。根据邮箱来寻找，可以修改为新的用户名和新的邮箱。适用于linux MacOS。</p>\n<h2>操作步骤</h2>\n<h3>第一步</h3>\n<p>cd到git项目目录下。确保当前工作区干净。</p>\n<p>执行以下代码，记得替换邮箱和名字：</p>\n<pre><div class=\"hljs\"><code class=\"lang-js\">git filter-branch --env-filter <span class=\"hljs-string\">\'\n \nOLD_EMAIL=\"错误的邮箱\"\nCORRECT_NAME=\"新的用户名\"\nCORRECT_EMAIL=\"新的邮箱\"\n \nif [ \"$GIT_COMMITTER_EMAIL\" = \"$OLD_EMAIL\" ]\nthen\n    export GIT_COMMITTER_NAME=\"$CORRECT_NAME\"\n    export GIT_COMMITTER_EMAIL=\"$CORRECT_EMAIL\"\nfi\nif [ \"$GIT_AUTHOR_EMAIL\" = \"$OLD_EMAIL\" ]\nthen\n    export GIT_AUTHOR_NAME=\"$CORRECT_NAME\"\n    export GIT_AUTHOR_EMAIL=\"$CORRECT_EMAIL\"\nfi\n\'</span> --tag-name-filter cat -- --branches --tags\n</code></div></pre>\n<p>执行完毕后，会把本地的分支的所有commit信息都替换掉。</p>\n<h4>第二步</h4>\n<p>这时候，由于作者信息变了，对应的commit id也会变更。</p>\n<p>你需要执行git push --force，强制push到远程对应的分支。覆盖掉老的信息。</p>\n<p>建议<br />\n默认邮箱用公司的<br />\n在公司电脑上，设置git默认邮箱为公司邮箱。</p>\n<p>这样的话，每当因为忘记 git config 设置信息出错时，基本只会导致自己的私人仓库出错。执行git push --force的风险，比在公司仓库要小一些，影响相对可控。</p>\n<p>配置alias命令<br />\n如果你用Mac，也用zsh，可以修改~/.zshrc，在后面添加一行：</p>\n<pre><div class=\"hljs\"><code class=\"lang-js\">alias gitself=<span class=\"hljs-string\">\"git config user.email 你的邮箱; git config user.name 你的名字\"</span>\n</code></div></pre>\n<p>保存后执行source ~/.zshrc，使它生效（重启电脑后，就不需要再执行了，因为它会在重启时自动生效）</p>\n<p>这样，以后每次 git clone 私人仓库时，只需要执行gitself，就设置了你在该仓库的信息，比较方便。</p>\n', '', 'blogs.xiaxianxian.top/toplic/20221121/c8b2fba16ae9f84acd6cc4ad95a6e454.md', 1669099781, 1669099781, NULL),
(89, 5, 116, '<p><strong>Vue中组件通信方式有很多</strong>，其中Vue2和Vue3实现起来也会有很多差异；本文将通过选项式API 组合式API以及setup三种不同实现方式全面介绍Vue2和Vue3的组件通信方式。其中将要实现的通信方式如下表所示</p><table><thead><tr><th>方式</th><th>Vue2</th><th>Vue3</th></tr></thead><tbody><tr><td>父传子</td><td>props</td><td>props</td></tr><tr><td>子传父</td><td>$emit</td><td>props</td></tr><tr><td>父传子</td><td>$attrs</td><td>attrs</td></tr><tr><td>子传父</td><td>$listeners</td><td>无(合并到 attrs方式)</td></tr><tr><td>父传子</td><td>provide/inject</td><td>provide/inject</td></tr><tr><td>子组件访问父组件</td><td>$parent</td><td>无</td></tr><tr><td>父组件访问子组件</td><td>$children</td><td>无</td></tr><tr><td>父组件访问子组件</td><td>$ref</td><td>expose&amp;ref</td></tr><tr><td>兄弟传值</td><td>EventBus</td><td>mitt</td></tr></tbody></table><p><strong>props</strong><br />props是组件通信中最常用的通信方式之一。父组件通过v-bind传入，子组件通过props接收，下面是它的三种实现方式</p><ul><li>选项式API<br />//父组件</li></ul><pre><div class=\"hljs\"><code class=\"lang-js\">&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> <span class=\"hljs-attr\">:msg</span>=<span class=\"hljs-string\">\"parentMsg\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child\'</span><span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> {  <span class=\"hljs-attr\">components</span>:{    Child  },  data() {    <span class=\"hljs-keyword\">return</span> {      <span class=\"hljs-attr\">parentMsg</span>: <span class=\"hljs-string\">\'父组件信息\'</span>    }  }}&lt;<span class=\"hljs-regexp\">/script&gt; /</span><span class=\"hljs-regexp\">/子组件&lt;template&gt;  &lt;div&gt;    {{msg}}  &lt;/</span>div&gt;<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> {  <span class=\"hljs-attr\">props</span>:[<span class=\"hljs-string\">\'msg\'</span>]}&lt;<span class=\"hljs-regexp\">/script&gt;</span></code></div></pre><p>-组合式Api</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> <span class=\"hljs-attr\">:msg</span>=<span class=\"hljs-string\">\"parentMsg\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> { ref,defineComponent } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'vue\'</span><span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child.vue\'</span><span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> defineComponent({  <span class=\"hljs-attr\">components</span>:{    Child  },  setup() {    <span class=\"hljs-keyword\">const</span> parentMsg = ref(<span class=\"hljs-string\">\'父组件信息\'</span>)    <span class=\"hljs-keyword\">return</span> {      parentMsg    };  },});<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">script</span>&gt;</span></span> <span class=\"hljs-comment\">//子组件</span>&lt;template&gt;    <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>        {{ parentMsg }}    <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>&lt;<span class=\"hljs-regexp\">/template&gt;&lt;script&gt;import { defineComponent,toRef } from \"vue\";export default defineComponent({    props: [\"msg\"],/</span><span class=\"hljs-regexp\">/ 如果这行不写，下面就接收不到    setup(props) {        console.log(props.msg) /</span><span class=\"hljs-regexp\">/父组件信息        let parentMsg = toRef(props, \'msg\')        return {            parentMsg        };    },});&lt;/</span>script&gt;</code></div></pre><p><strong>setup语法糖</strong></p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> <span class=\"hljs-attr\">:msg</span>=<span class=\"hljs-string\">\"parentMsg\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script setup&gt;<span class=\"hljs-keyword\">import</span> { ref } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'vue\'</span><span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child.vue\'</span><span class=\"hljs-keyword\">const</span> parentMsg = ref(<span class=\"hljs-string\">\'父组件信息\'</span>)&lt;<span class=\"hljs-regexp\">/script&gt; /</span><span class=\"hljs-regexp\">/子组件&lt;template&gt;    &lt;div&gt;        {{ parentMsg }}    &lt;/</span>div&gt;<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script setup&gt;<span class=\"hljs-keyword\">import</span> { toRef, defineProps } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"vue\"</span>;<span class=\"hljs-keyword\">const</span> props = defineProps([<span class=\"hljs-string\">\"msg\"</span>]);<span class=\"hljs-built_in\">console</span>.log(props.msg) <span class=\"hljs-comment\">//父组件信息</span><span class=\"hljs-keyword\">let</span> parentMsg = toRef(props, <span class=\"hljs-string\">\'msg\'</span>)&lt;<span class=\"hljs-regexp\">/script&gt;</span></code></div></pre><h2>注意</h2><p><strong>1.1</strong> props中数据流是单项的，即子组件不可改变父组件传来的值</p><p><strong>1.2</strong> 在组合式API中，如果想在子组件中用其它变量接收props的值时需要使用toRef将props中的属性转为响应式。</p><p><strong>1.3</strong> emit<br />子组件可以通过emit发布一个事件并传递一些参数，父组件通过v-on进行这个事件的监听</p><p>-选项式API</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> @<span class=\"hljs-attr\">sendMsg</span>=<span class=\"hljs-string\">\"getFromChild\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child\'</span><span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> {  <span class=\"hljs-attr\">components</span>:{    Child  },  <span class=\"hljs-attr\">methods</span>: {    getFromChild(val) {      <span class=\"hljs-built_in\">console</span>.log(val) <span class=\"hljs-comment\">//我是子组件数据</span>    }  }}&lt;<span class=\"hljs-regexp\">/script&gt; /</span><span class=\"hljs-regexp\">/ 子组件&lt;template&gt;  &lt;div&gt;    &lt;button @click=\"sendFun\"&gt;send&lt;/</span>button&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>&lt;<span class=\"hljs-regexp\">/template&gt;&lt;script&gt;export default {  methods:{    sendFun(){      this.$emit(\'sendMsg\',\'我是子组件数据\')    }  }}&lt;/</span>script&gt;</code></div></pre><p>-组合式Api</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> @<span class=\"hljs-attr\">sendMsg</span>=<span class=\"hljs-string\">\"getFromChild\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child\'</span><span class=\"hljs-keyword\">import</span> { defineComponent } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"vue\"</span>;<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> defineComponent({  <span class=\"hljs-attr\">components</span>: {    Child  },  setup() {    <span class=\"hljs-keyword\">const</span> getFromChild = <span class=\"hljs-function\">(<span class=\"hljs-params\">val</span>) =&gt;</span> {      <span class=\"hljs-built_in\">console</span>.log(val) <span class=\"hljs-comment\">//我是子组件数据</span>    }    <span class=\"hljs-keyword\">return</span> {      getFromChild    };  },});<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">script</span>&gt;</span></span> <span class=\"hljs-comment\">//子组件</span>&lt;template&gt;    <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>        <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">button</span> @<span class=\"hljs-attr\">click</span>=<span class=\"hljs-string\">\"sendFun\"</span>&gt;</span>send<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">button</span>&gt;</span>    <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>&lt;<span class=\"hljs-regexp\">/template&gt; &lt;script&gt;import { defineComponent } from \"vue\";export default defineComponent({    emits: [\'sendMsg\'],    setup(props, ctx) {        const sendFun = () =&gt; {            ctx.emit(\'sendMsg\', \'我是子组件数据\')        }        return {            sendFun        };    },});&lt;/</span>script&gt;</code></div></pre>', '', '', 1669222028, 1669222028, NULL),
(92, 8, 124, '飞弹发射', '', '', 1670513026, 1670513026, NULL),
(93, 7, 125, '分类测试', '', '', 1670589927, 1670589927, NULL),
(94, 7, 126, '分类测试ThinkPHP6', '', '', 1670589976, 1670589976, NULL),
(95, 7, 127, '分类测试ThinkPHP6', '', '', 1670590015, 1670590015, NULL),
(96, 7, 128, '分类测试ThinkPHP6', '', '', 1670590022, 1670590022, NULL),
(97, 7, 129, '分类测试ThinkPHP6', '', '', 1670590025, 1670590025, NULL),
(98, 7, 130, '分类测试ThinkPHP6', '', '', 1670590029, 1670590029, NULL),
(99, 7, 131, '分类测试ThinkPHP6', '', '', 1670590051, 1670590051, NULL),
(100, 7, 132, '分类测试ThinkPHP6', '', '', 1670590097, 1670590097, NULL),
(91, 7, 123, '<pre><div class=\"hljs\"><code class=\"lang-js\">在 JavaScript 中，对象是很方便的。它们允许我们轻松地将多个数据块组合在一起。 在ES6之后，又出了一个新的语言补充— <span class=\"hljs-built_in\">Map</span>。在很多方面，它看起来像是一个功能更强的对象，但接口却有些笨拙</code></div></pre><ol><li>** 然而**，大多数开发者在需要 hash map 的时候还是会使用对象，只有当他们意识到键值不能只是字符串的时候才会转而使用 Map。因此，Map 在当今的 JavaScript 社区中仍然没有得到充分的使用。</li></ol><p>在本文本中，我会列举一些应该更多考虑使用 Map 的一些原因。</p><p>为什么对象不符合 Hash Map 的使用情况<br />在 Hash Map 中使用对象最明显的缺点是，对象只允许键是字符串和 symbol。任何其他类型的键都会通过 toString 方法被隐含地转换为字符串。</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-keyword\">const</span> foo = []<span class=\"hljs-keyword\">const</span> bar = {}<span class=\"hljs-keyword\">const</span> obj = {[foo]: <span class=\"hljs-string\">\'foo\'</span>, [bar]: <span class=\"hljs-string\">\'bar\'</span>} <span class=\"hljs-built_in\">console</span>.log(obj) <span class=\"hljs-comment\">// {\"\": \'foo\', [object Object]: \'bar\'}</span>        <span class=\"hljs-comment\">//更重要的是，使用对象做 Hash Map 会造成混乱和安全隐患。</span><span class=\"hljs-comment\">//不必要的继承</span><span class=\"hljs-comment\">//在ES6之前，获得 hash map 的唯一方法是创建一个空对象：</span><span class=\"hljs-keyword\">const</span> hashMap = {}</code></div></pre><ol start=\"2\"><li>然而，在创建时，这个对象不再是空的。尽管 hashMap 是用一个空的对象字面量创建的，但它自动继承了 Object.prototype。这就是为什么我们可以在 hashMap 上调用hasOwnProperty、toString、constructor 等方法，尽管我们从未在该对象上明确定义这些方法。</li></ol><p>由于原型继承，我们现在有两种类型的属性被混淆了：存在于对象本身的属性，即它自己的属性，以及存在于原型链的属性，即继承的属性。</p><p>因此，我们需要一个额外的检查（例如hasOwnProperty）来确保一个给定的属性确实是用户提供的，而不是从原型继承的。</p><p>除此之外，由于属性解析机制在 JavaScrip t中的工作方式，在运行时对 Object.prototype 的任何改变都会在所有对象中引起连锁反应。这就为原型污染攻击打开了大门，这对大型的JavaScript 应用程序来说是一个严重的安全问题。</p><p>不过，我们可以通过使用 Object.create(null) 来解决这个问题，它可以生成一个不继承Object.prototype的对象。</p><p>名称冲突<br />当一个对象自己的属性与它的原型上的属性有名称冲突时，它就会打破预期，从而使程序崩溃。</p><p>例如，我们有一个函数 foo，它接受一个对象。</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">foo</span>(<span class=\"hljs-params\">obj</span>) </span>{    <span class=\"hljs-comment\">//...</span>    <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">const</span> key <span class=\"hljs-keyword\">in</span> obj) {        <span class=\"hljs-keyword\">if</span> (obj.hasOwnProperty(key)) {         }    }}</code></div></pre><ol start=\"3\"><li>**obj.hasOwnProperty(key)**有一个可靠性风险：考虑到属性解析机制在JavaScript中的工作方式，如果 obj 包含一个开发者提供的具有相同名称的 hasOwnProperty 属性，那就会对Object.prototype.hasOwnProperty产生影响。因此，我们不知道哪个方法会在运行时被准确调用。</li></ol><p>可以做一些防御性编程来防止这种情况。例如，我们可以从 Object.prototype 中 “借用””真正的 hasOwnProperty 来代替:</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">foo</span>(<span class=\"hljs-params\">obj</span>) </span>{    <span class=\"hljs-comment\">//...</span>    <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">const</span> key <span class=\"hljs-keyword\">in</span> obj) {        <span class=\"hljs-keyword\">if</span> (<span class=\"hljs-built_in\">Object</span>.prototype.hasOwnProperty.call(obj, key)) {            <span class=\"hljs-comment\">// ...</span>        }    }}</code></div></pre><p>还有一个更简短的方法就是在一个对象的字面量上调用该方法，如{}.hasOwnProperty.call(key)，不过这也挺麻烦的。这就是为什么还会新出一个静态方法Object.hasOwn 的原因了。</p><p>次优的人机工程学<br />Object 没有提供足够的人机工程学，不能作为 hash map 使用，许多常见的任务不能直观地执行。</p><p>size<br />Object 并没有提供方便的API来获取 size，即属性的数量。而且，对于什么是一个对象的 size ，还有一些细微的差别:</p><p>如果只关心字符串、可枚举的键，那么可以用 Object.keys() 将键转换为数组，并获得其length<br />如果k只想要不可枚举的字符串键，那么必须得使用 Object.getOwnPropertyNames 来获得一个键的列表并获得其 length<br />如果只对 symbol 键感兴趣，可以使用 getOwnPropertySymbols 来显示 symbol 键。或者可以使用 Reflect.ownKeys 来一次获得字符串键和 symbol 键，不管它是否是可枚举的。<br />上述所有选项的运行时复杂度为O(n)，因为我们必须先构造一个键的数组，然后才能得到其长度。</p><p>iterate<br />循环遍历对象也有类似的复杂性</p><p>我们可以使用 for…in循环。但它会读取到继承的可枚举属性。</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-built_in\">Object</span>.prototype.foo = <span class=\"hljs-string\">\'bar\'</span> <span class=\"hljs-keyword\">const</span> obj = {<span class=\"hljs-attr\">id</span>: <span class=\"hljs-number\">1</span>}  <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">const</span> key <span class=\"hljs-keyword\">in</span> obj) {    <span class=\"hljs-built_in\">console</span>.log(key) <span class=\"hljs-comment\">// \'id\', \'foo\'</span>}</code></div></pre><p>我们不能对一个对象使用 for … of，因为默认情况下它不是一个可迭代的对象，除非我们明确定义 Symbol.iterator 方法在它上面。</p><p>我们可以使用 Object.keys、Object.values 和 Object.entry来获得一个可枚举的字符串键（或/和值）的列表，并通过该列表进行迭代，这引入了一个额外的开销步骤。</p><p>还有一个是 插入对象的键的顺序并不是按我们的顺序来的，这是一个很蛋疼的地方。在大多数浏览器中，整数键是按升序排序的，并优先于字符串键，即使字符串键是在整数键之前插入的：</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-keyword\">const</span> obj = {} obj.foo = <span class=\"hljs-string\">\'first\'</span>obj[<span class=\"hljs-number\">2</span>] = <span class=\"hljs-string\">\'second\'</span>obj[<span class=\"hljs-number\">1</span>] = <span class=\"hljs-string\">\'last\'</span> <span class=\"hljs-built_in\">console</span>.log(obj) <span class=\"hljs-comment\">// {1: \'last\', 2: \'second\', foo: \'first\'}</span></code></div></pre>', '', '', 1670332440, 1670332440, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bl_banner`
--

CREATE TABLE `bl_banner` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dictum` varchar(900) NOT NULL COMMENT '言语',
  `banner_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 公开 ，1 私人',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微雨 / 留言';

--
-- 转存表中的数据 `bl_banner`
--

INSERT INTO `bl_banner` (`id`, `user_id`, `dictum`, `banner_status`, `delete_time`, `create_time`, `update_time`) VALUES
(1, 5, '只恐双溪舴艋舟 载不动许多愁.', 0, NULL, 1669099781, 1669099781),
(2, 8, '行万里路，肝万卷码，掉万里发', 0, NULL, NULL, NULL),
(38, 5, '你还需要努力', 0, NULL, 1670333047, 1670333047),
(37, 5, '请输入微语', 0, NULL, 1669817330, 1669817330);

-- --------------------------------------------------------

--
-- 表的结构 `bl_comment`
--

CREATE TABLE `bl_comment` (
  `id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL,
  `com_qq` varchar(11) NOT NULL,
  `com_email` varchar(25) NOT NULL,
  `content` varchar(250) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_comment`
--

INSERT INTO `bl_comment` (`id`, `art_id`, `user_id`, `com_qq`, `com_email`, `content`, `create_time`, `delete_time`) VALUES
(10, 116, 5, '', '', '测试评论2', 1670224390, NULL),
(9, 116, 5, '', '', '测试评论', 1670224274, NULL),
(8, 116, 7, '', '', '你做个博客网站用了多久？', 1670156134, NULL),
(7, 116, 5, '', '1987493044@qq.com', '这个模块你也会吗？', 1670155011, NULL),
(16, 116, 8, '', '', '试试', 1670235171, NULL),
(15, 116, 8, '', '', '终于完成评论模块了', 1670234993, NULL),
(17, 110, 8, '', '', '测试评论', 1670235285, NULL),
(18, 1, 1, '', '', '你做个博客网站用了多久？', 1670332661, NULL),
(19, 1, 5, '', '', '你做个博客网站用了多久？', 1670332759, NULL),
(20, 1, 5, '', '', '你做个博客网站用了多久？', 1670332819, NULL),
(21, 0, 5, '', '', '欢迎！！！', 1670530492, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bl_reply`
--

CREATE TABLE `bl_reply` (
  `id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL COMMENT '主评论id（老祖）',
  `reply_uid` int(11) NOT NULL COMMENT '回复 用户的id',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `reply_qq` int(11) DEFAULT NULL,
  `reply_email` varchar(25) DEFAULT NULL,
  `content` varchar(250) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_reply`
--

INSERT INTO `bl_reply` (`id`, `com_id`, `reply_uid`, `user_id`, `reply_qq`, `reply_email`, `content`, `create_time`, `delete_time`) VALUES
(3, 8, 7, 9, 0, '', '热闹热闹', 1670159831, NULL),
(2, 7, 5, 8, 0, '', '肯定会呀 这么简单', 1670154858, NULL),
(4, 8, 7, 10, 0, '', '热闹热闹', 1670159925, NULL),
(5, 8, 10, 6, 0, '', '回复4', 1670162295, NULL),
(6, 8, 10, 6, 0, '', '回复4', 1670162387, NULL),
(8, 8, 9, 8, 0, '', '三天', 1670232145, NULL),
(9, 7, 8, 8, 0, '', '这么厉害吗？', 1670232370, NULL),
(10, 7, 5, 8, 0, '', '别听他吹', 1670232397, NULL),
(11, 10, 5, 8, 0, '', '子ddd', 1670232675, NULL),
(12, 10, 8, 8, 0, '', '子ddd', 1670232682, NULL),
(13, 10, 5, 8, 0, '', '是', 1670235188, NULL),
(14, 8, 4, 6, 0, '', '回复4', 1670332923, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bl_station`
--

CREATE TABLE `bl_station` (
  `id` int(11) NOT NULL,
  `user_count` int(11) DEFAULT '0',
  `top_article` int(11) DEFAULT NULL,
  `banner_count` int(11) NOT NULL DEFAULT '0',
  `article_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `operation` int(11) NOT NULL DEFAULT '0',
  `create_time` varchar(25) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_station`
--

INSERT INTO `bl_station` (`id`, `user_count`, `top_article`, `banner_count`, `article_count`, `comment_count`, `operation`, `create_time`, `delete_time`, `update_time`) VALUES
(2, 10, 0, 4, 4, 23, 1669099781, '1669099781', NULL, 1670590399);

-- --------------------------------------------------------

--
-- 表的结构 `bl_user`
--

CREATE TABLE `bl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_img` varchar(250) DEFAULT 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg',
  `user_article` int(11) NOT NULL DEFAULT '0',
  `user_comment` int(11) NOT NULL DEFAULT '0',
  `user_banner` int(11) NOT NULL DEFAULT '0',
  `user_role` int(11) NOT NULL DEFAULT '0' COMMENT '0用户 1站长 2 游客',
  `scope` int(11) NOT NULL DEFAULT '32',
  `last_token` varchar(250) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `last_ip` varchar(250) DEFAULT NULL,
  `access_count` int(11) NOT NULL DEFAULT '0' COMMENT '访问量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_user`
--

INSERT INTO `bl_user` (`id`, `username`, `password`, `user_img`, `user_article`, `user_comment`, `user_banner`, `user_role`, `scope`, `last_token`, `delete_time`, `last_time`, `create_time`, `last_ip`, `access_count`) VALUES
(6, '崔志成', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 1, 0, 0, 32, NULL, NULL, NULL, 1668420927, NULL, 0),
(5, 'czc1', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221122/c8b7c5b44ef7aac0d7a7572cb48dd72d.jpg', 2, 2, 1, 1, 32, '9fc0ab7e325bdb6a9658d60b4cdee336', NULL, 1670589796, 1668420597, '127.0.0.1', 0),
(7, 'admin', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 9, 0, 0, 0, 32, 'c65f134cfa88ff57763a140d93c048e0', NULL, 1670589805, 1668420959, '127.0.0.1', 0),
(8, 'czc', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 1, 0, 0, 0, 31, '8207c97ca40b8ed70f16f66be6b6be55', NULL, 1670512972, 976693639, '127.0.0.1', 0),
(9, 'czt', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221128/21f269d2e0faf2d56b53e2804e846ee6.jpg', 0, 0, 0, 0, 32, '841785ae68e90689542f9b953d998be6', NULL, 1669568501, 1668439389, '127.0.0.1', 0),
(10, 'test', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221128/21f269d2e0faf2d56b53e2804e846ee6.jpg', 0, 0, 0, 0, 32, NULL, NULL, NULL, 1669428713, NULL, 0),
(11, 'xxx', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 0, 0, 0, 32, NULL, NULL, NULL, 1670530808, NULL, 0),
(12, 'sfa', '199eee3e44c074f7b308e852a02ce92f', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 0, 0, 0, 32, NULL, NULL, NULL, 1670531735, NULL, 0),
(13, 'test3', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 0, 0, 0, 32, NULL, NULL, NULL, 1670531843, NULL, 0),
(14, 'ddd', '338d811d532553557ca33be45b6bde55', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 0, 0, 0, 32, NULL, NULL, NULL, 1670531902, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bl_visit_ip`
--

CREATE TABLE `bl_visit_ip` (
  `id` int(11) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问者ip记录';

--
-- 转存表中的数据 `bl_visit_ip`
--

INSERT INTO `bl_visit_ip` (`id`, `ip`, `create_time`, `delete_time`, `update_time`) VALUES
(1, '127.0.0.1', '1670501085', NULL, 1670512335);

--
-- 转储表的索引
--

--
-- 表的索引 `bl_article`
--
ALTER TABLE `bl_article`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_art_content`
--
ALTER TABLE `bl_art_content`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_banner`
--
ALTER TABLE `bl_banner`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_comment`
--
ALTER TABLE `bl_comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_reply`
--
ALTER TABLE `bl_reply`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_station`
--
ALTER TABLE `bl_station`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_user`
--
ALTER TABLE `bl_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bl_visit_ip`
--
ALTER TABLE `bl_visit_ip`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `bl_article`
--
ALTER TABLE `bl_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- 使用表AUTO_INCREMENT `bl_art_content`
--
ALTER TABLE `bl_art_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用表AUTO_INCREMENT `bl_banner`
--
ALTER TABLE `bl_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用表AUTO_INCREMENT `bl_comment`
--
ALTER TABLE `bl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `bl_reply`
--
ALTER TABLE `bl_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `bl_station`
--
ALTER TABLE `bl_station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `bl_user`
--
ALTER TABLE `bl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `bl_visit_ip`
--
ALTER TABLE `bl_visit_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
