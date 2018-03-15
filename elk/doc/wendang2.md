kibanna搜索规则

1. 语法关键字

+ - && || ! ( ) { } [ ] ^ " ~ * ? : \
如果所要查询的查询词中本身包含关键字，则需要用\进行转义

2. 查询词(Term)
直接在搜索框搜索balance, cert_no。包含balance 或者 cert_no 都会搜索到
用引号包裹起来"balance, cert_no"表示精确搜索

3. 查询域(Field)
在搜索框中输入 appName:"mortgage-service"

4. 通配符查询(Wildcard)
支持两种通配符：?表示一个字符，*表示多个字符。
在搜索框中输入 cha*name

5. 模糊查询(Fuzzy)
quikc~ brwn~ foks~


6. 临近查询(Proximity)
在搜索框中输入  "order by  asc" ~2 表示这三个单子之间的距离不超过2
order by create_time asc LIMIT 可以被搜索到

7. 区间查询(Range)
区间查询包含两种，一种是包含边界，用[A TO B]指定，一种是不包含边界，用{A TO B}指定。
bytes[1000 TO 10000]   bytes:>100000

8. 增加一个查询词的权重(Boost)
可以在查询词后面加^N来设定此查询词的权重，默认是1，如果N大于1，则说明此查询词更重要，如果N小于1，则说明此查询词更不重要
（图片^2  执行） 包含图片的文档会排在前面

9. 布尔操作符
quick brown +fox -news
fox是必须存在的
news是必须不包含的
quick and brown 是可选的  空格表示或的意思

10. 组合
(quick OR brown) AND fox
status:(active OR pending) title:(full text search)^2



elasticsearch搜索

1. 检索外微nginx日志中响应时间超过5秒的 or 响应码在400~500之间 or  referrer来源不是zhongjiaxin
   按照响应码 和响应时间排序  按照
   
  检索01-10号, 外微nginx日志中响应时间超过5秒的
  request_time:>5 AND @timestamp:>1515542400000
  
  GET  /nginx-app-wechat_waiwei-*/_search
  {
    "query": {
      "bool": {
        "must": [
          {
           "range": {
              "request_time": {
                "gt": 5
              }
            }
          },
          {
            "range": {
              "@timestamp": {
                "gt": 1515542400000
              }
            }
          }
        ]
      }
    }
  }
  
2. 检索01-10号,外微nginx日志中响应时间超过3秒的url,并统计每个url出现的次数

  GET  /nginx-app-wechat_waiwei-2018.01.10/_search
  {
    "size": 0, 
    "query": {
        "bool": {
          "filter": {
             "range": {
               "request_time": {
                 "gte": 5
               }
             }
          }
        }
    },
    "aggs": {
      "url": {
        "terms": {
          "field": "url.keyword"
        }
      }
    }
  }
  
3. 求外微nginx日志中每个url的平均耗时和调用次数以及响应码的占比，按平均时间排序取前5条

select AVG( request_time) as avg_request_time,count(status),url,status from waiwei_nginx GROUP BY url,status order by avg_request_time LIMIT 5

  GET  /nginx-app-wechat_waiwei-*/_search
  {
    "size": 0, 
    "aggs": {
      "url": {
        "terms": {
          "field": "url.keyword",
          "size":"5", 
           "order": {
             "avg_request_time": "desc"
           }
         },
         "aggs": {
           "avg_request_time": {
             "avg": {
               "field": "request_time"
             }
           },
           "status":{
              "terms": {
                "field": "status"
              }
           }
          }
      }
    }
  }
  
  
  
在com.dawang.wechat.neiwei.controller.WechatController这句话中搜索WechatController是无法搜索到的

举例：  I  love  you  com.dawang.wechat.neiwei.controller.WechatController 
 
 elasticsearch进行分词，结果如下

分词词根
I
love
you
com.dawang.wechat.neiwei.controller.WechatController 

docker node update --label-add logstash=logstash elk2-prod && docker node update --label-add logstash=logstash elk3-prod  


docker node update --label-add elasticsearch=elasticsearch elk1-prod && \
   docker node update --label-add elasticsearch=elasticsearch elk2-prod && \
   docker node update --label-add elasticsearch=elasticsearch elk3-prod


^# User@Host: %{USER:mysql.slowlog.user}(\[[^\]]+\])? @ %{HOSTNAME:mysql.slowlog.host} \[(%{IP:mysql.slowlog.ip})?\](\s*Id:\s* %{NUMBER:mysql.slowlog.id})?\n# Query_time: %{NUMBER:mysql.slowlog.query_time.sec}\s* Lock_time: %{NUMBER:mysql.slowlog.lock_time.sec}\s* Rows_sent: %{NUMBER:mysql.slowlog.rows_sent}\s* Rows_examined: %{NUMBER:mysql.slowlog.rows_examined}\n(SET timestamp=%{NUMBER:mysql.slowlog.timestamp};\n)?%{GREEDYMULTILINE:mysql.slowlog.query}
(?m)^# Time:.*\s+# User@Host: %{USER:user}\[[^\]]+\] @ (?:(?<clienthost>\S*) )?\[(?:%{IP:clientip})?\]\s*Id: %{NUMBER:id:int}\s+# Query_time: %{NUMBER:query_time:float}\s+Lock_time: %{NUMBER:lock_time:float}\s+Rows_sent: %{NUMBER:rows_sent:int}\s+Rows_examined: %{NUMBER:rows_examined:int}\s*(?:use %{DATA:database};\s*)?SET timestamp=%{NUMBER:timestamp};\s*(?<query>(?<action>\w+)\s+.*)$