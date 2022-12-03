-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-12-03 15:36:30
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
(110, 5, ' 忘改 git config user，用公司邮箱提交到私人的github，如何挽救？', '各位打工人一定遇到过这种情况：电脑上存了一些公司代码，也存了一些私人代码（可能放在github上）。', 0, 0, '值得一看', 'http://blogs.xiaxianxian.top/toplic/20221122/c8b7c5b44ef7aac0d7a7572cb48dd72d.jpg', NULL, 0, 'icon-redu', 1669099781, 1669099781, NULL, 'icon-bolanggu', 'icon--', 'icon-yiziB', 'icon-biaoqing'),
(116, 5, ' 盘点Vue2和Vue3的10种组件通信方式', 'Vue中组件通信方式有很多，其中Vue2和Vue3实现起来也会有很多差异；本文将通过选项式API 组合式API以及setup三种不同实现方式全面介绍Vue2和Vue3的组件通信方式。其中将要实现的通信方式如下表所示', 0, 0, '值得一看', 'http://blogs.xiaxianxian.top/toplic/20221124/d4e71759c6690724fc13ba4d493a271c.jpg', NULL, 0, 'icon-yuan_huangguan', 1669222028, 1669222028, NULL, 'icon-bolanggu', 'icon--', 'icon-yuan_huangguan', 'icon-biaoqing');

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
(89, 5, 116, '<p><strong>Vue中组件通信方式有很多</strong>，其中Vue2和Vue3实现起来也会有很多差异；本文将通过选项式API 组合式API以及setup三种不同实现方式全面介绍Vue2和Vue3的组件通信方式。其中将要实现的通信方式如下表所示</p><table><thead><tr><th>方式</th><th>Vue2</th><th>Vue3</th></tr></thead><tbody><tr><td>父传子</td><td>props</td><td>props</td></tr><tr><td>子传父</td><td>$emit</td><td>props</td></tr><tr><td>父传子</td><td>$attrs</td><td>attrs</td></tr><tr><td>子传父</td><td>$listeners</td><td>无(合并到 attrs方式)</td></tr><tr><td>父传子</td><td>provide/inject</td><td>provide/inject</td></tr><tr><td>子组件访问父组件</td><td>$parent</td><td>无</td></tr><tr><td>父组件访问子组件</td><td>$children</td><td>无</td></tr><tr><td>父组件访问子组件</td><td>$ref</td><td>expose&amp;ref</td></tr><tr><td>兄弟传值</td><td>EventBus</td><td>mitt</td></tr></tbody></table><p><strong>props</strong><br />props是组件通信中最常用的通信方式之一。父组件通过v-bind传入，子组件通过props接收，下面是它的三种实现方式</p><ul><li>选项式API<br />//父组件</li></ul><pre><div class=\"hljs\"><code class=\"lang-js\">&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> <span class=\"hljs-attr\">:msg</span>=<span class=\"hljs-string\">\"parentMsg\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child\'</span><span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> {  <span class=\"hljs-attr\">components</span>:{    Child  },  data() {    <span class=\"hljs-keyword\">return</span> {      <span class=\"hljs-attr\">parentMsg</span>: <span class=\"hljs-string\">\'父组件信息\'</span>    }  }}&lt;<span class=\"hljs-regexp\">/script&gt; /</span><span class=\"hljs-regexp\">/子组件&lt;template&gt;  &lt;div&gt;    {{msg}}  &lt;/</span>div&gt;<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> {  <span class=\"hljs-attr\">props</span>:[<span class=\"hljs-string\">\'msg\'</span>]}&lt;<span class=\"hljs-regexp\">/script&gt;</span></code></div></pre><p>-组合式Api</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> <span class=\"hljs-attr\">:msg</span>=<span class=\"hljs-string\">\"parentMsg\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> { ref,defineComponent } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'vue\'</span><span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child.vue\'</span><span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> defineComponent({  <span class=\"hljs-attr\">components</span>:{    Child  },  setup() {    <span class=\"hljs-keyword\">const</span> parentMsg = ref(<span class=\"hljs-string\">\'父组件信息\'</span>)    <span class=\"hljs-keyword\">return</span> {      parentMsg    };  },});<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">script</span>&gt;</span></span> <span class=\"hljs-comment\">//子组件</span>&lt;template&gt;    <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>        {{ parentMsg }}    <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>&lt;<span class=\"hljs-regexp\">/template&gt;&lt;script&gt;import { defineComponent,toRef } from \"vue\";export default defineComponent({    props: [\"msg\"],/</span><span class=\"hljs-regexp\">/ 如果这行不写，下面就接收不到    setup(props) {        console.log(props.msg) /</span><span class=\"hljs-regexp\">/父组件信息        let parentMsg = toRef(props, \'msg\')        return {            parentMsg        };    },});&lt;/</span>script&gt;</code></div></pre><p><strong>setup语法糖</strong></p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> <span class=\"hljs-attr\">:msg</span>=<span class=\"hljs-string\">\"parentMsg\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script setup&gt;<span class=\"hljs-keyword\">import</span> { ref } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'vue\'</span><span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child.vue\'</span><span class=\"hljs-keyword\">const</span> parentMsg = ref(<span class=\"hljs-string\">\'父组件信息\'</span>)&lt;<span class=\"hljs-regexp\">/script&gt; /</span><span class=\"hljs-regexp\">/子组件&lt;template&gt;    &lt;div&gt;        {{ parentMsg }}    &lt;/</span>div&gt;<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script setup&gt;<span class=\"hljs-keyword\">import</span> { toRef, defineProps } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"vue\"</span>;<span class=\"hljs-keyword\">const</span> props = defineProps([<span class=\"hljs-string\">\"msg\"</span>]);<span class=\"hljs-built_in\">console</span>.log(props.msg) <span class=\"hljs-comment\">//父组件信息</span><span class=\"hljs-keyword\">let</span> parentMsg = toRef(props, <span class=\"hljs-string\">\'msg\'</span>)&lt;<span class=\"hljs-regexp\">/script&gt;</span></code></div></pre><h2>注意</h2><p><strong>1.1</strong> props中数据流是单项的，即子组件不可改变父组件传来的值</p><p><strong>1.2</strong> 在组合式API中，如果想在子组件中用其它变量接收props的值时需要使用toRef将props中的属性转为响应式。</p><p><strong>1.3</strong> emit<br />子组件可以通过emit发布一个事件并传递一些参数，父组件通过v-on进行这个事件的监听</p><p>-选项式API</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> @<span class=\"hljs-attr\">sendMsg</span>=<span class=\"hljs-string\">\"getFromChild\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child\'</span><span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> {  <span class=\"hljs-attr\">components</span>:{    Child  },  <span class=\"hljs-attr\">methods</span>: {    getFromChild(val) {      <span class=\"hljs-built_in\">console</span>.log(val) <span class=\"hljs-comment\">//我是子组件数据</span>    }  }}&lt;<span class=\"hljs-regexp\">/script&gt; /</span><span class=\"hljs-regexp\">/ 子组件&lt;template&gt;  &lt;div&gt;    &lt;button @click=\"sendFun\"&gt;send&lt;/</span>button&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>&lt;<span class=\"hljs-regexp\">/template&gt;&lt;script&gt;export default {  methods:{    sendFun(){      this.$emit(\'sendMsg\',\'我是子组件数据\')    }  }}&lt;/</span>script&gt;</code></div></pre><p>-组合式Api</p><pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-comment\">//父组件</span>&lt;template&gt;  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">Child</span> @<span class=\"hljs-attr\">sendMsg</span>=<span class=\"hljs-string\">\"getFromChild\"</span> /&gt;</span>  <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span></span>&lt;script&gt;<span class=\"hljs-keyword\">import</span> Child <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./Child\'</span><span class=\"hljs-keyword\">import</span> { defineComponent } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"vue\"</span>;<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">default</span> defineComponent({  <span class=\"hljs-attr\">components</span>: {    Child  },  setup() {    <span class=\"hljs-keyword\">const</span> getFromChild = <span class=\"hljs-function\">(<span class=\"hljs-params\">val</span>) =&gt;</span> {      <span class=\"hljs-built_in\">console</span>.log(val) <span class=\"hljs-comment\">//我是子组件数据</span>    }    <span class=\"hljs-keyword\">return</span> {      getFromChild    };  },});<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">script</span>&gt;</span></span> <span class=\"hljs-comment\">//子组件</span>&lt;template&gt;    <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>        <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">button</span> @<span class=\"hljs-attr\">click</span>=<span class=\"hljs-string\">\"sendFun\"</span>&gt;</span>send<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">button</span>&gt;</span>    <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>&lt;<span class=\"hljs-regexp\">/template&gt; &lt;script&gt;import { defineComponent } from \"vue\";export default defineComponent({    emits: [\'sendMsg\'],    setup(props, ctx) {        const sendFun = () =&gt; {            ctx.emit(\'sendMsg\', \'我是子组件数据\')        }        return {            sendFun        };    },});&lt;/</span>script&gt;</code></div></pre>', '', '', 1669222028, 1669222028, NULL);

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
(37, 5, '请输入微语', 0, NULL, 1669817330, 1669817330);

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
  `operation` int(11) NOT NULL DEFAULT '0',
  `create_time` varchar(25) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bl_station`
--

INSERT INTO `bl_station` (`id`, `user_count`, `top_article`, `banner_count`, `article_count`, `operation`, `create_time`, `delete_time`, `update_time`) VALUES
(2, 6, 0, 3, 2, 1669099781, '1669099781', NULL, 1669910947);

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
(6, '崔志成', '4297f44b13955235245b2497399d7a93', NULL, 0, 0, 0, 0, 32, NULL, NULL, NULL, 1668420927, NULL, 0),
(5, 'czc1', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221122/c8b7c5b44ef7aac0d7a7572cb48dd72d.jpg', 0, 0, 0, 1, 32, '2598a421a1814609a2aab92692aed587', NULL, 1669888514, 1668420597, '127.0.0.1', 0),
(7, 'admin', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 0, 0, 0, 32, '993107bb7df05a3d927511a4af3efbcc', NULL, 1668427487, 1668420959, '127.0.0.1', 0),
(8, 'czc', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221126/f897d019c58ec976f37d91d96cdcc9f4.jpg', 0, 0, 0, 0, 31, '71bfa8fe230977f8619c345f9ae671c0', NULL, 1669639674, 976693639, '113.65.193.7:6112', 0),
(9, 'czt', '4297f44b13955235245b2497399d7a93', 'http://blogs.xiaxianxian.top/toplic/20221128/21f269d2e0faf2d56b53e2804e846ee6.jpg', 0, 0, 0, 0, 32, '841785ae68e90689542f9b953d998be6', NULL, 1669568501, 1668439389, '127.0.0.1', 0),
(10, 'test', '4297f44b13955235245b2497399d7a93', NULL, 0, 0, 0, 0, 32, NULL, NULL, NULL, 1669428713, NULL, 0);

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
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `bl_article`
--
ALTER TABLE `bl_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- 使用表AUTO_INCREMENT `bl_art_content`
--
ALTER TABLE `bl_art_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- 使用表AUTO_INCREMENT `bl_banner`
--
ALTER TABLE `bl_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- 使用表AUTO_INCREMENT `bl_station`
--
ALTER TABLE `bl_station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `bl_user`
--
ALTER TABLE `bl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
