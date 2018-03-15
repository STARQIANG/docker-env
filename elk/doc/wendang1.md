match_all : match_all 查询简单的 匹配所有文档。在没有指定查询方式时，它是默认的查询：
{ "match_all": {}}
match : 无论你在任何字段上进行的是全文搜索还是精确查询，match 查询是你可用的标准查询。
{ "match": { "tweet": "About Search" }}
multi_match: 查询可以在多个字段上执行相同的 match 查询：
{
    "multi_match": {
        "query":    "full text search",
        "fields":   [ "title", "body" ]
    }
}
range 查询找出那些落在指定区间内的数字或者时间
{
    "range": {
        "age": {
            "gte":  20,
            "lt":   30
        }
    }
}
term 查询被用于精确值 匹配，这些精确值可能是数字、时间、布尔或者那些 not_analyzed 的字符串：
{ "term": { "age":    26           }}
{ "term": { "date":   "2014-09-01" }}
{ "term": { "public": true         }}
{ "term": { "tag":    "full_text"  }}
terms 查询和 term 查询一样，但它允许你指定多值进行匹配。如果这个字段包含了指定值中的任何一个值，那么这个文档满足条件：
{ "terms": { "tag": [ "search", "full_text", "nosql" ] }}
exists 查询和 
missing 查询被用于查找那些指定字段中有值 (exists) 或无值 (missing) 的文档。这与SQL中的 IS_NULL (missing) 和 NOT IS_NULL (exists) 在本质上具有共性：

{
    "exists":   {
        "field":    "title"
    }
}

组合多查询
must  文档必须匹配这些条件才能被包含进来。
must_not 文档 必须不 匹配这些条件才能被包含进来。
should  如果满足这些语句中的任意语句，将增加 _score ，否则，无任何影响。它们主要用于修正每个文档的相关性得分
filter  必须匹配，但它以不评分、过滤模式来进行。这些语句对评分没有贡献，只是根据过滤标准来排除或包含文档。
bool   查询就将各个得分进行合并并且返回一个代表整个布尔操作的得分


动作 
 query
 sort 
"sort": {
  "dates": {
      "order": "asc",
      "mode":  "min"
  }
{
    "from": 90,
    "size": 10``
}
 



{
   "bool" : {
      "must" :     [],
      "should" :   [],
      "must_not" : [],
   }
}
must
所有的语句都 必须（must） 匹配，与 AND 等价。
must_not
所有的语句都 不能（must not） 匹配，与 NOT 等价。
should
至少有一个语句要匹配，与 OR 等价。



GET /my_index/my_type/_search
{
    "query": {
        "match": {
            "title": {      
                "query":    "BROWN DOG!",
                "operator": "and"
            }
        }
    }
}
短语匹配编辑
就像 match 查询对于标准全文检索是一种最常用的查询一样，当你想找到彼此邻近搜索词的查询方法时，就会想到 match_phrase 查询 。
GET /my_index/my_type/_search
{
    "query": {
        "match_phrase": {
            "title": "quick brown fox"
        }
    }
}

match_phrase 查询同样可写成一种类型为 phrase 的 match 查询:

"match": {
    "title": {
        "query": "quick brown fox",
        "type":  "phrase"
    }
}

GET /my_index/my_type/_search
{
    "query": {
        "match_phrase": {
            "title": {
                "query": "quick fox",
                "slop":  1
            }
        }
    }
}
GET /my_index/address/_search
{
    "query": {
        "regexp": {
            "postcode": "W[0-9].+" 
        }
    }
}



{
  "query": {
     "match_all|multi_match|match|match_phrase|term|terms|regexp|range|exists|missing|bool"
  },
  "from": 30,
  "size": 10,
  "aggs" : {
    "all_interests" : {
        "terms" : { "field" : "interests.keyword" },
        "aggs" : {
            "avg_age" : {
                "avg" : { "field" : "age" }
            }
        }
    }
   },
  "sort": {
     "dates": {
         "order": "asc",
         "mode":  "min"
     }
  }  
}

slop 参数告诉 match_phrase 查询词条相隔多远时仍然能将文档视为匹配 。 相隔多远的意思是为了让查询和文档匹配你需要移动词条多少次？

需求一

 搜索

需求二




GET nginx-app-lms_web-*/_search
{
  "size": 0,
  "query": {
    "bool": {
       "must": [
         {
           "match": {
             "status": 200
           }
         }
       ],
       "must_not": [
         {
             "regexp" : {
                "url" : ".*app.*"
              }
         }
       ], 
       "filter": {
         "range": {
           "request_time": {
             "lte": 10
           }
         }
       }
    }
  },
  "aggs": {
    "aggs_url":{
      "terms": {
        "field": "url.keyword",
        "size": 10000,
        "min_doc_count": 100, 
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
        "avg_request_time_bucket_filter": {
          "bucket_selector": {
            "buckets_path": {
              "avg_request_time": "avg_request_time"
            },
            "script":  "params.avg_request_time>2"
          }
        }
      }
    }
  }
}
  
  
  
GET nginx-app-lms_web-*/_search
{
  "size": 0,
  "query": {
    "bool": {
       "must": [
         {
           "match": {
             "status": 200
           }
         }
       ],
       "must_not": [
         {
             "regexp" : {
                "url" : ".*app.*"
              }
         }
       ], 
       "filter": {
         "range": {
           "request_time": {
             "lte": 10
           }
         }
       }
    }
  },
  "aggs": {
    "aggs_url":{
      "terms": {
        "field": "url.keyword",
        "size": 10000,
        "min_doc_count": 100, 
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
        "load_request_time": {
          "percentiles": {
            "field": "request_time",
            "percents": [
              1,
              5,
              25,
              50,
              75,
              95,
              99
            ]
          }
        },
        "avg_request_time_bucket_filter": {
          "bucket_selector": {
            "buckets_path": {
              "avg_request_time": "avg_request_time"
            },
            "script":  "params.avg_request_time>2"
          }
        }
      }
    }
  }
}



def path = doc['url.keyword'].value;
if ( path =~ /.*\/[0-9]*$/) { 
    int lastSlashIndex = path.lastIndexOf('/');
    if (lastSlashIndex > 0) {
      return path.substring(0,(lastSlashIndex+1));
    }
    return path;
} else {
     return path;
}
def path = doc['url.keyword'].value; if ( path =~ /.*\/[0-9]*$/) {  int lastSlashIndex = path.lastIndexOf('/'); if (lastSlashIndex > 0) { return path.substring(0,(lastSlashIndex+1));} return path; } else { return path;}