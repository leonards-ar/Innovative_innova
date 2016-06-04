dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "vitaflo"
	password = "java1234"
  properties {
          maxActive = 5
          maxIdle = 2
          minIdle = 1
          initialSize = 1
          minEvictableIdleTimeMillis = 60000
          timeBetweenEvictionRunsMillis = 60000
          maxWait = 10000
          validationQuery = "select 1 from dual"
      }
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
                    // dbCreate = "create-drop" // one of 'create', 'create-drop','update'
                    dbCreate = 'update'
                    url = "jdbc:mysql://spmdb/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8"
		}
                hibernate {
                    show_sql=true
                }
	}
	test {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	vitaflo {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
        properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
                validationQuery = "select 1 from dual"
            }          
		}
	}

	innova {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"

        properties {
              maxActive = 50
              maxIdle = 25
              minIdle = 5
              initialSize = 5
              minEvictableIdleTimeMillis = 60000
              timeBetweenEvictionRunsMillis = 60000
              maxWait = 10000
              validationQuery = "select 1 from dual"
          }
		}
	}
}
